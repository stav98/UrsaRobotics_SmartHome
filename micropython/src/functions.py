import definitions as df
import machine, ustruct

i2c = machine.I2C(scl=machine.Pin(5), sda=machine.Pin(4), freq=400000) #Πάει και 1000000


#Γράψε σε ψηφιακή έξοδο
#011vxxxx, xxxddddd : 011=Write Digital, v=0/1 (LOW/HIGH), x=αδιάφορο, ddddd = Ψηφιακή έξοδος 0-19
def digitalWrite(pin, value):
    cmd = 0b01100000 #Η εντολή
    if value:
        v = 0b00010000 #High
    else:
        v = 0b00000000 #Low
    reg = pin & 31
    tmp = cmd | v
    i2c.writeto(df.EXP_ADDR, ustruct.pack('>BB', tmp, reg)) 

#Γράψε σε PWM έξοδο
#010xxaaa : 010=Write Analog, x=N.C., xaaa = Αναλογική έξοδος 0-5
#τιμή 0-255
def analogWrite(pin, value):
    cmd = 0b01000000 #Η εντολή
    reg = pin & 7
    tmp = cmd | reg
    i2c.writeto(df.EXP_ADDR, ustruct.pack('>BB', tmp, value)) 

#Διάβασε ψηφιακή είσοδο
#001pxxxx, xxxddddd : 001=Read Digital, p=1:pullup, x=αδιάφορο, ddddd = Ψηφιακή είσοδος 0-19
#Επιστρέφει 1 byte με τιμή 0 ή 1
def digitalRead(pin, mode):
    cmd = 0b00100000 #Η εντολή
    if mode == df.PULLUP:   #df.PULLUP
        v = 0b00010000 #Pullup
    else: #df.PULLDOWN
        v = 0b00000000 #Pulldown
    reg = pin & 31
    tmp = cmd | v 
    i2c.writeto(df.EXP_ADDR, ustruct.pack('>BB', tmp, reg))
    l = i2c.readfrom(df.EXP_ADDR, 1) #Διαβάζει binary data της μορφής b'\x01' για Ηigh
    if b'\x01' in l:
        return True
    elif b'\x00' in l:
        return False

#Διάβασε αναλογική είσοδο
#000xxaaa : 000=Read Analog, x=Αδιάφορο, aaa = αναλογική είσοδος 0-7
#Επιστρέφει 2 bytes με τιμή από 0 - 1023
def analogRead(pin):
    cmd = 0b00000000 #Η εντολή
    reg = pin & 7
    tmp = cmd | reg
    i2c.writeto(df.EXP_ADDR, ustruct.pack('>B', tmp))
    l = i2c.readfrom(df.EXP_ADDR, 2) #Διαβάζει binary data της μορφής b'\xff\x03' για 1023 δεκαδικό
    t = ustruct.unpack("h", l)
    return t[0]
    
#Γράψε σε τιμή περιστροφής σε servo
#100sssss : 100=Write to servo, sssss = Servo Attach Pin 
#τιμή 0-180
def servoWrite(pin, value):
    cmd = 0b10000000 #Η εντολή
    reg = pin & 31
    tmp = cmd | reg
    i2c.writeto(df.EXP_ADDR, ustruct.pack('>BB', tmp, value)) 

    
#Κλάση Button για έλεγχο των push buttons 
class Button:
    def __init__(self, id, func_name, func_name_long):
        self.id = id
        self.func_name = func_name
        self.func_name_long = func_name_long
        self.ticks = 1
        self.longticks = 7
        self.__cnt = 0      #Στατικές μεταβλητές
        self.__state = 0   

    def tick(self):
        #Αν το κουμπί είναι πατημένο
        if not digitalRead(self.id, df.PULLUP): 
            #Αν πατήθηκε 1η φορά
            if self.__state == 0:
                self.__state = 1
            #Αλλιώς αν έχει πατηθεί και συνεχίζει να είναι πατημένο
            elif self.__state == 1:
                #Αν έχει ξεπεράσει τον χρόνο για μακρό κλικ τότε κατάσταση παρατεταμένου κλικ
                if self.__cnt > self.longticks:
                    self.__state = 3 #Θέσε state σε 3
                    globals()[self.func_name_long]() #Κάλεσε την συνάρτηση εξυπηρέτησης
                self.__cnt += 1
        #Αλλιώς αν το κουμπί έχει ελευθερωθεί
        else:
            #Αν είχε πατηθεί
            if self.__state == 1:
                #Αν έχει ξεπεράσει τον χρόνο για απλό κλικ τότε κατάσταση απλού κλικ
                if self.__cnt > self.ticks:
                    self.__state = 2
                    globals()[self.func_name]()
            self.__state = 0
            self.__cnt = 0

#Κατασκευή των buttons και ορισμός των συναρτήσεων εξυπηρέτησης για click και pressed 
button1 = Button(16, 'button1_click', 'button1_pressed') #pin A2 ή D16
#button1.ticks = 1; button1.longticks = 7 #Χρόνοι για κάθε λειτουργία (Default)
bell_btn = Button(7, 'bell_btn_click', 'bell_btn_pressed') #pin D7
bell_btn.ticks = 0


def button1_click():
    print("Key1 pressed") #Debug
    df.c.publish(df.P_TOPIC12, "True")

button1_pr_state = False    
def button1_pressed():
    global button1_pr_state
    print("Key1 Long click") #Debug
    if not button1_pr_state:
        print("Play radio")
        df.c.publish(df.P_TOPIC13, "Play")
        button1_pr_state = True
    else:
        print("Stop radio")
        df.c.publish(df.P_TOPIC13, "Stop")
        button1_pr_state = False
    
def bell_btn_click():
    print("Bell pressed") #Debug
    df.c.publish(df.P_TOPIC9, "True")
    
def bell_btn_pressed():
    print("Bell Long click") #Debug
    
def isPortOpen(pin):
    if digitalRead(pin, df.PULLUP): 
        return True
    else:
        return False
