import machine

#====================== I2C Addresses ==================================================
EXP_ADDR = 8 #Η διεύθυνση I2C για το Arduino expander

#====================== Σταθερές =======================================================
LOW = False
HIGH = True
PULLUP = True
PULLDOWN = False
TIK_TIME = 125 #Κάθε πόσο ο timer θα ελέγχει τους ψηφιακούς διακόπτες π.χ. button, μαγν. επαφές
TIMES_TO_SEC = 1000 / TIK_TIME #Κάθε 1sec θα ελέγχει τους αισθητήρες

#====================== Pin Definitions ================================================
WiFi_LED = machine.Pin(2, machine.Pin.OUT) #Το buildin Led ανάβει αν υπάρχει σύνδεση WiFi
CLOSE_PIN = machine.Pin(13, machine.Pin.OUT) #Red Anode of RGB Led
OPEN_PIN = machine.Pin(14, machine.Pin.OUT) #Green Anode
IDLE_PIN = machine.Pin(15, machine.Pin.OUT) #Blue Anode

OW1_DATA = machine.Pin(12)
OW2_DATA = machine.Pin(14)

CLOSE_PIN.value(LOW)
OPEN_PIN.value(LOW)
IDLE_PIN.value(LOW)

'''inp1 = machine.Pin(14, machine.Pin.IN, machine.Pin.PULL_UP)
inp2 = machine.Pin(13, machine.Pin.IN, machine.Pin.PULL_UP)'''
WiFi_LED.value(HIGH)    #Με High σβήνει γιατί συνδέεται η κάθοδος στο pin

#====================== WiFi Definitions =================================================
ESSID = 'SmartHome'
CHANNEL = 4

#====================== Καθολικές μεταβλητές =============================================
c = None  #Το αντικείμενο του MQTT client

#sw1 = inp1.value()
#sw2 = inp2.value()
#sw2 = not sw2
sensor_state = 0  #Διαβάζει το θερμόμετρο 1, μετά το θερμ. 2 και μετά την τιμή ADC δηλ. ένταση ηλικού φωτός
t1 = t2 = t3 = 0 #Τιμές θερμομέτρων
hum = pres = l_intens = sun_intens = pv_volts = 0
adc_value = 0 #Τιμή ADC από 0 έως 1023
sol_voltage = 0 #Μετατροπή τιμής ADC σε τάση 0-5V
c_loop_time = 0

#Δικτυακές τιμές
hostIP = ''

#pins = [ WiFi_LED ,  pin16 ]
#keys = ['Led1'    , 'Led2' ]

  #++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #++++++++++++++++++++++++++++++ MQTT Topics +++++++++++++++++++++++++++++++++++++++++
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#============ Subdcribed Topics =============================
#----- Ψηφιακές έξοδοι -----------------
D_TOPIC1 = b"bedroom/priza1_switch"
D_TOPIC2 = b"livingroom/priza2_switch"
D_TOPIC3 = b"wc/thermo_switch"
D_TOPIC4 = b"garden/light_switch"
D_TOPIC5 = b"out/siren_switch"
d_topics = [D_TOPIC1, D_TOPIC2, D_TOPIC3, D_TOPIC4, D_TOPIC5]
d_pins = [10, 11, 12, 9, 17]

#----- Αναλογικές PWM έξοδοι
A_TOPIC1 = b"bedroom/light1_switch"
A_TOPIC2 = b"childroom/light2_switch"
A_TOPIC3 = b"trapezaria/light3_switch"
a_topics = [A_TOPIC1, A_TOPIC2, A_TOPIC3]
a_pins = [0, 1, 2]

#============ Publishing Topics ==============================
#------ Αναλογικές τιμές ----------------
P_TOPIC1 = b"wc/thermo_temp"
P_TOPIC2 = b"garden/light_sens"
P_TOPIC3 = b"extern/temp"
P_TOPIC4 = b"intern/temp"
P_TOPIC5 = b"intern/humid"
P_TOPIC6 = b"intern/pressure"
P_TOPIC7 = b"balkoni/tenta"
P_TOPIC8 = b"taratsa/pv"

#------ Ψηφιακές τιμές ------------------
P_TOPIC9 = b"bell/ringing"
P_TOPIC10 = b"kitchen/port"
P_TOPIC11 = b"main/port"

S_TOPIC1 = b"garaz/gate"
S_TOPIC2 = b"trapezaria/skiasi"
