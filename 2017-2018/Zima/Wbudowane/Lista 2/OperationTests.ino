/*
* OperationTests.ino
*
* Created: 11/4/2017 8:25:53 PM
* Author: Zjonn
*/
#include <stdio.h>
#include <inttypes.h>
#include <math.h>

#define BAUD 9600
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)

#define LOOPS 1

FILE uart_file;


void initTimers() {
    TCCR1B |= 1<<CS10;
}

// transmisja jednego znaku
int uart_transmit(char data, FILE *stream) {
    // czekaj a¿ transmiter gotowy
    while(!(UCSR0A & _BV(UDRE0)));
    UDR0 = data;
    return 0;
}

// odczyt jednego znaku
int uart_receive(FILE *stream) {
    // czekaj a¿ znak dostêpny
    while (!(UCSR0A & _BV(RXC0)));
    return UDR0;
}

// inicjalizacja UART
void uart_init() {
    // ustaw baudrate
    UBRR0 = UBRR_VALUE;
    // w³¹cz odbiornik i nadajnik
    UCSR0B = _BV(RXEN0) | _BV(TXEN0);
    // ustaw format 8n1
    UCSR0C = _BV(UCSZ00) | _BV(UCSZ01);

    fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
    stdin = stdout = stderr = &uart_file;
}


void print(char * name) {
    uint16_t time = TCNT1;
    printf("%s %"PRIu16"\n", name, time-6);
}

uint8_t t_uint8() {
    uint8_t v = rand()%10+2;

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v+=v;

    print("Add8");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v*=v;

    print("Mul8");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v/=v;

    print("Div8");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v=v%v;

    print("Mod8");

    return v;
}

uint16_t t_uint16() {
    uint16_t v = (rand()%10+2);

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v+=v;

    print("Add16");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v*=v;

    print("Mul16");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v/=v;

    print("Div16");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v=v%v;

    print("Mod16");

    return v;
}

uint32_t t_uint32() {
    uint32_t v =( rand()%10+2);

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v+=v;

    print("Add32");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v*=v;

    print("Mul32");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v/=v;

    print("Div32");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v=v%v;

    print("Mod32");
    return v;
}

float t_float() {
    float v = rand()%10+5*0.66;

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v+=v;

    print("AddFloat");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v*=v;

    print("MulFloat");

    TCNT1 = 0;

    for(int i = 3; i<LOOPS+3; i++)
        v = pow(v,i);

    print("PowFloat");

    return v;
}

double t_double() {
    double v = rand()%10+5*0.66;

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v+=v;

    print("AddDouble");

    TCNT1 = 0;

    for(int i = 0; i<LOOPS; i++)
        v*=v;

    print("MulDouble");

    TCNT1 = 0;

    for(int i = 3; i<LOOPS+3; i++)
        v = pow(v,i);

    print("PowDouble");

    return v;
}

int main(void) {

    initTimers();
    uart_init();

    //while (1)
    int a;
    //_delay_ms(10);
    a += t_uint8();

    //_delay_ms(10);
    a -= t_uint16();

    //_delay_ms(10);
    a += t_uint32();

    a -= t_float();

    a += t_double();


    return a;
}



