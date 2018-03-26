/*
* reciverIR.ino
*
* Created: 10/30/2017 11:28:15 PM
* Author: Zjonn
*/
#define SET(VAL)(1 << VAL)

void initTimer() {
    cli();
    TCCR1B |= SET(WGM12);
    TCCR1B |= SET(CS10) | SET(CS12);

    OCR1A = 350;

    TIMSK1 |= SET(OCIE1A);
    sei();


    TCCR2A |= SET(WGM21); // CCT
    TCCR2A |= SET(COM2A0);
    TCCR2B |= /*SET(CS22) |*/ SET(CS20) /*| SET(CS20)*/; 
    OCR2A = 210;
}

ISR(TIMER1_COMPA_vect) {
    DDRB ^= 0x08;
}

int main() {
    initTimer();
    DDRD = 0x10;

    PORTB |= 0x01;
    while(1) {
        if(!(PINB & 0x01))
            PORTD |= 0x10;
        else
            PORTD &= ~0x10;
    }
}