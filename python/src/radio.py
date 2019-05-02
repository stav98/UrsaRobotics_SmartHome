#!/usr/bin/env python3
#Για να λειτουργήσει απαιτείται sudo apt-get install mplayer
#Στο ~/.mplayer/config βάζω lirc=no
#Συνδέεται στον τοπικό mqtt broker ως client
import paho.mqtt.client as mqtt
import time, os, subprocess

broker_address = "127.0.0.1" #Διεύθυνση localhost εφόσον τρέχει στο Raspberry
broker_portno = 1883 #Πόρτα
client = mqtt.Client()

#---------- Καθολικές μεταβλητές ---------------------
pid = None #Το proccess ID ώστε να μπορούμε να το τερματίσουμε
topic = "home/playmusic"
station = "http://kissfm.live24.gr/kissfmathens"
#station = "http://galaxy.live24.gr/galaxy9292"

def play_radio():
    global pid
    with open(os.devnull, 'wb') as nul:
        pid = subprocess.Popen(['mplayer', '-really-quiet', station], stdin=nul,  stdout=subprocess.PIPE)
        #pid = subprocess.Popen(['mplayer','-msglevel',  'all=4',  station], stdin=nul,  stdout=subprocess.PIPE,  stderr=subprocess.STDOUT)

#Αν δεχθεί μήνυμα σε κάποιο topic που έχει κάνει subscribe
def on_message(client, userdata, message):
    global pid
    print(message.topic) #Debug
    print(message.payload.decode()) #Debug
    if message.topic == topic and message.payload.decode() == "Play":
        if not pid:
            play_radio()
    elif message.topic == topic and message.payload.decode() == "Stop":
        pid.terminate()
        pid = None
#----------------------------- Κυρίως πρόγραμμα --------------------------------
print("===== Radio Starting =====")

#Ορισμός συνάρτησης εξυπηρέτησης αν δεχθεί μήνυμα
client.on_message = on_message
#Σύνδεση με mqtt broker
client.connect(broker_address, broker_portno)
#Συνδρομή στα topics
client.subscribe(topic)
#Περίμενε μήνυμα για πάντα
client.loop_forever()

