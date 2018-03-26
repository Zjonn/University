/*
* zad3.ino
*
* Created: 11/20/2017 10:17:46 PM
* Author: Zjonn
*/

#define NPN 0x4
#define LED 0x2
//Jaka chcemy miec temperature
#define TEMP 22
//Oczekiwane odchylenie (w dó³)
#define TOLERANCY 0.5

#define TmV ((TEMP*10)+500)
#define EmV (TOLERANCY*10)

#define SET(x)(1<<x)

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

void initADC() {
    ADMUX  |= SET(REFS0) | SET(REFS1);
    ADMUX  |= ADC1D;

    DIDR0  |= SET(ADC1D);

    //prescaler
    ADCSRA |= SET(ADPS2) | SET(ADPS0) | SET(ADPS1);
    //start ADC | ~free mode
    ADCSRA |= SET(ADEN) /*| / *SET(ADATE)* /*/;
}

void initDDR() {
    DDRB |= NPN | LED;
}

void setHeater(int val) {
    if(val<TmV-EmV || val > TmV)
        PORTB = (val<TmV) ? PORTB | NPN | LED : PORTB & ~(NPN | LED);
}

int main() {
    initDDR();
    initADC();
    uart_init();

    PORTB |= NPN | LED;

    uint8_t portState;
    uint16_t val;
    int16_t temp;

    while(1) {
        portState = PORTB & NPN;
        PORTB &= ~NPN;

        ADCSRA |= SET(ADSC);
        while((ADCSRA & SET(ADSC)));

        val = ADC*1.075;

        PORTB |= portState;

        setHeater(val);

        //arytmetyka stalopozycyjna
        temp = ((val-500)<<6)/10;
        printf("%"PRIu16" mV : %"PRId16".%02"PRIu16" C \n", val, temp>>6,
               ((temp&0x003F)*100)/(1<<6));

        _delay_ms(100);
    }
}
