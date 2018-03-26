/*
* zad1.ino
*
* Created: 11/18/2017 11:22:50 PM
* Author: Zjonn
*/
#include <math.h>

#define SET(x)(1<<x)
#define _BV(x)(1<<x)

#define LED 0x2

#define BAUD 9600
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)
FILE uart_file;

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

void initADC() {
    ADMUX |= SET(REFS0);
    DIDR0  |= SET(ADC0D);

    //prescaler
    ADCSRA |= SET(ADPS2) | SET(ADPS0) | SET(ADPS1);
    //start ADC | ~free mode
    ADCSRA |= SET(ADEN) /*| / *SET(ADATE)* /*/;


}

int main() {
    initADC();
    uart_init();

    while(1) {
        ADCSRA |= SET(ADSC);
        while((ADCSRA & SET(ADSC)));
        float adc = ADC/204.8;
        //tu w przciwieñstwie do 1 zadania wartoœæ rezystancji nie jest ograniczana miêdzy 0-255
        int16_t val = 10000*adc/(5-adc);

        //Za termometr s³u¿y³o mi zadanie 3 :)
        //T0 278K 5 C
        //R0 10500 Ohm
        //B 3483
        int16_t temp = 3483.6 * (278.0/(278.0*log(val/10500.0) + 3483.0))-273;

        printf("%"PRId16" C\n",temp);
        _delay_ms(200);
    }
}