EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Timmed Off"
Date "2021-07-12"
Rev ""
Comp ""
Comment1 "Enclose in plastic case, no touch!"
Comment2 ""
Comment3 "    \"avrdude -c usbasp -p t10 -U fuse:w:0xFE:m\""
Comment4 "Disable RESET on ATTINY10 so that pin can be used as GPIO"
$EndDescr
$Comp
L Device:Fuse F1
U 1 1 60EC53EF
P 2900 2500
F 0 "F1" V 2980 2500 50  0000 C CNN
F 1 "2A" V 2825 2500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P5.08mm_Vertical" V 2830 2500 50  0001 C CNN
F 3 "~" H 2900 2500 50  0001 C CNN
	1    2900 2500
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 60EC5962
P 3700 2500
F 0 "C1" V 3550 2500 50  0000 C CNN
F 1 "0.47uF" V 3850 2500 50  0000 C CNN
F 2 "Capacitor_THT:C_Rect_L29.0mm_W11.0mm_P27.50mm_MKT" H 3738 2350 50  0001 C CNN
F 3 "~" H 3700 2500 50  0001 C CNN
	1    3700 2500
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 60EC5D6C
P 3700 2200
F 0 "R1" V 3780 2200 50  0000 C CNN
F 1 "820k" V 3700 2200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3630 2200 50  0001 C CNN
F 3 "~" H 3700 2200 50  0001 C CNN
	1    3700 2200
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 60EC6555
P 3700 3200
F 0 "R2" V 3780 3200 50  0000 C CNN
F 1 "1k" V 3700 3200 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P7.62mm_Vertical" V 3630 3200 50  0001 C CNN
F 3 "~" H 3700 3200 50  0001 C CNN
	1    3700 3200
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D2
U 1 1 60EC7EE5
P 4900 3200
F 0 "D2" H 4900 3300 50  0000 C CNN
F 1 "4.7V" H 4900 3100 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" H 4900 3200 50  0001 C CNN
F 3 "~" H 4900 3200 50  0001 C CNN
	1    4900 3200
	0    1    1    0   
$EndComp
$Comp
L Device:CP C2
U 1 1 60EC85FD
P 5200 3200
F 0 "C2" H 5225 3300 50  0000 L CNN
F 1 "470uF" H 5225 3100 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.80mm" H 5238 3050 50  0001 C CNN
F 3 "~" H 5200 3200 50  0001 C CNN
	1    5200 3200
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATtiny:ATtiny10-TS U1
U 1 1 60EC94AF
P 6100 3650
F 0 "U1" H 5600 4200 50  0000 L BNN
F 1 "ATtiny10-TS" H 6200 3100 50  0000 L TNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 6100 3650 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8127-AVR-8-bit-Microcontroller-ATtiny4-ATtiny5-ATtiny9-ATtiny10_Datasheet.pdf" H 6100 3650 50  0001 C CNN
	1    6100 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 60ECA628
P 6350 2850
F 0 "C3" V 6200 2850 50  0000 C CNN
F 1 "100n" V 6500 2850 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D6.0mm_W2.5mm_P5.00mm" H 6388 2700 50  0001 C CNN
F 3 "~" H 6350 2850 50  0001 C CNN
	1    6350 2850
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J1
U 1 1 60ECCD0E
P 2250 2500
F 0 "J1" H 2250 2600 50  0000 C CNN
F 1 "L" H 2250 2400 50  0000 C CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 2250 2500 50  0001 C CNN
F 3 "~" H 2250 2500 50  0001 C CNN
	1    2250 2500
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 J2
U 1 1 60ECD198
P 2250 3200
F 0 "J2" H 2250 3300 50  0000 C CNN
F 1 "N" H 2250 3100 50  0000 C CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 2250 3200 50  0001 C CNN
F 3 "~" H 2250 3200 50  0001 C CNN
	1    2250 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2450 2500 2750 2500
