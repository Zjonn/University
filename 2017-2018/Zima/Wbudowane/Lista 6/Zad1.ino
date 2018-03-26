/*
* Zad1.ino
*
* Created: 1/11/2018 8:53:36 PM
* Author: Zjonn
*/

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define SET(X)(1<<X)

volatile uint8_t state = 0;

void init() {
    DDRD |= 0x70;
    PORTD |= 0x18;
}


void initTimer() {
	TCCR0A = 0;
	TCCR0B = 0;
    TCCR0A |= SET(COM0A1);

    TCCR0A |= SET(WGM00) ;//| SET(WGM01);
    //TCCR0B |= SET(WGM02);

    TCCR0B |= SET(CS02) ;

    TIMSK0 |= SET(TOIE0);
    //OCR0A = 0;
}

void initADC() {
    ADMUX |= SET(REFS0);
    ADCSRA |= SET(ADEN) | SET(ADIE);
    ADCSRA |= SET(ADPS0) | SET(ADPS2);
}

ISR(TIMER0_OVF_vect) {
    ADCSRA |= SET(ADSC);
}

ISR(ADC_vect) {
    OCR0A = ADC/4;
    if(state == 0 && !(PIND & 0x08)) state = 1;
    if(state == 1 && PIND & 0x08) {
        state = 0;
        PORTD ^= 0x30;

    }
}

int main() {
    init();
    initTimer();
    initADC();

    sei();
    ADCSRA |= SET(ADSC);
    while(1)
        sleep_cpu();
}
