/*
* Zad3.ino
*
* Created: 1/12/2018 4:30:07 AM
* Author: danie
*/
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define SET(X)(1<<X)

void initTimer() {
    TCCR1A |= SET(COM1A1);

    TCCR1B |= SET(WGM13) | SET(CS12);

    TIMSK1 |= SET(ICIE1);

    ICR1 = 625;
    OCR1A = 17;
}

void initADC() {
    ADMUX |= SET(REFS0);
    ADCSRA |= SET(ADEN) | SET(ADIE);
    ADCSRA |= SET(ADPS0) | SET(ADPS2);
}

ISR(TIMER1_CAPT_vect) {
    ADCSRA |= SET(ADSC);
}

ISR(ADC_vect) {
    OCR1A = 19 + 53 * ADC/1024;
}

int main() {
    DDRB = 0x02;
    initTimer();
    initADC();
    sei();
    while(1)
        sleep_cpu();
}