Wire Wire Line
	3050 2500 3350 2500
Wire Wire Line
	3550 2200 3350 2200
Wire Wire Line
	3350 2200 3350 2500
Connection ~ 3350 2500
Wire Wire Line
	3350 2500 3550 2500
Wire Wire Line
	3850 2500 4100 2500
Wire Wire Line
	4100 2500 4100 2200
Wire Wire Line
	4100 2200 3850 2200
Wire Wire Line
	4100 2500 4400 2500
Wire Wire Line
	4400 2500 4400 2550
Connection ~ 4100 2500
Wire Wire Line
	4400 3150 4400 3200
Wire Wire Line
	4400 3200 3850 3200
Wire Wire Line
	2450 3200 3350 3200
$Comp
L power:GND #PWR01
U 1 1 60ED4D8F
P 4050 2900
F 0 "#PWR01" H 4050 2650 50  0001 C CNN
F 1 "GND" H 4050 2750 50  0000 C CNN
F 2 "" H 4050 2900 50  0001 C CNN
F 3 "" H 4050 2900 50  0001 C CNN
	1    4050 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2900 4050 2850
Wire Wire Line
	4050 2850 4100 2850
Wire Wire Line
	4700 2850 4900 2850
Wire Wire Line
	5200 2850 5200 3050
Wire Wire Line
	4900 3050 4900 2850
Connection ~ 4900 2850
Wire Wire Line
	4900 2850 5200 2850
$Comp
L power:GND #PWR02
U 1 1 60EE5375
P 4900 3400
F 0 "#PWR02" H 4900 3150 50  0001 C CNN
F 1 "GND" H 4900 3250 50  0000 C CNN
F 2 "" H 4900 3400 50  0001 C CNN
F 3 "" H 4900 3400 50  0001 C CNN
	1    4900 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 60EE5740
P 5200 3400
F 0 "#PWR03" H 5200 3150 50  0001 C CNN
F 1 "GND" H 5200 3250 50  0000 C CNN
F 2 "" H 5200 3400 50  0001 C CNN
F 3 "" H 5200 3400 50  0001 C CNN
	1    5200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3400 5200 3350
Wire Wire Line
	4900 3400 4900 3350
Wire Wire Line
	5200 2850 6100 2850
Wire Wire Line
	6100 2850 6100 3050
Connection ~ 5200 2850
$Comp
L power:GND #PWR05
U 1 1 60EEEB2E
P 6550 2900
F 0 "#PWR05" H 6550 2650 50  0001 C CNN
F 1 "GND" H 6550 2750 50  0000 C CNN
F 2 "" H 6550 2900 50  0001 C CNN
F 3 "" H 6550 2900 50  0001 C CNN
	1    6550 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2900 6550 2850
Wire Wire Line
	6550 2850 6500 2850
Wire Wire Line
	6200 2850 6100 2850
Connection ~ 6100 2850
$Comp
L power:GND #PWR04
U 1 1 60EF2AF2
P 6100 4300
F 0 "#PWR04" H 6100 4050 50  0001 C CNN
F 1 "GND" H 6100 4150 50  0000 C CNN
F 2 "" H 6100 4300 50  0001 C CNN
F 3 "" H 6100 4300 50  0001 C CNN
	1    6100 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 4300 6100 4250
$Comp
L Device:R R6
U 1 1 60EF5C8B
P 7150 3450
F 0 "R6" V 7230 3450 50  0000 C CNN
F 1 "220" V 7150 3450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7080 3450 50  0001 C CNN
F 3 "~" H 7150 3450 50  0001 C CNN
	1    7150 3450
	0    1    1    0   
$EndComp
$Comp
L Relay_SolidState:S102S02 U2
U 1 1 60EF7871
P 7950 3550
F 0 "U2" H 7750 3750 50  0000 L CNN
F 1 "SPA4191" H 7950 3750 50  0000 L CNN
F 2 "pl_SSR:SPA4191" H 7750 3350 50  0001 L CIN
F 3 "" H 7950 3550 50  0001 L CNN
	1    7950 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 60EF8BCE
