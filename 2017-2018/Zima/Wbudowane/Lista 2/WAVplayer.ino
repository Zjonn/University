/*
 * WAVplayer.cpp
 *
 * Created: 09.11.2017 20:15:49
 * Author : Zjonn
 */

#include <avr/io.h>
#include "sounddata.h"

#define int8 uint8_t
#define SPEAKER 0b01000000
#define SET(x)(1<<x)
#define _BV(x)(1<<x)

int iter = 0;

void initTimer() {
    TCCR0A |= SET(COM0A1);
    TCCR0A |= SET(WGM01) | SET(WGM00);
    TCCR0B |= SET(CS00);

    cli();
    TCCR1B |= SET(WGM12);
    TCCR1B |= SET(CS10);
    OCR1A = 2000;
    TIMSK1 |= SET(OCIE1A);
    sei();
}

ISR(TIMER1_COMPA_vect) {
    if(iter < sounddata_length)
        iter++;
    else
        iter = 0;

    OCR0A = pgm_read_byte(&(sounddata_data[iter]));
}


int main(void) {
    initTimer();

    DDRD |= SPEAKER | 0x10;

    while (1) {
    }
}
