/*
 * zad4.ino
 *
 * Created: 11/23/2017 7:20:34 PM
 * Author: Zjonn
 */
#define SET(x)(1<<x)
#define NPN 0x4

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem
FILE uart_file;

// inicjalizacja UART
void uart_init() {
    // ustaw baudrate
    UBRR0 = UBRR_VALUE;
    // wyczyœæ rejestr UCSR0A
    UCSR0A = 0;
    // w³¹cz odbiornik i nadajnik
    UCSR0B = _BV(RXEN0) | _BV(TXEN0);
    // ustaw format 8n1
    UCSR0C = _BV(UCSZ00) | _BV(UCSZ01);

    fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
    stdin = stdout = stderr = &uart_file;
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

void initDDR() {
    PORTB |= NPN;
}

void initADC() {
    ADMUX |= SET(REFS0);
    ADMUX |= SET(MUX3) | SET(MUX2) | SET(MUX1);

    //prescaler
    ADCSRA |= SET(ADPS2) | SET(ADPS0) | SET(ADPS1);
    //start ADC | ~free mode
    ADCSRA |= SET(ADEN) /*| / *SET(ADATE)* /*/;
}

void initTimers() {
    TCCR1A |= SET(OCR1B);
    TCCR1A |= SET(WGM11);

    TCCR1B |= SET(WGM12) | SET(WGM13);
    TCCR1B |= SET(CS10) | SET(CS12);
}

int main() {
    initDDR();
    initADC();
    uart_init();

    printf("Napiecie w V : grzalka 1=on | 0=off\n");
    while(1) {
        PORTB ^= NPN;
        ADCSRA |= SET(ADSC);
        while((ADCSRA & SET(ADSC)));

        uint16_t vcc =(1126<<5)/ADC;
        //arytmetyka stalopozycyjna
        printf("%"PRId16".%02"PRIu16" V : H %"PRIu8"\n",
               vcc>>5,
               ((vcc&0x003F)*100)/(1<<5), (PORTB & NPN) ? 1 : 0);
        _delay_ms(1000);
    }
}
