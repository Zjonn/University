/*
* Zad4.ino
*
* Created: 12/22/2017 2:50:24 AM
* Author: Zjonn
*/

#define MOSI 0x2
#define MISO 0x4
#define SCK  0x8
#define SS   0x1

#define DEBUG_LED 0x40
#define OK_LED 0x80

#define SPI_MISO 0x10

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

void initSLI() {
    SPCR |= SET(SPE) | SET(DORD);
    DDRB |= SPI_MISO;
}

void init() {
    DDRD |= MOSI | SCK | SS;
    DDRD |= DEBUG_LED | OK_LED;

    PORTD |= SS;
}

int main() {
    initSLI();
    init();

    for(uint8_t num=0; 1; num++) {
        uint8_t toSend = num;
        // PORTD &= ~SS;

        for(uint8_t i = 0; i<8; i++) {
            PORTD = (toSend & 0x1) ? PORTD | MOSI : PORTD & ~MOSI;
            PORTD |= SCK;
            PORTD &= ~SCK;

            toSend >>= 1;
        }

        PORTD = (SPSR & (1<<SPIF)) ? PORTD | DEBUG_LED : PORTD & ~DEBUG_LED;
        uint8_t x = SPDR;
        //printf("%"PRIu8"\n", x);
        PORTD = (x == num) ? PORTD | OK_LED : PORTD & ~OK_LED;

        //PORTD |= SS;
        _delay_ms(100);
    }
}
