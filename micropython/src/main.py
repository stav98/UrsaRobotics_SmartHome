# -*- coding: utf-8 -*-
#Micropython on ESP8266 - Smart Home V0.1 (c)2019 Ursa Robotics 1st EPA.L. of Preveza
import machine, gc, time
print('\n=========== Ursa Robotics - Smart Home (c)2019 ===================')
machine.freq(160000000) #Να τρέχει στα 160MHz
print('[Initial free RAM:', gc.mem_free(), 'bytes]')

import os, network, esp, ustruct, onewire, ds18x20, ubinascii, bme280
from umqtt.simple import MQTTClient

#Αρχεία τα οποία ορίζονται μέσα στο έργο
import definitions as df
import functions as fn

esp.osdebug(None)  
esp.sleep_type(0) #esp.sleep_type(esp.SLEEP_NONE)

#Ορισμός timer
timer1 = machine.Timer(-1)
timer2 = machine.Timer(-1)

#Πληροφορίες για το μέγεθος της μνήμης Flash
print('[Program file system total :', os.statvfs("/")[0] * os.statvfs("/")[2], 'bytes]')
print('[Program file system free :', os.statvfs("/")[0] * os.statvfs("/")[3], 'bytes]')

#Δημιουρία αντικειμένων OneWire
ds1 = ds18x20.DS18X20(onewire.OneWire(df.OW1_DATA)) #Εξωτερικό θερμόμετρο
ds2 = ds18x20.DS18X20(onewire.OneWire(df.OW2_DATA)) #Εσωτερικό θερμόμετρο

#Εμφάνισε τα Id των θερμομέτρων 
roms_ext = ds1.scan()
hexstr = " ".join("%02x" % b for b in roms_ext[0])
print('[Found ow device in bus 1 with ID:', hexstr, ']')
roms_int = ds2.scan()
hexstr = " ".join("%02x" % b for b in roms_int[0])
print('[Found ow device in bus 2 with ID:', hexstr, ']')

bme = bme280.BME280(i2c=fn.i2c)
print('[Found I2C bus devices with IDs:', fn.i2c.scan(), ']')

#Προετοιασία αντικειμένου για διάβασμα από ADC
adc = machine.ADC(0)

#--------------------------------------------------------------------------------
#Αρχικοποίηση WiFi για STATION
#--------------------------------------------------------------------------------
sta_if = network.WLAN(network.STA_IF)
ap_if = network.WLAN(network.AP_IF)
ap_if.active(False)
if not sta_if.isconnected():
    print('Connect to WiFi as client ...')
    sta_if.active(True)
    sta_if.connect('Your SSID', 'Your WPA2 KEY')
    while not sta_if.isconnected():
        pass
#Αν το βάλω έχω στατική IP, αλλιώς δυναμική
sta_if.ifconfig(('192.168.42.121','255.255.255.0','192.168.42.5','192.168.42.5')) 
df.hostIP = sta_if.ifconfig()
print('[Setup IP address:', df.hostIP[0], ']')

'''
#--------------------------------------------------------------------------------
#Αρχικοποίηση WiFi για AP
#--------------------------------------------------------------------------------
network.phy_mode(1) #3Mbps για 1=b και 8-10Mbps για 2=g. Μέτρηση με iperf από σταθμό σε σταθμό
print('[Set phy mode to 802.11b :',network.phy_mode())
sta_if = network.WLAN(network.STA_IF)
sta_if.active(False) #Σε περίπτωση που είναι active το station mode και το τραβάει στο κανάλι του router
ap_if = network.WLAN(network.AP_IF)
ap_if.active(True)
#ap_if.config(essid=df.ESSID, authmode=network.AUTH_WPA_WPA2_PSK, password="abweweweweewcdef1", channel=13)
ap_if.config(essid=df.ESSID, authmode=network.AUTH_OPEN, password="", channel=df.CHANNEL)
#print(ap_if.status())
if ap_if.active():
    # Query params one by one
    print('[Set wifi in AP mode with ESSID:', ap_if.config('essid'), ']')
    print('[Set channel no:', ap_if.config('channel'), ']')
#Αν το βάλω έχω στατική IP, αλλιώς δυναμική
ap_if.ifconfig(('192.168.51.100','255.255.255.0','192.168.51.10','192.168.51.10'))
df.hostIP = ap_if.ifconfig()
print('[Setup IP address:', df.hostIP[0], ']')
'''

#Ο MQTT server όπου θα συνδεθεί
SERVER = "192.168.42.151"

#Η ταυτότητα αυτού του client
CLIENT_ID = b"ESP8266-" + ubinascii.hexlify(machine.unique_id())

def toggle(p):
    p.value(not p.value())