P 7550 3750
F 0 "#PWR09" H 7550 3500 50  0001 C CNN
F 1 "GND" H 7550 3600 50  0000 C CNN
F 2 "" H 7550 3750 50  0001 C CNN
F 3 "" H 7550 3750 50  0001 C CNN
	1    7550 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3450 7000 3450
Wire Wire Line
	7300 3450 7650 3450
Wire Wire Line
	7650 3650 7550 3650
Wire Wire Line
	7550 3650 7550 3750
Text Notes 7350 3450 0    50   ~ 0
16mA
Text Label 3200 2500 0    50   ~ 0
L
Text Label 3200 3200 0    50   ~ 0
N
Wire Wire Line
	8250 3450 8350 3450
Wire Wire Line
	8350 3450 8350 1950
Wire Wire Line
	8350 1950 3350 1950
Wire Wire Line
	3350 1950 3350 2200
Connection ~ 3350 2200
$Comp
L Connector_Generic:Conn_01x01 J3
U 1 1 60F078A9
P 8600 3650
F 0 "J3" H 8600 3750 50  0000 C CNN
F 1 "L" H 8600 3550 50  0000 C CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 8600 3650 50  0001 C CNN
F 3 "~" H 8600 3650 50  0001 C CNN
	1    8600 3650
	1    0    0    1   
$EndComp
Wire Wire Line
	8250 3650 8400 3650
$Comp
L Device:R R4
U 1 1 60F0ACE3
P 7150 2950
F 0 "R4" V 7230 2950 50  0000 C CNN
F 1 "560" V 7150 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7080 2950 50  0001 C CNN
F 3 "~" H 7150 2950 50  0001 C CNN
	1    7150 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D3
U 1 1 60F108C8
P 7850 2950
F 0 "D3" H 7850 3050 50  0000 C CNN
F 1 "RED" H 7850 2850 50  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" H 7850 2950 50  0001 C CNN
F 3 "~" H 7850 2950 50  0001 C CNN
	1    7850 2950
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 60F112C4
P 8100 3050
F 0 "#PWR08" H 8100 2800 50  0001 C CNN
F 1 "GND" H 8100 2900 50  0000 C CNN
F 2 "" H 8100 3050 50  0001 C CNN
F 3 "" H 8100 3050 50  0001 C CNN
	1    8100 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3350 6850 3350
Wire Wire Line
	6850 3350 6850 2950
Wire Wire Line
	8000 2950 8100 2950
Wire Wire Line
	8100 2950 8100 3050
Text Notes 5800 4900 0    50   ~ 0
PB2
Text Notes 6000 4900 0    50   ~ 0
PB3
Text Notes 6200 4900 0    50   ~ 0
T
Text Notes 5800 5300 0    50   ~ 0
H
Text Notes 6000 5300 0    50   ~ 0
H
Text Notes 6200 5000 0    50   ~ 0
30min
Text Notes 5800 5100 0    50   ~ 0
H
Text Notes 6000 5100 0    50   ~ 0
L
Text Notes 6200 5100 0    50   ~ 0
1hr
Text Notes 5800 5200 0    50   ~ 0
L
Text Notes 6000 5200 0    50   ~ 0
H
Text Notes 6200 5200 0    50   ~ 0
2hrs
Text Notes 5800 5000 0    50   ~ 0
L
Text Notes 6000 5000 0    50   ~ 0
L
Text Notes 6200 5300 0    50   ~ 0
3hrs
Wire Notes Line style solid
	5800 5300 6450 5300
Wire Notes Line style solid
	6450 4800 5800 4800
Wire Notes Line style solid
	5800 4900 6450 4900
Wire Notes Line
	6000 4800 6000 5300
