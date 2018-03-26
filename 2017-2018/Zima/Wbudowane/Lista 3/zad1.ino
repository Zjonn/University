/*
* zad1.ino
*
* Created: 11/18/2017 11:22:50 PM
* Author: Zjonn
*/

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

void initTimers() {
    TCCR1A |= SET(COM1A1);
    TCCR1A |= SET(WGM10);

    TCCR1B |= SET(WGM12);
    TCCR1B |= SET(CS10) | SET(CS12);
}

void initDDR() {
    DDRB |= LED;
}

int main() {
    initADC();
    initTimers();
    initDDR();
    uart_init();

    while(1) {
        ADCSRA |= SET(ADSC);
        while((ADCSRA & SET(ADSC))) ;
        uint16_t a = ADC/4;

        //wzór z wikipedii pracuj¹cy na wartoœciach 0-255
        OCR1A = a/(255-a);
        printf("%"PRId8" %"PRId8"\n",a,a/(255-a));
    }
}

