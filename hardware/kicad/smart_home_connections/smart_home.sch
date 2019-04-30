EESchema Schematic File Version 2
LIBS:ursa
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:smart_home-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Smart Home"
Date "2019-04-14"
Rev "0.9"
Comp "Ursa Robotics "
Comment1 "1ο ΕΠΑ.Λ. Πρέβεζας"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Screw_Terminal_1x06 J1
U 1 1 5CA5D703
P 2750 1950
F 0 "J1" H 2750 2600 50  0000 C TNN
F 1 "Screw_Terminal_1x06" V 3050 1750 50  0001 C TNN
F 2 "" H 2750 1325 50  0001 C CNN
F 3 "" H 2725 2350 50  0001 C CNN
	1    2750 1950
	-1   0    0    -1  
$EndComp
Text Label 2950 1600 0    60   ~ 0
LDR1
Text Label 2950 2000 0    60   ~ 0
LDR2
Text Label 2950 2400 0    60   ~ 0
PV
Text Label 2992 3072 0    60   ~ 0
Button
Text Label 2982 3438 0    60   ~ 0
M.S.1
Text Label 2978 3838 0    60   ~ 0
M.S.2
Text Label 3006 4242 0    60   ~ 0
BELL
$Comp
L Screw_Terminal_1x06 J3
U 1 1 5CA7F225
P 3550 5700
F 0 "J3" H 3550 6350 50  0000 C TNN
F 1 "Screw_Terminal_1x06" V 3400 5700 50  0001 C TNN
F 2 "" H 3550 5075 50  0001 C CNN
F 3 "" H 3525 6100 50  0001 C CNN
	1    3550 5700
	0    -1   1    0   
$EndComp
Text Label 3188 5231 3    60   ~ 0
Relay1
Text Label 3588 5231 3    60   ~ 0
Relay2
Text Label 3984 5231 3    60   ~ 0
Realy3
Text Label 4690 5427 1    60   ~ 0
O.C.1
Text Label 5124 5423 1    60   ~ 0
O.C.2
Text Label 4928 5415 1    60   ~ 0
+5V
Text Label 5794 5421 1    60   ~ 0
L1
Text Label 5986 5445 1    60   ~ 0
+5V
Text Label 6188 5421 1    60   ~ 0
L2
Text Label 6384 5445 1    60   ~ 0
+5V
Text Label 6590 5423 1    60   ~ 0
L3
Text Label 6788 5435 1    60   ~ 0
GND
Text Label 6550 5200 2    60   ~ 0
PWM_OUTPUTS
$Comp
L Screw_Terminal_1x03 J6
U 1 1 5CAB40DA
P 7350 5300
F 0 "J6" V 7350 5650 50  0000 C TNN
F 1 "Screw_Terminal_1x03" V 7200 5300 50  0001 C TNN
F 2 "" H 7350 4975 50  0001 C CNN
F 3 "" H 7325 5400 50  0001 C CNN
	1    7350 5300
	1    0    0    1   
$EndComp
$Comp
L Screw_Terminal_1x03 J7
U 1 1 5CAB4772
P 7350 4600
F 0 "J7" V 7350 4950 50  0000 C TNN
F 1 "Screw_Terminal_1x03" V 7200 4600 50  0001 C TNN
F 2 "" H 7350 4275 50  0001 C CNN
F 3 "" H 7325 4700 50  0001 C CNN
	1    7350 4600
	1    0    0    1   
$EndComp
Text Label 7089 5434 1    60   ~ 0
Servo1
Text Label 7092 4736 1    60   ~ 0
Servo2
$Comp
L Screw_Terminal_1x02 J6
U 1 1 5CAC6D46
P 7350 1550
F 0 "J6" H 7350 1800 50  0000 C TNN
F 1 "Screw_Terminal_1x02" V 7200 1550 50  0001 C TNN
F 2 "" H 7350 1325 50  0001 C CNN
F 3 "" H 7325 1550 50  0001 C CNN
	1    7350 1550
	1    0    0    -1  
