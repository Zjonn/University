/*
 * Zad 2.cpp
 *
 * Created: 30.11.2017 19:53:03
 * Author : Zjonn
 */

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define BUTTON 0x1
#define LED 0x2

#define SET(x)(1<<x)

int tab[100] = {0};
int i = 0;

void initTimer() {
    TCCR0A |= SET(WGM01);
    TCCR0B |= SET(CS02) | SET(CS00);
    OCR0A = 155;
    TIMSK0 |= SET(OCIE0A);
    TIFR0 |= SET(OCF0A);
}

ISR(TIMER0_COMPA_vect) {
    PORTB = tab[i] ? PORTB | LED : PORTB & ~LED;
    tab[i] = ~PINB & BUTTON;
    i = (i == 99) ? 0 : i + 1;
}


int main(void) {
    /* Replace with your application code */
    initTimer();
    DDRB  |= LED;
    PORTB |= BUTTON;

    sei();
    sleep_enable();
    while (1) {
        sleep_cpu();
        // sleep_disable();
    }
}