Wire Notes Line
	6200 4800 6200 5300
$Comp
L Device:R R3
U 1 1 60F3B7B7
P 6800 4100
F 0 "R3" V 6880 4100 50  0000 C CNN
F 1 "1.2k" V 6800 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6730 4100 50  0001 C CNN
F 3 "~" H 6800 4100 50  0001 C CNN
	1    6800 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 60F3C83D
P 7000 4100
F 0 "R5" V 7080 4100 50  0000 C CNN
F 1 "1.2k" V 7000 4100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6930 4100 50  0001 C CNN
F 3 "~" H 7000 4100 50  0001 C CNN
	1    7000 4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 60F3D2B2
P 7000 4300
F 0 "#PWR07" H 7000 4050 50  0001 C CNN
F 1 "GND" H 7000 4150 50  0000 C CNN
F 2 "" H 7000 4300 50  0001 C CNN
F 3 "" H 7000 4300 50  0001 C CNN
	1    7000 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 60F3D6FF
P 6800 4300
F 0 "#PWR06" H 6800 4050 50  0001 C CNN
F 1 "GND" H 6800 4150 50  0000 C CNN
F 2 "" H 6800 4300 50  0001 C CNN
F 3 "" H 6800 4300 50  0001 C CNN
	1    6800 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 3950 6800 3650
Wire Wire Line
	6800 3650 6700 3650
Wire Wire Line
	7000 3950 7000 3550
Wire Wire Line
	7000 3550 6700 3550
Wire Wire Line
	6800 4300 6800 4250
Wire Wire Line
	7000 4300 7000 4250
Text Notes 5800 4800 0    50   ~ 0
Timeout Settings
Wire Notes Line style solid
	6450 4700 5800 4700
Wire Notes Line style solid
	5800 4700 5800 5300
Wire Notes Line style solid
	6450 4700 6450 5300
$Comp
L Connector_Generic:Conn_01x01 J4
U 1 1 60F74E52
P 8600 4550
F 0 "J4" H 8600 4650 50  0000 C CNN
F 1 "N" H 8600 4450 50  0000 C CNN
F 2 "TestPoint:TestPoint_Plated_Hole_D2.0mm" H 8600 4550 50  0001 C CNN
F 3 "~" H 8600 4550 50  0001 C CNN
	1    8600 4550
	1    0    0    1   
$EndComp
Wire Wire Line
	3350 4550 3350 3200
Connection ~ 3350 3200
Wire Wire Line
	3350 3200 3550 3200
Wire Wire Line
	3350 4550 8400 4550
$Comp
L Diode_Bridge:MB2S D1
U 1 1 60FC8224
P 4400 2850
F 0 "D1" H 4500 3125 50  0000 L CNN
F 1 "S1WB" H 4500 3050 50  0000 L CNN
F 2 "Diode_THT:Diode_Bridge_DIP-4_W7.62mm_P5.08mm" H 4550 2975 50  0001 L CNN
F 3 "" H 4400 2850 50  0001 C CNN
	1    4400 2850
	1    0    0    -1  
$EndComp
Text Notes 3550 2750 0    50   ~ 0
275V X2
Text Notes 3350 3400 0    50   ~ 0
Carbon Composite
Text Notes 4900 2800 0    50   ~ 0
Max Current: 29mA
Text Notes 3350 5400 0    50   ~ 0
Xc = 1/(2*pi*f*C1)\nXc = 1/(2*3.14*60Hz*0.47e-6F)\nXc = 5644ohms\n\nZc = |Xc|\nZall = sqrt(Zc^2 + R2^2)\n\nImax = (120Vrms * sqrt(2)) / Zall\nImax = 29mA
Wire Wire Line
	6850 2950 7000 2950
Wire Wire Line
	7300 2950 7700 2950
Text Notes 7350 2950 0    50   ~ 0
4mA
$EndSCHEMATC