$EndComp
Text Label 3042 4538 0    60   ~ 0
+3V3
Text Label 3050 4700 0    60   ~ 0
Thrm_1
Text Label 3050 4900 0    60   ~ 0
Thrm_2
Text Label 3092 5138 0    60   ~ 0
GND
Text Label 6862 1486 0    60   ~ 0
+5V/1A
Text Label 7058 1702 0    60   ~ 0
GND
Text Notes 2800 1500 0    60   ~ 0
[1]
Text Notes 2800 1700 0    60   ~ 0
[2]
Text Notes 2800 1900 0    60   ~ 0
[3]
Text Notes 2800 2100 0    60   ~ 0
[4]
Text Notes 2800 2300 0    60   ~ 0
[5]
Text Notes 2800 2500 0    60   ~ 0
[6]
Text Notes 2850 2950 0    60   ~ 0
[7]
Text Notes 2850 3150 0    60   ~ 0
[8]
Text Notes 2850 3350 0    60   ~ 0
[9]
Text Notes 2800 3550 0    60   ~ 0
[10]
Text Notes 2800 3750 0    60   ~ 0
[11]
Text Notes 2800 3950 0    60   ~ 0
[12]
Text Notes 2800 4150 0    60   ~ 0
[13]
Text Notes 2800 4350 0    60   ~ 0
[14]
Text Notes 2800 4550 0    60   ~ 0
[15]
Text Notes 2800 4750 0    60   ~ 0
[16]
Text Notes 2800 4950 0    60   ~ 0
[17]
Text Notes 2800 5150 0    60   ~ 0
[18]
Text Notes 7300 5110 2    60   ~ 0
[36]
Text Notes 7300 5310 2    60   ~ 0
[35]
Text Notes 7300 5510 2    60   ~ 0
[34]
Text Notes 7300 4410 2    60   ~ 0
[39]
Text Notes 7300 4610 2    60   ~ 0
[38]
Text Notes 7300 4810 2    60   ~ 0
[37]
Text Notes 3100 5450 3    60   ~ 0
[19]
Text Notes 3300 5450 3    60   ~ 0
[20]
Text Notes 3500 5450 3    60   ~ 0
[21]
Text Notes 3700 5450 3    60   ~ 0
[22]
Text Notes 3900 5450 3    60   ~ 0
[23]
Text Notes 4100 5450 3    60   ~ 0
[24]
Text Notes 4700 5650 1    60   ~ 0
[25]
Text Notes 4900 5650 1    60   ~ 0
[26]
Text Notes 5100 5650 1    60   ~ 0
[27]
Text Notes 5800 5650 1    60   ~ 0
[28]
Text Notes 6000 5650 1    60   ~ 0
[29]
Text Notes 6200 5650 1    60   ~ 0
[30]
Text Notes 6400 5650 1    60   ~ 0
[31]
Text Notes 6600 5650 1    60   ~ 0
[32]
Text Notes 6800 5650 1    60   ~ 0
[33]
$Comp
L Screw_Terminal_1x03 J9
U 1 1 5CC38B4F
P 7350 3200
F 0 "J9" H 7350 3550 50  0000 C TNN
F 1 "Screw_Terminal_1x03" V 7200 3200 50  0001 C TNN
F 2 "" H 7350 2875 50  0001 C CNN
F 3 "" H 7325 3300 50  0001 C CNN
	1    7350 3200
	1    0    0    1   
$EndComp
Text Notes 7100 3450 0    60   ~ 0
[43]
Text Notes 7100 3250 0    60   ~ 0
[44]
Text Notes 7100 3050 0    60   ~ 0
[45]
$Comp
L Screw_Terminal_1x03 J8
U 1 1 5CC45EE8
P 7350 3900
F 0 "J8" H 7350 4250 50  0000 C TNN
F 1 "Screw_Terminal_1x03" V 7200 3900 50  0001 C TNN
F 2 "" H 7350 3575 50  0001 C CNN
F 3 "" H 7325 4000 50  0001 C CNN
	1    7350 3900
	1    0    0    1   
