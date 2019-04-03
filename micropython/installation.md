Εγκατάσταση micropython σε ESP 8266 (nodemcu) - Linux
=====================================================
Αρχικά εγκαθιστούμε το esptool.py στην Python 3 με την εντολή pip3 install esptool ή σε Python 2 με pip install esptool. Πρέπει να έχετε εγκαταστήσει το pip3 ή το pip για την αντίστοιχη έκδοση της python. Για debian είναι τα πακέτα python3-pip και python-pip αντίστοιχα. 

Για να βρούμε τον κατάλογο εγκατάστασης του καταλόγου site-packages γράφουμε python3 -m site. Για debian μας ενδιαφέρει το ~/.local/lib/python3.5/site-packages. Πάμε σ’ αυτή την διαδρομή και δίνουμε python3 esptool.py για να δούμε αν λειτουργεί. Αν θέλουμε μπορούμε να το βάλουμε στο path.
Συνδέουμε το nodemcu με ένα καλώδιο σε μια θύρα USB του υπολογιστή μας. Με sudo dmesg | grep tty βρίσκουμε τις διαθέσιμες σειριακές θύρες του συστήματός μας.
[    0.000000] console [tty0] enabled
[    1.121904] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[   23.770219] systemd[1]: Created slice system-getty.slice.
[33120.106174] usb 2-5: cp210x converter now attached to ttyUSB0
Επειδή η πρώτη είναι η ενσωματωμένη της μητρικής κάρτας, εμάς μας αφορά η δεύτερη που είναι USB με όνομα ttyUSB0.
Γράφουμε μέσα από τον κατάλογο ~/.local/lib/python3.5/site-packages :
python3 esptool.py --port /dev/ttyUSB0 flash_id
και αν όλα πάνε καλά μας απαντάει το μέγεθος της μνήμης flash.
esptool.py v2.6
Serial port /dev/ttyUSB0
Connecting....
Detecting chip type... ESP8266
Chip is ESP8266EX
Features: WiFi
MAC: 84:f3:eb:18:34:3b
Uploading stub...
Running stub...
Stub running...
Manufacturer: 20
Device: 4016
Detected flash size: 4MB
Hard resetting via RTS pin...

Σβήνω το εγκατεστημένο firmware της flash με την εντολή :
python3 esptool.py --port /dev/ttyUSB0 erase_flash
και μας απαντάει:
esptool.py v2.6
Serial port /dev/ttyUSB0
Connecting....
Detecting chip type... ESP8266
Chip is ESP8266EX
Features: WiFi
MAC: 84:f3:eb:18:34:3b
Uploading stub...
Running stub...
Stub running...
Erasing flash (this may take a while)...
Chip erase completed successfully in 7.9s
Hard resetting via RTS pin...

Έπειτα κατεβάζουμε την τελευταία σταθερή έκδοση της micropython από το επίσημο site http://micropython.org/download#esp8266 . Η παρούσα έκδοση είναι η 20190125-v1.10.

Προγραμματίζουμε το νέο firmware που κατεβάσαμε με την εντολή:
python3 esptool.py --port /dev/ttyUSB0 --baud 115200 write_flash --flash_size=detect 0 ~/Downloads/esp8266-20190125-v1.10.bin
Και απαντάει:
esptool.py v2.6
Serial port /dev/ttyUSB0
Connecting....
Detecting chip type... ESP8266
Chip is ESP8266EX
Features: WiFi
MAC: 84:f3:eb:18:34:3b
Uploading stub...
Running stub...
Stub running...
Configuring flash size...
Auto-detected Flash size: 4MB
Flash params set to 0x0040
Compressed 615388 bytes to 399928...
Wrote 615388 bytes (399928 compressed) at 0x00000000 in 35.5 seconds (effective 138.7 kbit/s)...
Hash of data verified.

Leaving...
Hard resetting via RTS pin...

Ανοίγουμε ένα πρόγραμμα σειριακού τερματικού όπως το putty ή το picocom και δίνουμε σειριακή θύρα /dev/ttyUSB0 και ρυθμό 115200bps. Αφού ανοίξει πατάμε το κουμπί reset της πλακέτας και εμφανίζει:

Ή για picocom:
picocom -b 115200 -f n /dev/ttyUSB0
και τερματίζουμε με ctrl + A + X.

Εξετάζουμε τα αρχεία που υπάρχουν μέσα στο σύστημα αρχείων:
>>> import os
>>> os.listdir()
['boot.py']

Για να εξετάσουμε τον ελεύθερο χώρο του συστήματος αρχείων γράφουμε:
import os
os.statvfs(“/”)
και επιστρέφει:
(4096, 4096, 860, 859, 859, 0, 0, 0, 0, 255)
το πρώτο είναι το block size και το τρίτο είναι ο συνολικός χώρος σε blocks ενώ το τέταρτο είναι ο ελεύθερος χώρος σε blocks. Για κάθε αρχείο από 1 έως 4096 bytes δεσμεύει ένα block. Αν το αρχείο ξεπεράσει για λίγο το 4096 θα πάρει και άλλο block. Από τα 1024 συνολικά blocks, τα 164 τα δεσμεύει η micropython περίπου 610Kbytes. Δηλαδή τώρα έχω ελεύθερα 859*4096=3518464 bytes.

Για να δω τα εγκατεστημένα modules γράφω help('modules') για το esp8266
>>> help('modules')
__main__          http_client       socket            upip
_boot             http_client_ssl   ssd1306           upip_utarfile
_onewire          http_server       ssl               upysh
_webrepl          http_server_ssl   struct            urandom
apa102            inisetup          sys               ure
array             io                time              urequests
binascii          json              uasyncio/__init__ urllib/urequest
btree             lwip              uasyncio/core     uselect
builtins          machine           ubinascii         usocket
collections       math              ucollections      ussl
dht               micropython       ucryptolib        ustruct
ds18x20           neopixel          uctypes           utime
errno             network           uerrno            utimeq
esp               ntptime           uhashlib          uzlib
example_pub_button                  onewire           uheapq            webrepl
example_sub_led   os                uio               webrepl_setup
flashbdev         port_diag         ujson             websocket
framebuf          random            umqtt/robust      websocket_helper
gc                re                umqtt/simple      zlib
hashlib           select            uos
Plus any modules on the filesystem

Εγκατάσταση micropython σε ESP 8266 (nodemcu) – Windows
=======================================================
Για την εγκατάσταση της micropython στο nodemcu, ακολουθούμε τα ίδια βήματα και από Λ.Σ. Windows.
Για τον προγραμματισμό υπάρχει το IDE EsPy https://github.com/jungervin/EsPy
