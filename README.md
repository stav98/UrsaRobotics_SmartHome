Σ' αυτό το αποθετήριο θα δημοσιεύονται τα σχέδια και ο κώδικας του έργου Έξυπνο Σπίτι Ανοιχτών Τεχνολογιών. 
----------------------------------------------------------------------------------------------------------

Ομάδα: Ursa Robotics
Σχολείο: 1ο ΕΠΑ.Λ. Πρέβεζας
Τίτλος έργου: Έξυπνο Σπίτι Ανοιχτών Τεχνολογιών 

Περιγραφή έργου
===============
Η ομάδα μας θα κατασκευάσει μακέτα διώροφου σπιτιού (μεζονέτα) όπου θα φαίνονται όλες οι ηλεκτρικές συσκευές – εξαρτήματα των οποίων είναι δυνατός ο τηλεχειρισμός. Μερικές από αυτές τις συσκευές είναι:
1.	Φωτισμός
2.	Πρίζες
3.	Θερμοσίφωνας και εποπτεία θερμοκρασίας νερού
4.	Θερμόμετρα χώρου
5.	Μετρητής υγρασίας χώρου
6.	Έλεγχος σκίασης παραθύρων 
7.	Θερμαντικά σώματα
8.	Έλεγχος θυρών-παραθύρων (ανοικτό-κλειστό)
9.	Έλεγχος κλιματισμού
10.	Μέτρηση της καταναλισκόμενης ενέργειας  

Το έργο μπορεί να χρησιμοποιηθεί ως εποπτικό μέσο για την διδασκαλία των τεχνολογιών IOT σε μαθητές πληροφορικής, ηλεκτρονικής και ηλεκτρολογίας.

Για τον ρόλο του πελάτη (MQTT client) θα χρησιμοποιήσουμε ένα module με το γνωστό chip ESP-8266. Στο module θα συνδέονται:  
•	οι ενεργοποιητές όπως ηλεκτρονόμοι (relays), κινητήρες   
•	οι αισθητήρες όπως θερμόμετρα, φωτοαντιστάσεις, ειδικοί αισθητήρες υγρασίας πίεσης κλπ.

Το συγκεκριμένο module διαθέτει ισχυρό μικροελεγκτή τεχνολογίας 32bit με πληθώρα περιφερειακών και επικοινωνία μέσω WiFi 802.11n. Εναλλακτικά μπορεί να χρησιμοποιηθεί το εξελιγμένο ESP-32 το οποίο είναι πολύ ισχυρότερο.

Αν και για το ESP-8266 υπάρχει toolchain για προγραμματισμό μέσω Arduino IDE εμείς θα τα προγραμματίσουμε σε microPython. Πρόκειται για μια περιορισμένη έκδοση της Python 3.x ειδικά σχεδιασμένη για μικροελεγκτές. Ο λόγος που επιλέξαμε την Python αντί της wiring (C++), είναι γιατί αυτή διδάσκεται στον τομέα πληροφορικής του ΕΠΑΛ.

Επειδή το ESP-8266 δεν διαθέτει αρκετές θύρες εισόδου-εξόδου για τον έλεγχο όλων των συσκευών της μακέτας, θα χρησιμοποιήσουμε ένα arduino micro ως port expander. Το arduino θα λειτουργεί ως I2C slave και θα επικοινωνεί με το ESP-8266 μέσω του διαύλου I2C. Ο προγραμματισμός του arduino θα γίνει σε γλώσσα wiring. 

Το ESP-8266 θα επικοινωνεί μέσω wifi με ένα Raspberry PI 3 το οποίο θα λειτουργεί ως MQTT broker. Στο Raspberry είναι εγκατεστημένο το mosquitto το οποίο είναι ένας open source MQTT broker και το OpenHab2 το οποίο είναι το λογισμικό του server για τον έλεγχο του έξυπνου σπιτιού.

Από έναν υπολογιστή πελάτη μέσω πρωτοκόλλου HTTP μπορούμε με ένα κοινό Browser να εποπτεύσουμε ή να ελέγξουμε όλες τις συσκευές IOT του σπιτιού.

Επίσης το ίδιο μπορεί να γίνει από ένα smartphone με την ειδική εφαρμογή η οποία επικοινωνεί με το server OpenHab.

Ακολουθεί το block διάγραμμα της κατασκευής
![alt text](https://github.com/stav98/UrsaRobotics_SmartHome/blob/master/iot1.png)

Φυσικά είναι δυνατή η πρόσβαση από τον έξω κόσμο, μέσω Internet εγκαθιστώντας μια σύνδεση VPN, μεταξύ του Raspberry και ενός smart phone.

Επίσης μπορεί το raspberry να λειτουργεί ως MQTT gateway και να συνεργαστεί με άλλες πλατφόρμες IOT που υπάρχουν στο διαδίκτυο, όπως το Alexa της Amazon. 

Πίνακας βασικών υλικών
======================

|Α/Α|   Τύπος	                                  | Ποσότητα|
|:--:|-------------------------------------------|:-------:|
| 1	| Raspberry PI 3	                           |    1    |
| 2	| ESP-12E ή Node MCU	                       |    1    |
| 3	| Arduino mini	                             |    1    |
| 4	| LED 5mm λευκά	                            |   10    |
| 5	| Relays 5V	                                |    3    |
| 6	| Αισθητήρας BME 280	                       |    1    |
| 7	| Servo MG-90	                              |    2    |
| 8	| Κάρτα MicroSD 16G για Raspberry	          |    1    |
| 9	| Transistor NPN BC547C	                    |   10    |
|10	| Θερμόμετρο DS18B20	                       |    4    |
|11	| Διάφορα εξαρτήματα (πυκνωτές, αντιστάτες) |	        |
|12	| Μαγνητικές επαφές συναγερμών	             |    4    |
|13	| Διάτρητη πλακέτα Perfboard για συνδέσεις	 |    2    |  

Σύνδεσμοι λογισμικού που θα χρησιμοποιήσουμε
============================================
Micro Python: https://github.com/micropython/micropython/tree/master/ports/esp8266<br/>
Open Hab: https://www.openhab.org/docs/installation/rasppi.html<br/>
Arduino: https://www.arduino.cc/<br/>
Mosquitto: https://mosquitto.org/<br/>