$EndComp
Text Label 2950 1600 0    60   ~ 0
LDR1
Text Label 2950 2000 0    60   ~ 0
LDR2
Text Label 2950 2400 0    60   ~ 0
PV
Text Label 2992 3072 0    60   ~ 0
Button
Text Label 2982 3438 0    60   ~ 0
M.S.1
Text Label 2978 3838 0    60   ~ 0
M.S.2
Text Label 3006 4242 0    60   ~ 0
BELL
Text Label 3188 5231 3    60   ~ 0
Relay1
Text Label 3588 5231 3    60   ~ 0
Relay2
Text Label 3984 5231 3    60   ~ 0
Realy3
Text Label 4690 5427 1    60   ~ 0
O.C.1
Text Label 5124 5423 1    60   ~ 0
O.C.2
Text Label 4928 5415 1    60   ~ 0
+5V
Text Label 5794 5421 1    60   ~ 0
L1
Text Label 5986 5445 1    60   ~ 0
+5V
Text Label 6188 5421 1    60   ~ 0
L2
Text Label 6384 5445 1    60   ~ 0
+5V
Text Label 6590 5423 1    60   ~ 0
L3
Text Label 6788 5435 1    60   ~ 0
GND
Text Label 6550 5200 2    60   ~ 0
PWM_OUTPUTS
Text Label 7089 5434 1    60   ~ 0
Servo1
Text Label 7092 4736 1    60   ~ 0
Servo2
Text Label 3042 4538 0    60   ~ 0
+3V3
Text Label 3050 4700 0    60   ~ 0
Thrm_1
Text Label 3050 4900 0    60   ~ 0
Thrm_2
Text Label 3092 5138 0    60   ~ 0
GND
Text Label 6862 1486 0    60   ~ 0
+5V/1A
Text Label 7058 1702 0    60   ~ 0
GND
Text Notes 2800 1500 0    60   ~ 0
[1]
Text Notes 2800 1700 0    60   ~ 0
[2]
Text Notes 2800 1900 0    60   ~ 0
[3]
Text Notes 2800 2100 0    60   ~ 0
[4]
Text Notes 2800 2300 0    60   ~ 0
[5]
Text Notes 2800 2500 0    60   ~ 0
[6]
Text Notes 2850 2950 0    60   ~ 0
[7]
Text Notes 2850 3150 0    60   ~ 0
[8]
Text Notes 2850 3350 0    60   ~ 0
[9]
Text Notes 2800 3550 0    60   ~ 0
[10]
Text Notes 2800 3750 0    60   ~ 0
[11]
Text Notes 2800 3950 0    60   ~ 0
[12]
Text Notes 2800 4150 0    60   ~ 0
[13]
Text Notes 2800 4350 0    60   ~ 0
[14]
Text Notes 2800 4550 0    60   ~ 0
[15]
Text Notes 2800 4750 0    60   ~ 0
[16]
Text Notes 2800 4950 0    60   ~ 0
[17]
Text Notes 2800 5150 0    60   ~ 0
[18]
Text Notes 7300 5110 2    60   ~ 0
[36]
Text Notes 7300 5310 2    60   ~ 0
[35]
Text Notes 7300 5510 2    60   ~ 0
[34]
Text Notes 7300 4410 2    60   ~ 0
[39]
Text Notes 7300 4610 2    60   ~ 0
[38]
Text Notes 7300 4810 2    60   ~ 0
[37]
Text Notes 3100 5450 3    60   ~ 0
[19]
Text Notes 3300 5450 3    60   ~ 0
[20]
Text Notes 3500 5450 3    60   ~ 0
[21]
Text Notes 3700 5450 3    60   ~ 0
[22]
Text Notes 3900 5450 3    60   ~ 0
[23]
Text Notes 4100 5450 3    60   ~ 0
[24]
Text Notes 4700 5650 1    60   ~ 0
[25]
Text Notes 4900 5650 1    60   ~ 0
[26]
Text Notes 5100 5650 1    60   ~ 0
[27]
Text Notes 5800 5650 1    60   ~ 0
[28]
Text Notes 6000 5650 1    60   ~ 0
[29]
Text Notes 6200 5650 1    60   ~ 0
[30]
Text Notes 6400 5650 1    60   ~ 0
[31]
Text Notes 6600 5650 1    60   ~ 0
[32]
Text Notes 6800 5650 1    60   ~ 0
[33]
Text Notes 7100 3450 0    60   ~ 0
[43]
Text Notes 7100 3250 0    60   ~ 0
[44]
Text Notes 7100 3050 0    60   ~ 0
[45]
Text Label 2950 1600 0    60   ~ 0
LDR1
Text Label 2950 2000 0    60   ~ 0
LDR2
Text Label 2950 2400 0    60   ~ 0
PV
Text Label 2992 3072 0    60   ~ 0
Button
Text Label 2982 3438 0    60   ~ 0
M.S.1
Text Label 2978 3838 0    60   ~ 0
M.S.2
Text Label 3006 4242 0    60   ~ 0
BELL
Text Label 3188 5231 3    60   ~ 0
Relay1
Text Label 3588 5231 3    60   ~ 0
Relay2
Text Label 3984 5231 3    60   ~ 0
Realy3
Text Label 4690 5427 1    60   ~ 0
O.C.1
Text Label 5124 5423 1    60   ~ 0
O.C.2
Text Label 4928 5415 1    60   ~ 0
+5V
Text Label 5794 5421 1    60   ~ 0
L1
Text Label 5986 5445 1    60   ~ 0
+5V
Text Label 6188 5421 1    60   ~ 0
L2
Text Label 6384 5445 1    60   ~ 0
+5V
Text Label 6590 5423 1    60   ~ 0
L3
Text Label 6788 5435 1    60   ~ 0
GND
Text Label 6550 5200 2    60   ~ 0
PWM_OUTPUTS
Text Label 7089 5434 1    60   ~ 0
Servo1
Text Label 7092 4736 1    60   ~ 0
Servo2
Text Label 3042 4538 0    60   ~ 0
+3V3
Text Label 3050 4700 0    60   ~ 0
Thrm_1
Text Label 3050 4900 0    60   ~ 0
Thrm_2
Text Label 3092 5138 0    60   ~ 0
GND
Text Label 6862 1486 0    60   ~ 0
+5V/1A
Text Label 7058 1702 0    60   ~ 0
GND
Text Notes 2800 1500 0    60   ~ 0
[1]
Text Notes 2800 1700 0    60   ~ 0
[2]
Text Notes 2800 1900 0    60   ~ 0
[3]
Text Notes 2800 2100 0    60   ~ 0
[4]
Text Notes 2800 2300 0    60   ~ 0
[5]
Text Notes 2800 2500 0    60   ~ 0
[6]
Text Notes 2850 2950 0    60   ~ 0
[7]
Text Notes 2850 3150 0    60   ~ 0
[8]
Text Notes 2850 3350 0    60   ~ 0
[9]
Text Notes 2800 3550 0    60   ~ 0
[10]
Text Notes 2800 3750 0    60   ~ 0
[11]
Text Notes 2800 3950 0    60   ~ 0
[12]
Text Notes 2800 4150 0    60   ~ 0
[13]
Text Notes 2800 4350 0    60   ~ 0
[14]
Text Notes 2800 4550 0    60   ~ 0
[15]
Text Notes 2800 4750 0    60   ~ 0
[16]
Text Notes 2800 4950 0    60   ~ 0
[17]
Text Notes 2800 5150 0    60   ~ 0
[18]
Text Notes 7300 5110 2    60   ~ 0
[36]
Text Notes 7300 5310 2    60   ~ 0
[35]
Text Notes 7300 5510 2    60   ~ 0
[34]
Text Notes 7300 4410 2    60   ~ 0
[39]
Text Notes 7300 4610 2    60   ~ 0
[38]
Text Notes 7300 4810 2    60   ~ 0
[37]
Text Notes 3100 5450 3    60   ~ 0
[19]
Text Notes 3300 5450 3    60   ~ 0
[20]
Text Notes 3500 5450 3    60   ~ 0
[21]
Text Notes 3700 5450 3    60   ~ 0
[22]
Text Notes 3900 5450 3    60   ~ 0
[23]
Text Notes 4100 5450 3    60   ~ 0
[24]
Text Notes 4700 5650 1    60   ~ 0
[25]
Text Notes 4900 5650 1    60   ~ 0
[26]
Text Notes 5100 5650 1    60   ~ 0
[27]
Text Notes 5800 5650 1    60   ~ 0
[28]
Text Notes 6000 5650 1    60   ~ 0
[29]
Text Notes 6200 5650 1    60   ~ 0
[30]
Text Notes 6400 5650 1    60   ~ 0
[31]
Text Notes 6600 5650 1    60   ~ 0
[32]
Text Notes 6800 5650 1    60   ~ 0
[33]
Text Notes 7100 3450 0    60   ~ 0
[43]
Text Notes 7100 3250 0    60   ~ 0
[44]
Text Notes 7100 3050 0    60   ~ 0
[45]
$Comp
L Screw_Terminal_1x12 J2
U 1 1 5CA75F99
P 2750 4000
F 0 "J2" H 2750 5250 50  0000 C TNN
F 1 "Screw_Terminal_1x12" V 2600 4000 50  0001 C TNN
F 2 "" H 2750 2775 50  0001 C CNN
F 3 "" H 2725 5000 50  0001 C CNN
	1    2750 4000
	-1   0    0    -1  
