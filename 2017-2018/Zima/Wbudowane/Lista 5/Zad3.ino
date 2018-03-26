/*
 * Zad3.ino
 *
 * Created: 12/22/2017 5:53:37 AM
 * Author: Zjonn
 */

#define ORANGE_LED 0x40
#define RED_LED 0x20

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

//ctrl c ctrl v z datasheet
void initSPI() {
    /* Set MOSI and SCK output, all others input */
    DDRB = 0x2C;
    /* Enable SPI, Master, set clock rate fck/16 */
    SPCR = (1<<SPE)|(1<<MSTR)|(1<<SPR0);

}
//ctrl c ctrl v z datasheet
void SPI_MasterTransmit(int8_t cData) {
    /* Start transmission */
    SPDR = cData;
    /* Wait for transmission complete */
    while(!(SPSR & (1<<SPIF)))
        ;
}

void init() {
    DDRD = ORANGE_LED | RED_LED;
}


int main() {
    uart_init();
    initSPI();
    init();
    while(1) {
		int8_t num;
		
        num = rand()%100;
		printf("Hmm, moze to %"PRIu8"\n", num);
        SPI_MasterTransmit(num);
        _delay_ms(10);
        SPI_MasterTransmit(0);
		_delay_ms(1);
		int8_t val = SPDR;
        switch(val) {
        case 1:
            printf("Podana liczba jest wieksza niz wylosowana\n");
            PORTD = RED_LED;
            break;
        case 2:
            printf("Zgadles, brawo!\n");
            PORTD = RED_LED | ORANGE_LED;
            break;
        case 3:
            printf("Podana liczba jest mniejsza niz wylosowana\n");
            PORTD = ORANGE_LED;
            break;
        default:
            printf("Brak %"PRId8"\n", val);
        }
        _delay_ms(500);
        PORTD = 0;

    }
}
