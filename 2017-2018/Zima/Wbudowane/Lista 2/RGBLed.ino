/*
* RGBLed.ino
*
* Created: 11/4/2017 2:06:36 AM
* Author: Zjonn
*/

#define SET(VAL)(1 << VAL)


#define int8 uint8_t
#define fixed uint16_t

#define FLOOR(x)((int8)(x>>8))
#define toFixed(x)((fixed)x<<8)

int tab[] {-1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 6, 6, 6, 7, 8, 8, 9, 9, 10, 11, 12, 12, 13, 14, 16, 17, 18, 19, 21, 22, 24, 25, 27, 29, 31, 34, 36, 39, 42, 45, 48, 51, 55, 59, 63, 68, 73, 78, 84, 90, 97, 103, 111, 119, 127, 137, 147, 157, 168, 181, 194, 207, 222, 238, 255, -2};

void initTimer() {
    TCCR0A |= SET(WGM00) | SET(WGM01); // PWM
    TCCR0A |= SET(COM0A1) | SET(COM0B1);
    TCCR0B |= SET(CS00); //1

    TCCR2A |= SET(WGM20) | SET(WGM21); // PWM
    TCCR2A |= SET(COM2B1);
    TCCR2B |= SET(CS20); //1
}

void HSVtoRGB(uint16_t H, fixed *R, fixed *G, fixed *B) {
    fixed hue = ((H<<7)/60)<<1;
    fixed f = hue & 0x00FF;

    int8 i = FLOOR(hue);

    int p = 0;

    fixed q = toFixed(1) - f;
    fixed t = f;

    switch(i) {
    case 0:
        *R = 0x0100, *G = t, *B = 0;
        break;
    case 1:
        *R = q, *G = 0x0100, *B = 0;
        break;
    case 2:
        *R = 0, *G = 0x0100, *B = t;
        break;
    case 3:
        *R = 0, *G = q, *B = 0x0100;
        break;
    case 4:
        *R = t, *G = 0, *B = 0x0100;
        break;
    case 5:
        *R = 0x0100, *G = 0, *B = q;
        break;
    }

}

void playColor() {
    int8 step = 20;
    uint16_t H = rand()%360;
    fixed R,G,B;
    HSVtoRGB(H,&R,&G,&B);

    int d = 1;
    for(int i = 1;;) {
        i = d ? i+1: i-1;

        if(tab[i] == -1)break;
        if(tab[i] == -2) {
            d = !d;
            continue;
        }
        OCR2B = 255-FLOOR(tab[i]*R);
        OCR0B = 255-FLOOR(tab[i]*B);
        OCR0A = 255-FLOOR(tab[i]*G);

        _delay_ms(30);
    }
}

int main() {
    initTimer();
    DDRD = 0xFF;
    int i = 0,d = 1;
    while(1)
        playColor();
}