$EndComp
$Comp
L Screw_Terminal_1x03 J4
U 1 1 5CA76E15
P 4900 5700
F 0 "J4" H 4900 6050 50  0000 C TNN
F 1 "Screw_Terminal_1x03" V 4750 5700 50  0001 C TNN
F 2 "" H 4900 5375 50  0001 C CNN
F 3 "" H 4875 5800 50  0001 C CNN
	1    4900 5700
	0    -1   1    0   
$EndComp
$Comp
L Screw_Terminal_1x06 J5
U 1 1 5CAA2071
P 6250 5700
F 0 "J5" H 6250 6350 50  0000 C TNN
F 1 "Screw_Terminal_1x06" V 6100 5700 50  0001 C TNN
F 2 "" H 6250 5075 50  0001 C CNN
F 3 "" H 6225 6100 50  0001 C CNN
	1    6250 5700
	0    -1   1    0   
$EndComp
Text Notes 4134 1548 0    60   ~ 0
USB
Text Notes 5880 1518 0    60   ~ 0
USB
Text Notes 3996 2322 0    60   ~ 0
ARDUINO \nNANO
Text Notes 5766 2220 0    60   ~ 0
NODE MCU
Text Notes 7136 2416 0    60   ~ 0
BME280
$Comp
L R_PHOTO LDR1
U 1 1 5CC3D246
P 1550 1550
F 0 "LDR1" H 1600 1600 50  0000 L CNN
F 1 "R_PHOTO" H 1600 1550 50  0001 L TNN
F 2 "" V 1600 1300 50  0000 L CNN
F 3 "" H 1550 1500 50  0000 C CNN
	1    1550 1550
	1    0    0    -1  
$EndComp
$Comp
L R_PHOTO LDR2
U 1 1 5CC3D306
P 1550 1950
F 0 "LDR2" H 1600 2000 50  0000 L CNN
F 1 "R_PHOTO" H 1600 1950 50  0001 L TNN
F 2 "" V 1600 1700 50  0000 L CNN
F 3 "" H 1550 1900 50  0000 C CNN
	1    1550 1950
	1    0    0    -1  
$EndComp
$Comp
L Solar_Cell SC1
U 1 1 5CC3DBAA
P 1100 2450
F 0 "SC1" H 1200 2550 50  0000 L CNN
F 1 "Solar_Cell" H 1200 2450 50  0000 L CNN
F 2 "" V 1100 2510 50  0000 C CNN
F 3 "" V 1100 2510 50  0000 C CNN
	1    1100 2450
	1    0    0    -1  
$EndComp
$Comp
L Jumper PB1
U 1 1 5CC3DCBE
P 1400 2900
F 0 "PB1" H 1400 3050 50  0000 C CNN
F 1 "Push Button" H 1400 2820 50  0000 C CNN
F 2 "" H 1400 2900 50  0000 C CNN
F 3 "" H 1400 2900 50  0000 C CNN
	1    1400 2900
	1    0    0    -1  
