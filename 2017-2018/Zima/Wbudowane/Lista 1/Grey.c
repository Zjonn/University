/*
* Grey.c
*
* Created: 12.10.2017 22:39:01
* Author : Zjonn
*/

#include <avr/io.h>
#include <util/delay.h>

#define int8 uint8_t
#define MASK 0b1111111

int main(void) {
	DDRD = MASK;

	int8 bit4 = 0;
	int8 pressed = 0;

	while (1) {
		if(PINB & 0b111) {
			_delay_ms(20);
			switch(PINB & 0b111) {
				case 1:
				pressed = 1;
				break;
				case 2:
				pressed = 2;
				break;
				case 4:
				pressed = 3;
				break;
			}
		}
		if(pressed && !(PINB & 0b111)) {
			switch(pressed) {
				case 1:
				bit4 = 0;
				break;
				case 2:
				bit4 = (bit4==MASK) ? 0 : bit4 + 1;
				break;
				case 3:
				bit4 = (bit4==0)  ? 0 : bit4 - 1;
				break;
			}
			PORTD = (bit4 ^ ((bit4 >> 1) & MASK));
			pressed = 0;
		}
	}
}