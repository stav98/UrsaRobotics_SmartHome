#include <Wire.h>
#include <Servo.h>
#define I2C_ADDRESS       0x08  //Ορισμός της Slave Address

#define PWM_OFF            0

// Τα Pins με δυνατότητα PWM εξόδου στο Arduino NANO
#define PWM_0              3
#define PWM_1              5
#define PWM_2              6
#define PWM_3              9
#define PWM_4              10
#define PWM_5              11

// Τα Pins με δυνατότητα Αναλογικής εισόδου στο Arduino NANO
#define ANALOG_0           A0
#define ANALOG_1           A1
#define ANALOG_2           A2
#define ANALOG_3           A3
#define ANALOG_4           A4
#define ANALOG_5           A5
#define ANALOG_6           A6  //Μόνο αναλογική είσοδος
#define ANALOG_7           A7  //Μόνο αναλογική είσοδος

byte analog_in[] = {ANALOG_0, ANALOG_1, ANALOG_2, ANALOG_3, ANALOG_4, ANALOG_5, ANALOG_6, ANALOG_7};
byte analog_idx; //Δείκτης στον πίνακα με τις αναλογικές εισόδους
byte analog_out[] = {PWM_0, PWM_1, PWM_2, PWM_3, PWM_4, PWM_5};
byte pwm_idx; //Δείκτης στον πίνακα με τις εξόδους PWM

//D0, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, A0, A1, A2, A3, A4, A5 
// 0,  1,  2,  3,  4,  5,  6,  7,  8,  9,  10,  11,  12,  13, 14, 15, 16, 17, 18, 19

//Καθολικές μεταβλητές
byte state = 0;
unsigned int av;
byte avh, avl;
byte dv;
boolean sen = false;
byte r, deg;

Servo myservo;

void setup() 
  {
   Wire.begin(I2C_ADDRESS);      //Σύνδεση στο I2C bus με διεύθυνση π.χ. 8
   Wire.onReceive(receiveEvent); //Καταχώρησε το συμβάν onReceive
   Wire.onRequest(requestEvent); //Καταχώρησε το συμβάν onRequest
   Serial.begin(115200);         //Σειριακή για Debug
  }

void loop() 
  {
   if (sen)
    {
     myservo.attach(r);
     myservo.write(deg);
     delay(2000);
     myservo.detach();
     sen = false;
    }
   delay(100);
  }

//Εκτελείται όταν λάβει δεδομένα από τον Master
void receiveEvent(int howMany) 
   {
    byte buf[10], i = 0;
    boolean pull_up, val;
    //Serial.println(howMany);
    while (Wire.available() > 0) //Διάβασε όλα τα bytes. Το Wire.available() επιστρέφει τον αριθμό των διαθέσιμων bytes
          { 
           byte x = Wire.read(); //Διάβασε ένα - ένα τα bytes
           //Serial.println(x); //Debug - Εμφάνισε τον χαρακτήρα 
           buf[i++] = x;
          }
    byte x = buf[0];    //Πάρε το 1ο byte το οποίο περιέχει την εντολή
    //Serial.println(x);    //Debug - Εμφάνισε
    byte cid, reg;
    cid = x & 0b11100000; //Τα 3 πιο σημαντικά bits είναι η ο κωδικός εντολής
    cid = cid >> 5; //Να ολισθήσουν δεξιά κατά 5 bits
    //Serial.println(cid);  //Debug
    switch (cid)
      {
       //Διάβασε Αναλογική τιμή από αναλογικό pin [0-7] (Bytes από Master: 1 - Απάντηση: 2 bytes) 
       case 0: //000
           reg = x & 0b00000111;
           analog_idx = reg;
           av = analogRead(analog_in[analog_idx]);
           avl  = ((byte)(av & 0b11111111));
           avh =  ((byte)((av >> 8) & 0b00000011));
           //Serial.println("---");
           state = 1;
           break;
       //Διάβασε Ψηφιακή κατάσταση από ψηφιακό pin [0-19] (Bytes από Master: 2 - Απάντηση: 1 byte)
       //001pxxxx, xxxddddd  [p: pullup (0/1), x: αδιάφορο, ddddd: ψηφιακό pin 0-19]
       case 1: //001
           reg = (byte) buf[1];
           reg = reg & 0b00011111;
           pull_up = x & 0b00010000;
           if (pull_up)
               pinMode(reg, INPUT_PULLUP); //Είναι Pull Up
           else
               pinMode(reg, INPUT); //Είναι Pull Down
           dv = digitalRead(reg);
           state = 2;
           break;
       //Γράψε Αναλογική τιμή (0-255) σε PWM Pin [0-5] (Bytes από Master: 2 - Απάντηση: -)
       case 2: //010
           reg = x & 0b00000111;
           pwm_idx = reg;
           pinMode(analog_out[pwm_idx], OUTPUT);
           analogWrite(analog_out[pwm_idx], (byte) buf[1]);
           break;
       //Γράψε Ψηφιακή κατάσταση σε ψηφιακό pin [0-19] (Bytes από Master: 2 - Απάντηση: -)
       //011vxxxx, xxxddddd  [v: κατάσταση (0/1), x: αδιάφορο, ddddd: ψηφιακό pin 0-19]
       case 3: //011
           reg = (byte) buf[1];
           reg = reg & 0b00011111;
           val = x & 0b00010000;
           pinMode(reg, OUTPUT);
           digitalWrite(reg, val);
           break;
       //Κίνησε servo σε ψηφιακό pin [0-19] (Bytes από Master: 2 - Απάντηση: -)
       //100ddddd, 0-180deg  [x: αδιάφορο, ddddd: ψηφιακό pin 0-19]
       case 4: //100
           reg = x & 0b00011111;
           sen = true;
           r = reg;
           deg = (byte) buf[1];
           break; 
      }
   }

void move_servo(byte pin, byte angle)
{
  myservo.attach(pin);
  myservo.write(angle);
  delay(2000);
  myservo.detach();
}

//Εκτελείται όταν ο Master ζητάει δεδομένα από τον Slave
void requestEvent() 
   {
    if (state == 1) //Απαντάει με 2 bytes
       {
        Serial.println(avl);
        //Serial.println(avh);
        Wire.write(avl);
        Wire.write(avh);
        
       }
    else if (state == 2) //Απαντάει με 1 byte
       {
        Wire.write(dv);
       }
    state = 0;
   }
