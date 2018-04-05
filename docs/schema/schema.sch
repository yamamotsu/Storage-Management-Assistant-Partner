EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:schema-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "15 nov 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 650  7600 0    50   ~ 0
ID_SD and ID_SC PINS:\nThese pins are reserved for HAT ID EEPROM.\n\nAt boot time this I2C interface will be\ninterrogated to look for an EEPROM\nthat identifes the attached board and\nallows automagic setup of the GPIOs\n(and optionally, Linux drivers).\n\nDO NOT USE these pins for anything other\nthan attaching an I2C ID EEPROM. Leave\nunconnected if ID EEPROM not required.
$Comp
L Mounting_Hole MK1
U 1 1 5834FB2E
P 3000 7200
F 0 "MK1" H 3100 7246 50  0000 L CNN
F 1 "M2.5" H 3100 7155 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.5mm" H 3000 7200 60  0001 C CNN
F 3 "" H 3000 7200 60  0001 C CNN
	1    3000 7200
	1    0    0    -1  
$EndComp
$Comp
L Mounting_Hole MK3
U 1 1 5834FBEF
P 3450 7200
F 0 "MK3" H 3550 7246 50  0000 L CNN
F 1 "M2.5" H 3550 7155 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.5mm" H 3450 7200 60  0001 C CNN
F 3 "" H 3450 7200 60  0001 C CNN
	1    3450 7200
	1    0    0    -1  
$EndComp
$Comp
L Mounting_Hole MK2
U 1 1 5834FC19
P 3000 7400
F 0 "MK2" H 3100 7446 50  0000 L CNN
F 1 "M2.5" H 3100 7355 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.5mm" H 3000 7400 60  0001 C CNN
F 3 "" H 3000 7400 60  0001 C CNN
	1    3000 7400
	1    0    0    -1  
$EndComp
$Comp
L Mounting_Hole MK4
U 1 1 5834FC4F
P 3450 7400
F 0 "MK4" H 3550 7446 50  0000 L CNN
F 1 "M2.5" H 3550 7355 50  0000 L CNN
F 2 "Mounting_Holes:MountingHole_2.5mm" H 3450 7400 60  0001 C CNN
F 3 "" H 3450 7400 60  0001 C CNN
	1    3450 7400
	1    0    0    -1  
$EndComp
Text Notes 3000 7050 0    50   ~ 0
Mounting Holes
$Comp
L Conn_02x20_Odd_Even J?
U 1 1 5AA8BB61
P 5550 3300
F 0 "J?" H 5600 4300 50  0001 C CNN
F 1 "RaspberryPi GPIO" V 5600 3250 50  0000 C CNN
F 2 "" H 5550 3300 50  0001 C CNN
F 3 "" H 5550 3300 50  0001 C CNN
	1    5550 3300
	1    0    0    -1  
$EndComp
Text Label 5000 2400 0    60   ~ 0
3.3V
Text Label 5000 2800 0    60   ~ 0
GND
Text Label 5000 2900 0    60   ~ 0
GPIO17
Text Label 6100 2400 0    60   ~ 0
5V
Wire Wire Line
	5000 2400 5350 2400
Wire Wire Line
	5000 2800 5350 2800
Wire Wire Line
	4200 2900 4650 2900
Wire Wire Line
	4650 2900 5350 2900
Wire Wire Line
	6100 2400 5850 2400
$Comp
L SW_SPDT SW?
U 1 1 5AA8BD1B
P 4200 3300
F 0 "SW?" H 4200 3470 50  0001 C CNN
F 1 "SWITCH" H 4200 3500 50  0000 C CNN
F 2 "" H 4200 3300 50  0001 C CNN
F 3 "" H 4200 3300 50  0001 C CNN
	1    4200 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 2900 4200 3100
NoConn ~ 4300 3500
$Comp
L +3.3V #PWR?
U 1 1 5AA8BD94
P 3950 3500
F 0 "#PWR?" H 3950 3350 50  0001 C CNN
F 1 "+3.3V" H 3950 3640 50  0000 C CNN
F 2 "" H 3950 3500 50  0001 C CNN
F 3 "" H 3950 3500 50  0001 C CNN
	1    3950 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3500 3950 3550
Wire Wire Line
	3950 3550 4100 3550
Wire Wire Line
	4100 3550 4100 3500
$Comp
L LED D?
U 1 1 5AA8BF24
P 4650 3550
F 0 "D?" H 4650 3650 50  0001 C CNN
F 1 "LED" H 4650 3450 50  0000 C CNN
F 2 "" H 4650 3550 50  0001 C CNN
F 3 "" H 4650 3550 50  0001 C CNN
	1    4650 3550
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5AA8C072
P 4650 3150
F 0 "R?" V 4730 3150 50  0001 C CNN
F 1 "R" V 4650 3150 50  0000 C CNN
F 2 "" V 4580 3150 50  0001 C CNN
F 3 "" H 4650 3150 50  0001 C CNN
	1    4650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3000 4650 2900
Connection ~ 4650 2900
Wire Wire Line
	4650 3400 4650 3300
$Comp
L GND #PWR?
U 1 1 5AA8C0CC
P 4650 3800
F 0 "#PWR?" H 4650 3550 50  0001 C CNN
F 1 "GND" H 4650 3650 50  0000 C CNN
F 2 "" H 4650 3800 50  0001 C CNN
F 3 "" H 4650 3800 50  0001 C CNN
	1    4650 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3800 4650 3700
$EndSCHEMATC