$EndComp
$Comp
L Electromagnetic_Actor MS1
U 1 1 5CC3E28D
P 1350 3400
F 0 "MS1" H 1400 3550 50  0000 L CNN
F 1 "Magnetic_Switch_N.O." H 1400 3350 50  0000 L CNN
F 2 "" V 1325 3500 50  0000 C CNN
F 3 "" V 1325 3500 50  0000 C CNN
	1    1350 3400
	1    0    0    -1  
$EndComp
$Comp
L Electromagnetic_Actor MS2
U 1 1 5CC3E54F
P 1350 3800
F 0 "MS2" H 1400 3950 50  0000 L CNN
F 1 "Magnetic_Switch_N.O." H 1400 3750 50  0000 L CNN
F 2 "" V 1325 3900 50  0000 C CNN
F 3 "" V 1325 3900 50  0000 C CNN
	1    1350 3800
	1    0    0    -1  
$EndComp
$Comp
L Jumper PB2
U 1 1 5CC3E8FC
P 1400 4100
F 0 "PB2" H 1400 4250 50  0000 C CNN
F 1 "Push Button" H 1400 4020 50  0000 C CNN
F 2 "" H 1400 4100 50  0000 C CNN
F 3 "" H 1400 4100 50  0000 C CNN
	1    1400 4100
	1    0    0    -1  
$EndComp
Text Notes 1402 4538 0    60   ~ 0
+
Text Notes 1358 4630 0    60   ~ 0
Dq
Text Notes 1294 4742 0    60   ~ 0
GND
Text Notes 1126 4630 0    60   ~ 0
T1
Text Notes 1402 4938 0    60   ~ 0
+
Text Notes 1358 5030 0    60   ~ 0
Dq
Text Notes 1294 5142 0    60   ~ 0
GND
Text Notes 1126 5030 0    60   ~ 0
T2
$Comp
L LED LD1
U 1 1 5CC40B89
P 3050 6750
F 0 "LD1" H 3050 6850 50  0000 C CNN
F 1 "RED_LED" H 3050 6600 50  0000 C CNN
F 2 "" H 3050 6750 50  0000 C CNN
F 3 "" H 3050 6750 50  0000 C CNN
	1    3050 6750
	0    1    -1   0   
$EndComp
$Comp
L R R1
U 1 1 5CC418D5
P 3050 6450
F 0 "R1" H 3150 6450 50  0000 C CNN
F 1 "150" V 3050 6450 50  0000 C CNN
F 2 "" V 2980 6450 50  0000 C CNN
F 3 "" H 3050 6450 50  0000 C CNN
	1    3050 6450
	1    0    0    -1  
$EndComp
$Comp
L LED LD2
U 1 1 5CC433F0
P 3450 6750
F 0 "LD2" H 3450 6850 50  0000 C CNN
F 1 "RED_LED" H 3450 6600 50  0000 C CNN
F 2 "" H 3450 6750 50  0000 C CNN
F 3 "" H 3450 6750 50  0000 C CNN
	1    3450 6750
	0    1    -1   0   
$EndComp
$Comp
L R R2
U 1 1 5CC433F6
P 3450 6450
F 0 "R2" H 3550 6450 50  0000 C CNN
F 1 "150" V 3450 6450 50  0000 C CNN
F 2 "" V 3380 6450 50  0000 C CNN
F 3 "" H 3450 6450 50  0000 C CNN
	1    3450 6450
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5CC436CB
P 3850 6450
F 0 "R3" H 3950 6450 50  0000 C CNN
F 1 "47" V 3850 6450 50  0000 C CNN
F 2 "" V 3780 6450 50  0000 C CNN
F 3 "" H 3850 6450 50  0000 C CNN
	1    3850 6450
	1    0    0    -1  
$EndComp
$Comp
L LED LD4
U 1 1 5CC44872
P 4700 6750
F 0 "LD4" H 4700 6850 50  0000 C CNN
F 1 "WHITE_LED" H 4300 6750 50  0001 C CNN
F 2 "" H 4700 6750 50  0000 C CNN
F 3 "" H 4700 6750 50  0000 C CNN
	1    4700 6750
	1    0    0    1   
$EndComp
$Comp
L LED LD5
U 1 1 5CC44A5E
P 4700 6950
F 0 "LD5" H 4700 7050 50  0000 C CNN
F 1 "WHITE_LED" H 4300 6950 50  0001 C CNN
F 2 "" H 4700 6950 50  0000 C CNN
F 3 "" H 4700 6950 50  0000 C CNN
	1    4700 6950
	1    0    0    1   
$EndComp
$Comp
L LED LD6
U 1 1 5CC44C52
P 4700 7150
F 0 "LD6" H 4700 7250 50  0000 C CNN
F 1 "WHITE_LED" H 4300 7150 50  0001 C CNN
F 2 "" H 4700 7150 50  0000 C CNN
F 3 "" H 4700 7150 50  0000 C CNN
	1    4700 7150
	1    0    0    1   
$EndComp
$Comp
L LED LD7
U 1 1 5CC44CD0
P 4700 7350
F 0 "LD7" H 4700 7450 50  0000 C CNN
F 1 "WHITE_LED" H 4300 7350 50  0001 C CNN
F 2 "" H 4700 7350 50  0000 C CNN
F 3 "" H 4700 7350 50  0000 C CNN
	1    4700 7350
	1    0    0    1   
