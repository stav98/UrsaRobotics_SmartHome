#!/usr/bin/env python3

import paho.mqtt.client as mqtt
import time, os, subprocess
from urllib.parse import urlencode
#Απαιτεί την βιβλιοθήκη PyAudio
import speech_recognition as sr

broker_address = "127.0.0.1"
broker_portno = 1883
client = mqtt.Client()

voice = 'ONLINE'
#voice = 'OFFLINE'
DELAY = 0.5
LISTEN_WAIT = 20 #Ο χρόνος αναμονής για φωνητική εντολή σε sec.
flag1 = flag2 = False

#Τα topics που θα κάνει subscribe
topic_en = "livingroom/button1"
topic1 = "wc/thermo_temp"
topic2 = "extern/temp"
topic3 = "intern/temp"
temp_water = temp_ext = temp_int = 0

def getGoogleSpeechURL(phrase):
    googleTranslateURL = "http://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&tl=el&"
    parameters = {'q': phrase}
    data = urlencode(parameters)
    googleTranslateURL = "%s%s" % (googleTranslateURL,data)
    return googleTranslateURL

def speakSpeechFromText(phrase):
    if voice == 'ONLINE':
        googleSpeechURL = getGoogleSpeechURL(phrase)
        print(googleSpeechURL)
        subprocess.call(["mplayer", "-af", "volume=5", googleSpeechURL], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        #subprocess.Popen(["mplayer", "-really-quiet", googleSpeechURL], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    elif voice == 'OFFLINE':
        subprocess.call(["espeak", "-vel+m5", "-s 130", phrase], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

def pubCommand(topic, msg):
    subprocess.call(["mosquitto_pub", "-d", "-t", topic, "-m", msg], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

def on_message(client, userdata, message):
    global temp_water, temp_ext, temp_int, flag1
    mp = message.payload.decode()
    mt = message.topic
    print(mt)
    print(mp)
    #Αν πατήθηκε το κουμπί
    if mt == topic_en:
        #Και το payload είναι 'True'
        if mp == 'True':
            print('stop')
            flag1 = True #Σταμάτα το mqtt loop και πήγαινε στην ακρόαση φωνής
    elif mt == topic1:
        temp_water = mp
    elif mt == topic2:
        temp_ext = mp
    elif mt == topic3:
        temp_int = mp

#Προετοιμασία του mqtt client
client.on_message = on_message
client.connect(broker_address, broker_portno)
client.subscribe(topic_en)
client.subscribe(topic1)
client.subscribe(topic2)
client.subscribe(topic3)

def wait_for_message(d):
    client.loop_start()
    time.sleep(d)
    client.loop_stop()

#Για πάντα
while True:
    #client.loop_stop()
    client.loop_start()#Ξεκίνα το loop
    while not flag1: #Μπλοκάρισε μέχρι να πατηθεί το κουμπί
        time.sleep(.2)
    client.loop_stop() #Σταμάτα το loop
    flag1 = flag2 = False
    time.sleep(2) #Περίμενε να πει το μήνυμα "Σας ακούω" από το tts.py
    oldtime = time.time() #Κράτα την τρέχουσα τιμή χρόνου
    #Αν δεν πέρασε ο χρόνος ακρόασης ή δεν αναγνωρίστηκε σωστά κάποια εντολή
    while (time.time() - oldtime) < LISTEN_WAIT and not flag2:
        # Ηχογράφησε από το μικρόφωνο
        r = sr.Recognizer()
        with sr.Microphone(device_index=2) as source:
            #r.adjust_for_ambient_noise(source, duration=2)
            r.energy_threshold = 4000
            r.dynamic_energy_threshold = True
            print("Δώσε εντολή: ")
            audio = r.listen(source)
            #try:
                #audio = r.listen(source, timeout=10)
                #
            #except:
                #print('Timeout')

        # Αναγνώρισε την ομιλία χρησιμοποιώντας την μηχανή της Google
        try:
            # Χωρίς API KEY
            #s = r.recognize_google(audio, language="el-GR") #Αν δεν βάλω key τότε χρησιμοποιεί κάποιο default
            # Με API KEY
            s = r.recognize_google(audio, language="el-GR", key="YOUR GOOGLE API KEY")
            s = s.upper() #Μετατροπή σε κεφαλαίους χαρακτήρες
            print("Είπες: " + s) #Debug
            # Αν ξεκινάει η πρόταση με την λέξη 'ΣΠΙΤΙ'
            if 'ΣΠΊΤ' in s:
                #Αν υπάρχει η λέξη 'ΘΕΡΜΟΣΙΦΩΝΑ' τότε θα εξετάσει εντολές θερμοσίφωνα
                if 'ΘΕΡΜΟΣΊΦΩΝ' in s:
                    if 'ΆΝΑΨ' in s:
                        print('Thermosifon open') #Debug
                        pubCommand("wc/thermo_switch", "ON")
                        flag2 = True
                    elif ('ΚΛΕΊΣ' in s) or ('ΣΒΉΣ' in s):
                        print('Thermosifon close') #Debug
                        pubCommand("wc/thermo_switch", "OFF")
                        flag2 = True
                    else:
                        speakSpeechFromText("Δεν ξέρω τι να κάνω με τον θερμοσίφωνα.")
                        flag2 = True
                #Αν υπάρχει η λέξη 'ΘΕΡΜΟΚΡΑΣΙΑ' τότε θα μας ενημερώσει για τις τρέχουσες θερμοκρασίες
                elif 'ΘΕΡΜΟΚΡΑΣ' in s:
                    if 'ΝΕΡΟ' in s:
                        print('Water Tempetature.')
                        #wait_for_message(DELAY)
                        speakSpeechFromText("Η θερμοκρασία νερού είναι " + temp_water + " βαθμοί.")
                        flag2 = True
                    elif ('ΕΞΩΤΕΡ' in s) or ('ΈΞΩ' in s):
                        print('Out Tempetature.')
                        #wait_for_message(DELAY)
                        speakSpeechFromText("Η εξωτερική θερμοκρασία είναι " + temp_ext + " βαθμοί.")
                        flag2 = True
                    elif ('ΕΣΩΤΕΡ' in s) or ('ΜΈΣΑ' in s) or ('ΕΝΤΌ' in s):
                        print('In Tempetature.')
                        #wait_for_message(DELAY)
                        speakSpeechFromText("Η εσωτερική θερμοκρασία είναι " + temp_int + " βαθμοί.")
                        flag2 = True

            else:
                print('Not a Keyword')
                speakSpeechFromText("Δεν ανιχνεύθηκε η λέξη κλειδί.")
                exit
        except sr.UnknownValueError:
            print("Δεν κατάλαβα τι είπες....")
            speakSpeechFromText("Δεν κατάλαβα τι είπες.")
            s=""
        except sr.RequestError as e:
            print("Δεν μπορώ να ζητήσω δεδομένα από την υπηρεσία αναγνώρισης φωνής {0}".format(e))
    print("Listening END.")
    if not flag2:
        speakSpeechFromText("Ξαναπατήστε το κουμπί παρακαλώ.")



