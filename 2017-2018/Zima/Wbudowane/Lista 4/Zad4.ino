/*
 * Zad4.ino
 *
 * Created: 12/2/2017 12:50:01 AM
 * Author: Zjonn
 */

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define SET(x)(1<<x)

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem
FILE uart_file;

volatile int16_t val[100] = {0};
volatile int32_t av = 0;
//volatile int8_t iNRed;

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
    ADMUX |= SET(REFS0);
    ADMUX |= SET(MUX3) | SET(MUX2) | SET(MUX1);

    //prescaler
    ADCSRA |= SET(ADPS2) | SET(ADPS0) | SET(ADPS1);
    //start ADC | ~free mode
    ADCSRA |= SET(ADEN) /*| / *SET(ADATE)* /*/;
    //przerwania
    ADCSRA |= SET(ADIE);
}


uint16_t wariancja() {
    av /= 100;
    int32_t v = 0;
    for(int i = 0; i<100; i++){
        v += (val[i]-av)*(val[i]-av);
		/printf("War: %"PRIu16"\n",val[i]);
		}

    return v/100;
}

EMPTY_INTERRUPT(ADC_vect);

int main() {
    uart_init();
    initADC();


    printf("Start\n");
    //Normal
    for(int i = 0; i<100; i++) {
        ADCSRA |= SET(ADSC);
        while((ADCSRA & SET(ADSC)));
        val[i] = ADC*5;
		//printf("Normal: %"PRIu16"\n",val[i]);
        av += val[i];
    }
    printf("Normal: %"PRIu16"\n",wariancja());
    _delay_ms(10);

    //Noise Reduction
    av = 0;
    set_sleep_mode(SLEEP_MODE_ADC);
    sleep_enable();
    sei();
    for(int i = 0; i<100; i++) {
        ADCSRA |= SET(ADSC);
        sleep_mode();

        val[i] = ADC*5;
		//printf("NR: %"PRIu16"\n",val[i]);
		_delay_ms(1);
        av += val[i];
    }
    cli();
    sleep_disable();

    printf("Noise reduction: %"PRIu16"\n",wariancja());
    while(1);

}
