/* Timed Power Off
 *  turn off SSR after set amount of time after first power on
 * 
 * Clk: 1MHz
 * Simple Connection Diagram
 *       ATTINY10
 *       ---------
 *   3v | 5  1 PB0| -> SSR
 *   GND| 2  3 PB1| -> LED
 *      |    4 PB2|
 *      |    6 PB3|
 *       ---------
 *        SOT23-6
 * write fuse:
 *      avrdude -c usbasp -p t10 -U fuse:w:0xFE:m
 * 
 * verify fuse:
 *      avrdude -c usbasp -p t10 -t
 *      read fuse
 *      q
 */

#define F_CPU 1000000UL     /* for delay functions */

#include <stdint.h>
#include <avr/io.h>
#include <avr/delay.h>
#include <avr/sleep.h>

#include "main.h"

#define TIMEOUT_MINUTES     1UL  /* timeout after X minutes */
#define TIMPUT_ms           (TIMEOUT_MINUTES * 60UL * 1000UL)

int main(void) {
    /* set PB0 and PB1 as output */
    DDRB |= BIT0;
    DDRB |= BIT1;

    /* set PB0 HIGH for initial startup */
    SET(PORTB, 0);
    SET(PORTB, 1);
    _delay_ms(TIMPUT_ms);

    /* set PB0 LOW to reset */
    RESET(PORTB, 0);
    RESET(PORTB, 1);

    /* go to sleep */
    set_sleep_mode(SLEEP_MODE_PWR_DOWN);
    
    /* should never get here */
    while(1) {
        
    }
}