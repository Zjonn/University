/*
* 1sDelay.c
*
* Created: 12.10.2017 17:44:30
* Author : Zjonn
*/

#include <avr/io.h>
#include <util/delay.h>

#define int8 uint8_t

#define IN 0b0000001
#define LED 0b11111111


int8 bufor[100] = {0};

int main(void) {
    DDRD = LED;

    int8 i = 0;
    while (1) {
        if(i==100) i=0;

        PORTD = (bufor[i] == 1) ? LED : 0;
        bufor[i] = PINB & IN;
        i++;

        _delay_ms(10);
    }
}
