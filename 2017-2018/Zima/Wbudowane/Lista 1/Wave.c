/*
* Wave.c
*
* Created: 10.10.2017 21:37:55
* Author : Zjonn
*/

#include <avr/io.h>
#include <util/delay.h>

#define int8 uint8_t

void setup();

int main(void) {
    setup();

    int8 i=0;
    PORTD = 1;

    while (1) {
        if(PORTD == 0b010000000 || PORTD == 1)
            i = ~i;
        if(i)
            PORTD=PORTD<<1;
        else
            PORTD=PORTD>>1;
        _delay_ms(100);
    }
}

void setup() {
    DDRD = 0b11111111;
}




