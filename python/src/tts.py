#!/usr/bin/env python3
#Συνδέεται στον τοπικό mqtt broker ως client
import paho.mqtt.client as mqtt
import time, os, subprocess
from urllib.parse import urlencode

broker_address = "127.0.0.1" #Διεύθυνση localhost εφόσον τρέχει στο Raspberry
broker_portno = 1883 #Πόρτα
client = mqtt.Client()

#---------- Καθολικές μεταβλητές ---------------------
#Επιλέξτε αν θα είναι online ή offline
voice = 'ONLINE'
#voice = 'OFFLINE'
topics = {} #Λεξικό με τα topics αρχικά κενό

#  Η συνάρτηση κατασκευάζει το URL με τα δεδομένα που πρέπει να υποβληθούν στην Google
# ώστε να γίνει η μετατροπή σε αρχείο ήχου. Επιστρέφει URL με το αρχείο ήχου που πρέπει
# να αναπαράγει το mplayer.
def getGoogleSpeechURL(phrase):
    googleTranslateURL = "http://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&tl=el&"
    parameters = {'q': phrase}
    data = urlencode(parameters)
    googleTranslateURL = "%s%s" % (googleTranslateURL,data)
    return googleTranslateURL

#  Η βασική συνάρτηση η οποία δέχεται την πρόταση σε κείμενο και καλεί εξωτερικά
# προγράμματα για την αναπαραγωγή του ήχου.
def speakSpeechFromText(phrase):
    #Αν είναι ONLINE στέλνει ένα URL στην Google και αυτή επιστρέφει αρχείο ήχου, το οποίο παίζει με το Mplayer
    if voice == 'ONLINE':
        googleSpeechURL = getGoogleSpeechURL(phrase)
        #print(googleSpeechURL)  #Debug
        subprocess.call(["mplayer", "-af", "volume=5", googleSpeechURL], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        #subprocess.Popen(["mplayer", "-really-quiet", googleSpeechURL], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    #Αν είναι OFFLINE τότε καλεί το espeak
    elif voice == 'OFFLINE':
        subprocess.call(["espeak", "-vel+m5", "-s 130", phrase], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

#Για δημοσίευση εντολών
def pubCommand(topic, msg):
    subprocess.call(["mosquitto_pub", "-d", "-t", topic, "-m", msg], shell=False, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

#Αν δεχθεί μήνυμα σε κάποιο topic που έχει κάνει subscribe
def on_message(client, userdata, message):
    print(message.topic) #Debug
    print(message.payload.decode()) #Debug
    s = topics[message.topic].split("|") #Χώρισε το payload αν βρεις '|'
    #Για όσες περιπτώσεις βρήκες
    for l in s:
        #Αν το payload που έστειλε ο broker ανήκει στην περίπτωση
        if message.payload.decode() in l:
            #Χώρισε την πρόταση κειμένου από την περίπτωση
            payload, phrase = l.split(":")
            #Μίλα
            speakSpeechFromText(phrase)
        
#----------------------------- Κυρίως πρόγραμμα --------------------------------
print("===== T.T.S. Starting =====")

#Διαβάζει topics και φράσεις ομιλίας από το αρχείο tts_topics.txt
print("Subscribing to topics from file:")
full_path = os.path.realpath(__file__)
dir_path = os.path.dirname(full_path)
filename = dir_path + "/tts_topics.txt"
file = open(filename, "r")
i = 1
for line in file:
    l = line.strip()
    if l[0] != '#':
        a, b = l.split("::") #Χώρισε το topic από το σύνθετο payload
        print(i, '. ', a, sep='') #Debug
        topics[a.strip()] = b
        i+=1
file.close()

#Ορισμός συνάρτησης εξυπηρέτησης αν δεχθεί μήνυμα
client.on_message = on_message
#Σύνδεση με mqtt broker
client.connect(broker_address, broker_portno)
#Συνδρομή στα topics που υπάρχουν στο λεξικό {topics}
for topic in topics:
    client.subscribe(topic)
#Περίμενε μήνυμα για πάντα
client.loop_forever()