$EndComp
$Comp
L LED LD3
U 1 1 5CC455D6
P 4700 6550
F 0 "LD3" H 4700 6650 50  0000 C CNN
F 1 "WHITE_LED" H 4300 6850 50  0000 C CNN
F 2 "" H 4700 6550 50  0000 C CNN
F 3 "" H 4700 6550 50  0000 C CNN
	1    4700 6550
	1    0    0    1   
$EndComp
$Comp
L R R4
U 1 1 5CC45D39
P 4900 6350
F 0 "R4" H 5000 6350 50  0000 C CNN
F 1 "33" V 4900 6350 50  0000 C CNN
F 2 "" V 4830 6350 50  0000 C CNN
F 3 "" H 4900 6350 50  0000 C CNN
	1    4900 6350
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5CC45E3D
P 5100 6350
F 0 "R5" H 5200 6350 50  0000 C CNN
F 1 "33" V 5100 6350 50  0000 C CNN
F 2 "" V 5030 6350 50  0000 C CNN
F 3 "" H 5100 6350 50  0000 C CNN
	1    5100 6350
	1    0    0    -1  
$EndComp
$Comp
L Buzzer BZ1
U 1 1 5CC471C6
P 5400 6600
F 0 "BZ1" V 5444 6546 50  0000 L CNN
F 1 "Buzzer" V 5550 6500 50  0000 L CNN
F 2 "" V 5375 6700 50  0000 C CNN
F 3 "" V 5375 6700 50  0000 C CNN
	1    5400 6600
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 5CC4A090
P 5950 6350
F 0 "R6" H 6050 6350 50  0000 C CNN
F 1 "100" V 5950 6350 50  0000 C CNN
F 2 "" V 5880 6350 50  0000 C CNN
F 3 "" H 5950 6350 50  0000 C CNN
	1    5950 6350
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5CC4A157
P 6350 6350
F 0 "R7" H 6450 6350 50  0000 C CNN
F 1 "100" V 6350 6350 50  0000 C CNN
F 2 "" V 6280 6350 50  0000 C CNN
F 3 "" H 6350 6350 50  0000 C CNN
	1    6350 6350
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 5CC4A1F5
P 6650 6350
F 0 "R8" H 6750 6350 50  0000 C CNN
F 1 "100" V 6650 6350 50  0000 C CNN
F 2 "" V 6580 6350 50  0000 C CNN
F 3 "" H 6650 6350 50  0000 C CNN
	1    6650 6350
	1    0    0    -1  
$EndComp
$Comp
L LED LD8
U 1 1 5CC4A2B9
P 5950 6700
F 0 "LD8" H 5950 6800 50  0000 C CNN
F 1 "WHITE_LED" H 6000 6550 50  0000 C CNN
F 2 "" H 5950 6700 50  0000 C CNN
F 3 "" H 5950 6700 50  0000 C CNN
	1    5950 6700
	0    1    -1   0   
$EndComp
$Comp
L LED LD9
U 1 1 5CC4A58A
P 6350 6700
F 0 "LD9" H 6350 6800 50  0000 C CNN
F 1 "WHITE_LED" H 6400 6550 50  0001 C CNN
F 2 "" H 6350 6700 50  0000 C CNN
F 3 "" H 6350 6700 50  0000 C CNN
	1    6350 6700
	0    1    -1   0   
$EndComp
$Comp
L LED LD10
U 1 1 5CC4B62C
P 6650 6700
F 0 "LD10" H 6650 6800 50  0000 C CNN
F 1 "WHITE_LED" H 6700 6550 50  0001 C CNN
F 2 "" H 6650 6700 50  0000 C CNN
F 3 "" H 6650 6700 50  0000 C CNN
	1    6650 6700
	0    1    -1   0   
$EndComp
Text Notes 1050 1550 0    60   ~ 0
Κήπος
Text Notes 1050 1950 0    60   ~ 0
Σκίαση
Text Notes 850  3400 0    60   ~ 0
Κύρια\nΕίσοδος
Text Notes 900  3800 0    60   ~ 0
Πίσω\nΠόρτα
Text Notes 700  4050 0    60   ~ 0
Κουδούνι
Text Notes 714  4424 0    60   ~ 0
Θερμοσίφωνας
Text Notes 650  5250 0    60   ~ 0
Εξωτερική Θερμοκρ.
Text Notes 3000 7350 1    60   ~ 0
Πρίζα 1
Text Notes 3400 7350 1    60   ~ 0
Πρίζα 2
Text Notes 3786 7466 1    60   ~ 0
Αντίσταση Θερμοσίφωνα
Text Notes 4450 7250 1    60   ~ 0
Κήπος
Text Notes 5250 6900 0    60   ~ 0
Σειρήνα
Text Notes 6000 7050 0    60   ~ 0
Φώτα Δωματίων
Text Notes 8693 4435 0    60   ~ 0
+
Text Notes 8684 4639 0    60   ~ 0
Dq
Text Notes 8678 4837 0    60   ~ 0
GND
Text Notes 8972 4618 0    60   ~ 0
Servo SG90
Text Notes 8693 5135 0    60   ~ 0
+
Text Notes 8684 5339 0    60   ~ 0
Dq
Text Notes 8678 5537 0    60   ~ 0
GND
Text Notes 8972 5318 0    60   ~ 0
Servo SG90
Text Label 6900 3050 0    60   ~ 0
GND
Text Label 6900 3450 0    60   ~ 0
SCL
Text Label 6900 3250 0    60   ~ 0
SDA
Text Label 6950 3950 0    60   ~ 0
SPARE
$Comp
L +5V #PWR?
U 1 1 5CC6CED1
P 8050 1450
F 0 "#PWR?" H 8050 1300 50  0001 C CNN
F 1 "+5V" H 8050 1590 50  0000 C CNN
F 2 "" H 8050 1450 50  0000 C CNN
F 3 "" H 8050 1450 50  0000 C CNN
	1    8050 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5CC6CF2D
