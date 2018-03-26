/*
 * Zad3.ino
 *
 * Created: 12/1/2017 11:28:01 PM
 * Author: Zjonn
 */
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define SET(x)(1<<x)

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

// inicjalizacja UART
void uart_init() {
    // ustaw baudrate
    UBRR0 = UBRR_VALUE;
    // wyczyœæ rejestr UCSR0A
    UCSR0A = 0;
    // w³¹cz odbiornik i nadajnik oraz przerwania
    UCSR0B = SET(TXEN0) | SET(RXEN0) | SET(RXCIE0);
    // ustaw format 8n1
    UCSR0C = SET(UCSZ00) | SET(UCSZ01);
}

//Jest wywo³ywany gdy odbiór znaku siê zakoñczy
ISR(USART_RX_vect) {
    char c = UDR0;
    UDR0 = c;
}

int main() {
    uart_init();
    //Wylaczam TWI ADC TIMERY SPI
    PRR = 0xFC;
    sleep_enable();
    sei();
    while(1)
        sleep_cpu();
}