pag1 = pag2 = True
def read_sensor():
    global timer2_state, pag1, pag2
    #1ο Δευτερόλεπτο - Μέτρηση
    if df.sensor_state == 0: #1ο Θερμόμετρο
        try:
            #Η μέτρηση απαιτεί περίπου 750msec
            df.t1 = ds1.read_temp(roms_ext[0])
            df.t1 = int(round(df.t1, 0)) #Στρογγυλοποίηση μόνο σε ακέραιο
            ds1.convert_temp()
        except:
            df.t1 = 'Hot water Sensor Error'
        #Έλεγχος της 1ης παγίδας
        if fn.isPortOpen(2):
            if not pag1:
                df.c.publish(df.P_TOPIC10, "True")
                pag1 = True
        else:
            if pag1:
                df.c.publish(df.P_TOPIC10, "False")
                pag1 = False
    #2ο Δευτερόλεπτο - Μέτρηση
    elif df.sensor_state == 1: #2ο Θερμόμετρο
        try:
            #Η μέτρηση απαιτεί περίπου 750msec
            df.t2 = ds2.read_temp(roms_int[0])
            df.t2 = int(round(df.t2, 0)) #Στρογγυλοποίηση μόνο σε ακέραιο
            ds2.convert_temp()
        except:
            df.t2 = 'External Sensor Error'
        #Έλεγχος της 2ης παγίδας
        if fn.isPortOpen(4):
            if not pag2:
                df.c.publish(df.P_TOPIC11, "True")
                pag2 = True
        else:
            if pag2:
                df.c.publish(df.P_TOPIC11, "False")
                pag2 = False
    #3ο Δευτερόλεπτο - Μέτρηση και Δημοσίευση
    elif df.sensor_state == 2: #BME280 
        #print("values: ", bme.values) #Debug
        #Διάβασε τιμές από τον αισθητήρα
        t, p, h = bme.read_compensated_data()
        df.t3 = round((t/100), 1) #Εσωτερική θερμοκρασία από το BME280
        #---- Υγρασία ---------------
        hi = h // 1024  #Ακέραιο μέρος
        hd = h * 100 // 1024 - hi * 100  #Δεκαδικό μέρος
        if hd > 50: #Κάντο ακέραιο
            hi += 1
        df.hum = hi #Υγρασία
        #---- Ατμοσφαιρική πίεση -----
        p = p // 256
        pi = p // 100 #Ακέραιο
        pd = p - pi * 100 #Δεκαδικό από 00-99
        if pd > 50: #Να γίνει ακέραιο
            pi += 1
        df.pres = pi
        #Δημισίευση στα αντίστοιχα Topics
        df.c.publish(df.P_TOPIC1, str(df.t1))   #Θερμοκρασία θερμοσίφωνα
        df.c.publish(df.P_TOPIC3, str(df.t2))   #Εξωτερική θερμοκρασία
    #4ο Δευτερόλεπτο - Μέτρηση και Δημοσίευση
    elif df.sensor_state == 3:
        df.c.publish(df.P_TOPIC4, str(df.t3))   #Εσωτερική θερμοκρασία
        df.c.publish(df.P_TOPIC5, str(df.hum))  #Εσωτερική υγρασία
        df.c.publish(df.P_TOPIC6, str(df.pres)) #Ατμοσφαιρική πίεση
    #5ο Δευτερόλεπτο - Μέτρηση και Δημοσίευση
    elif df.sensor_state == 4:
        df.l_intens = fn.analogRead(1)
        df.c.publish(df.P_TOPIC2, str(df.l_intens)) #Αισθητήρας νυκτός
        df.sun_intens = fn.analogRead(6)
        df.c.publish(df.P_TOPIC7, str(df.sun_intens)) #Αισθητήρας ηλιακού φωτός για αυτόματη σκίαση
        df.pv_volts = fn.analogRead(7)
        df.c.publish(df.P_TOPIC8, str(df.pv_volts)) #Τάση στα άκρα του φωτοβολταϊκού με φορτίο 220Ω
    if df.sensor_state >= 4:
        df.sensor_state = 0
    else:
        df.sensor_state += 1
    #Εκτύπωση αποτελεσμάτων στη κονσόλα
    #print('Thermo Temp:', df.t1, '- Extern Temp:', df.t2) #Debug
    #print('Intern Temp:', df.t3, '- Humidity:', df.hum, '- Pressure:', df.pres)
    #print('Day Light Intensity:', df.l_intens)

tiks = 0      
#Ελέγχει τις ψηφιακές εισόδους και δημοσιεύει στο αντίστοιχο TOPIC
#Πρέπει να γίνεται γρήγορα με ρυθμό από 2 έ