P 8050 1700
F 0 "#PWR?" H 8050 1450 50  0001 C CNN
F 1 "GND" H 8050 1550 50  0000 C CNN
F 2 "" H 8050 1700 50  0000 C CNN
F 3 "" H 8050 1700 50  0000 C CNN
	1    8050 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1250 7650 1250
Wire Wire Line
	7650 1250 7650 6000
Wire Wire Line
	7650 6000 2500 6000
Wire Wire Line
	2500 6000 2500 1250
Wire Wire Line
	3750 1400 3750 3100
Wire Wire Line
	3750 3100 4650 3100
Wire Wire Line
	4650 3100 4650 1400
Wire Wire Line
	4650 1400 3750 1400
Wire Wire Line
	4050 1400 4050 1650
Wire Wire Line
	4050 1650 4400 1650
Wire Wire Line
	4400 1650 4400 1400
Wire Wire Line
	5300 1400 5300 3300
Wire Wire Line
	5300 3300 6600 3300
Wire Wire Line
	6600 3300 6600 1400
Wire Wire Line
	6600 1400 5300 1400
Wire Wire Line
	5750 1400 5750 1600
Wire Wire Line
	5750 1600 6150 1600
Wire Wire Line
	6150 1600 6150 1400
Wire Wire Line
	7500 2000 6950 2000
Wire Wire Line
	6950 2000 6950 2750
Wire Wire Line
	6950 2750 7600 2750
Wire Wire Line
	7600 2750 7600 2000
Wire Wire Line
	7600 2000 7450 2000
Wire Wire Line
	1550 1400 2050 1400
Wire Wire Line
	2050 1400 2050 1450
Wire Wire Line
	2050 1450 2550 1450
Wire Wire Line
	2550 1650 2050 1650
Wire Wire Line
	2050 1650 2050 1700
Wire Wire Line
	2050 1700 1550 1700
Wire Wire Line
	1550 1800 2050 1800
Wire Wire Line
	2050 1800 2050 1850
Wire Wire Line
	2050 1850 2550 1850
Wire Wire Line
	2550 2050 2050 2050
Wire Wire Line
	2050 2050 2050 2100
Wire Wire Line
	2050 2100 1550 2100
Wire Wire Line
	1100 2250 2550 2250
Wire Wire Line
	1100 2550 1750 2550
Wire Wire Line
	1750 2550 1750 2450
Wire Wire Line
	1750 2450 2550 2450
Wire Wire Line
	1700 2900 2550 2900
Wire Wire Line
	1100 2900 1100 3100
Wire Wire Line
	1100 3100 2550 3100
Wire Wire Line
	1350 3200 1750 3200
Wire Wire Line
	1750 3200 1750 3300
Wire Wire Line
	1750 3300 2550 3300
Wire Wire Line
	1350 3500 2550 3500
Wire Wire Line
	1350 3600 1750 3600
Wire Wire Line
	1750 3600 1750 3700
Wire Wire Line
	1750 3700 2550 3700
Wire Wire Line
	1350 3900 2550 3900
Wire Wire Line
	1700 4100 2550 4100
Wire Wire Line
	1100 4100 1100 4300
Wire Wire Line
	1100 4300 2550 4300
Wire Wire Line
	950  4450 950  4750
Wire Wire Line
	950  4750 1500 4750
Wire Wire Line
	1500 4750 1500 4450
Wire Wire Line
	1500 4450 950  4450
Connection ~ 1500 4500
Connection ~ 1500 4600
Connection ~ 1500 4700
Wire Wire Line
	950  4850 950  5150
Wire Wire Line
	950  5150 1500 5150
Wire Wire Line
	1500 5150 1500 4850
Wire Wire Line
	1500 4850 950  4850
Connection ~ 1500 4900
Connection ~ 1500 5000
Connection ~ 1500 5100
Wire Wire Line
	1500 4500 2550 4500
Wire Wire Line
	1500 4600 1900 4600
Wire Wire Line
	1900 4600 1900 4700
Wire Wire Line
	1900 4700 2550 4700
Wire Wire Line
	1500 5100 2550 5100
Wire Wire Line
	1500 5000 1900 5000
Wire Wire Line
	1900 5000 1900 4900
Wire Wire Line
	1900 4900 2550 4900
Wire Wire Line
	1500 4700 1800 4700
Wire Wire Line
	1800 4700 1800 4800
