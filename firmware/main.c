/* Timed Power Off
 *  turn off SSR after set amount of time after first power on
 * 
 * Clk: 1MHz
 * Simple Connection Diagram
 *       ATTINY10
 *       ---------
 *   3v | 5  1 PB0| -> SSR
 *   GND| 2  3 PB1| -> LED
 *      |    4 PB2| <- Resistor
 *      |    6 PB3| <- Resistor
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

#define DELAY_ON_START_ms   5000    /* delay before turning on SSR on first power */

/* timeout settings */
#define TIMEOUT_0           30      /* timeout after X minutes, option 0 */
#define TIMEOUT_1           60      /* timeout after X minutes, option 1 */
#define TIMEOUT_2           120     /* timeout after X minutes, option 2 */
#define TIMEOUT_3           180     /* timeout after X minutes, option 3 */
uint8_t t_array[] = {TIMEOUT_0, TIMEOUT_1, TIMEOUT_2, TIMEOUT_3};

/* Timer0 60s Tick */
#define TIMER_PRELOAD   (58594)     /* with prescaler of 1024 on Timer0, 58,594 is ~60s when sys clock is 1MHz */
//#define TIMER_PRELOAD   (7500)      /* with a prescaler of 1024 on Timer0, 7,500 is ~60s when sys clock is 128kHz */

volatile uint8_t count = 0;         /* timer0 tick count */

/* Function Prototypes */
void enableTimer0(void);
void disableTimer0(void);

int main(void) {
    /* set PB0 and PB1 as output */
    DDRB |= (BIT0 + BIT1);

    /* set PB2 and PB3 as input, pullups */
    DDRB &= ~(BIT2 + BIT3);
    PUEB |= (BIT2 + BIT3);

    /* read PB2 and PB3 to get the timout setting */
    uint8_t timeout = t_array[(PINB & (BIT2 + BIT3)) >> 2];

    /* wait before enabling SSR to lessen current inrush */
    _delay_ms(DELAY_ON_START_ms);

    /* enable 60s timer */
    enableTimer0();
    sei();

    /* enable SSR and LED */
    PORTB |= (BIT0 + BIT1);

    /* set sleep mode */
    set_sleep_mode(SLEEP_MODE_IDLE);
    
    while(timeout > count) {
        sleep_enable();     /* enable sleep */
        sleep_cpu();        /* go to sleep */
        sleep_disable();    /* wake from sleep here on timer0 interrupt */
    }

    /* disable SSR and LED */
    PORTB &= ~(BIT0 + BIT1);

    /* disable timer0 */
    disableTimer0();
    
    while(1) {
        /* deep sleep with no interrupt */
        set_sleep_mode(SLEEP_MODE_PWR_DOWN);
        sleep_enable();     /* enable sleep */
        sleep_cpu();        /* go to sleep */
    }
}

/* enable timer0 to trigger ISR for auto power off */
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
    count++;
}