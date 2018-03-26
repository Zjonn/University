/*
* POW.ino
*
* Created: 10/20/2017 1:59:02 AM
* Author: danie
*/
#define int8 uint8_t


int main() {
    DDRD = ~0;
    int toDisp[] = {
        0b10000,
        0b11000,
        0b10100,
        0b10010,
        0b1111111,
        0b1000,
        0,
        0b11000010,
        0b10100001,
        0b10010001,
        0b10001001,
        0b10000101,
        0b11000011,
        0,
        0
    };
    for(int i = 0;; i++) {
        if(i == 15)
            i=0;
        PORTD = toDisp[i];
        _delay_ms(6);
    }
}