Wire Wire Line
	1800 4800 2450 4800
Wire Wire Line
	2450 4800 2450 5100
Connection ~ 2450 5100
Wire Wire Line
	1500 4900 1700 4900
Wire Wire Line
	1700 4900 1700 4550
Wire Wire Line
	1700 4550 2450 4550
Wire Wire Line
	2450 4550 2450 4500
Connection ~ 2450 4500
Wire Wire Line
	4900 6200 4900 5900
Wire Wire Line
	3250 6200 5500 6200
Wire Wire Line
	4050 6200 4050 5900
Wire Wire Line
	3650 6200 3650 5900
Connection ~ 4050 6200
Wire Wire Line
	3250 6200 3250 5900
Connection ~ 3650 6200
Wire Wire Line
	3050 5900 3050 6300
Wire Wire Line
	3450 5900 3450 6300
Wire Wire Line
	3850 5900 3850 6300
Wire Wire Line
	4850 6500 5100 6500
Wire Wire Line
	4850 6500 4850 7350
Connection ~ 4900 6500
Connection ~ 4850 6550
Wire Wire Line
	4550 7350 4500 7350
Wire Wire Line
	4500 7350 4500 6300
Wire Wire Line
	4500 6300 4700 6300
Wire Wire Line
	4700 6300 4700 5900
Connection ~ 4900 6200
Wire Wire Line
	4550 6550 4500 6550
Connection ~ 4500 6550
Wire Wire Line
	4550 6750 4500 6750
Connection ~ 4500 6750
Wire Wire Line
	4550 6950 4500 6950
Connection ~ 4500 6950
Wire Wire Line
	4550 7150 4500 7150
Connection ~ 4500 7150
Wire Wire Line
	4850 7150 4850 7100
Connection ~ 4850 7150
Wire Wire Line
	4850 6950 4850 6750
Connection ~ 4850 6750
Connection ~ 4850 6950
Wire Wire Line
	5500 6200 5500 6500
Connection ~ 5100 6200
Wire Wire Line
	5300 6500 5300 6100
Wire Wire Line
	5300 6100 5100 6100
Wire Wire Line
	5100 6100 5100 5900
Wire Wire Line
	5950 5900 5950 6200
Wire Wire Line
	6350 5900 6350 6200
Wire Wire Line
	5950 6500 5950 6550
Wire Wire Line
	6350 6500 6350 6550
Wire Wire Line
	5950 6850 5950 6900
Wire Wire Line
	5950 6900 5750 6900
Wire Wire Line
	5750 6900 5750 5900
Wire Wire Line
	6350 6850 6350 6900
Wire Wire Line
	6350 6900 6150 6900
Wire Wire Line
	6150 6900 6150 5900
Wire Wire Line
	6350 6100 6650 6100
Wire Wire Line
	6650 6100 6650 6200
Connection ~ 6350 6100
Wire Wire Line
	6550 5900 6550 6050
Wire Wire Line
	6550 6050 6800 6050
Wire Wire Line
	6800 6050 6800 6900
Wire Wire Line
	6800 6900 6650 6900
Wire Wire Line
	6650 6900 6650 6850
Wire Wire Line
	6650 6550 6650 6500
Wire Wire Line
	6750 5900 6900 5900
Wire Wire Line
	6900 5900 6900 7500
Wire Wire Line
	6900 7500 3050 7500
Wire Wire Line
	3850 7500 3850 6600
Wire Wire Line
	3450 7500 3450 6900
Connection ~ 3850 7500
Wire Wire Line
	3050 7500 3050 6900
Connection ~ 3450 7500
Wire Wire Line
	8650 4300 8650 4900
Wire Wire Line
	8650 4900 9650 4900
Wire Wire Line
	9650 4900 9650 4300
Wire Wire Line
	9650 4300 8650 4300
Connection ~ 8650 4600
Connection ~ 8650 4800
Connection ~ 8650 4400
Wire Wire Line
	7550 4400 8650 4400
Wire Wire Line
	7550 4600 8650 4600
Wire Wire Line
	7550 4800 8650 4800
Wire Wire Line
	8650 5000 8650 5600
Wire Wire Line
	8650 5600 9650 5600
Wire Wire Line
	9650 5600 9650 5000
Wire Wire Line
	9650 5000 8650 5000
Connection ~ 8650 5300
Connection ~ 8650 5500
Connection ~ 8650 5100
Wire Wire Line
	7550 5100 8650 5100
Wire Wire Line
	7550 5300 8650 5300
Wire Wire Line
	7550 5500 8650 5500
Wire Wire Line
	7350 1800 7350 1900
Wire Wire Line
	7350 1900 7450 1900
Wire Wire Line
	7450 1900 7450 1800
Wire Wire Line
	7450 1800 7350 1800
Wire Wire Line
	2600 5800 2600 5900
Wire Wire Line
	2600 5900 2700 5900
Wire Wire Line
	2700 5900 2700 5800
Wire Wire Line
	2700 5800 2600 5800
Wire Wire Line
	7550 1650 8050 1650
Wire Wire Line
	8050 1650 8050 1700
Wire Wire Line
	7550 1450 8050 1450
$EndSCHEMATC
