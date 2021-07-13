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
#include <util/delay.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>

#include "main.h"

#define TIMEOUT_MINUTES     1UL  /* timeout after X minutes */
#define TIMPUT_ms           (TIMEOUT_MINUTES * 60UL * 1000UL)

/* Timer0 1Hz Tick */
#define TIMER_PRELOAD   (58594) /* with precaler of 1024 on Timer0, 58,594 is ~60s when sys clock is 1MHz */
//#define TIMER_PRELOAD   (7500) /* with a prescaler of 1024 on Timer0, 7,500 is ~60s when sys clock is 128kHz */

/* Funciton Prototypes */
void enableTimer0(void);
void disableTimer0(void);

int main(void) {
    /* set PB0 and PB1 as output */
    DDRB |= BIT0;
    DDRB |= BIT1;

    enableTimer0();
    sei();

    // /* set PB0 HIGH for initial startup */
    // SET(PORTB, 0);
    // SET(PORTB, 1);
    // _delay_ms(TIMPUT_ms);

    // /* set PB0 LOW to reset */
    // RESET(PORTB, 0);
    // RESET(PORTB, 1);

    /* go to sleep */
    set_sleep_mode(SLEEP_MODE_PWR_DOWN);
    // sleep_enable();
    
    /* should never get here */
    while(1) {
        
    }
}

/* eanble timer0 to trigger ISR for auto power off */
void enableTimer0(void) {
    TCCR0A = 0;                         /* OC0A/OC0B disconnected ie no output on pins*/
    TCCR0B = (BIT3 + BIT2 + BIT0);      /* clear timer on compare,  timer prescaler is 1024*/

    OCR0AH = (TIMER_PRELOAD >> 8);      /* set output compare register high byte */
    OCR0AL = (TIMER_PRELOAD & 0xFF);    /* set output compare register low byte */

    TCNT0H = 0;                         /* set timer count to zero */
    TCNT0L = 0;

    TIMSK0 |= (1 << OCIE0A);            /* enable ISR on Output compare A match */
}

/* disable timer0 when sleeping to save power */
void disableTimer0(void) {
    TCCR0A = 0;
    TCCR0B &= ~(BIT2 + BIT1 + BIT0);    /* set timer prescaler to 0 to disable */

    TIMSK0 &= ~(1 << OCIE0A);           /* disable ISR */
}

ISR(TIM0_COMPA_vect) {
    TOGGLE(PORTB, 0);
    TOGGLE(PORTB, 1);
}