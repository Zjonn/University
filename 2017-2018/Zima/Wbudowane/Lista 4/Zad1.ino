/*
* Zad1.ino
*
* Created: 12/1/2017 4:32:16 PM
* Author: Zjonn
*/

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define LED 0x2

#define SET(x)(1<<x)

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

volatile uint8_t iTX = 0;
volatile uint8_t * arrTX;
volatile uint16_t restartTime = 0;

// inicjalizacja UART
void uart_init() {
    // ustaw baudrate
    UBRR0 = UBRR_VALUE;
    // wyczyœæ rejestr UCSR0A
    UCSR0A = 0;
    // w³¹cz odbiornik i nadajnik oraz przerwania
    UCSR0B = SET(TXEN0) | SET(TXCIE0);
    // ustaw format 8n1
    UCSR0C = SET(UCSZ00) | SET(UCSZ01);
}

// transmisja jednego znaku
void transmit(char * data) {
    iTX = 0;
    arrTX = data;
    UDR0 = arrTX[0];
}

void initTimer() {
    /*Timer diody*/
    //Odmaskowanie przerwania
    TIMSK0 |= SET(TOIE0);
    //Wyzwalanie przerwania
    //TIFR0 |= SET(TOV0);

    /*-----------------------------------------*/

    /*Timer 1s*/
    TCCR1B |= SET(CS12) | SET(CS10);
    //Odmaskowanie przerwania
    TIMSK1 |= SET(TOIE1);
    //Wyzwalanie przerwania
    //TIFR1 |= SET(TOV1);

    TCNT1 = 65535 - 15625;
}

//Jest wywo³ywany gdy transmisja znaku siê zakoñczy
ISR(USART_TX_vect) {
    if(arrTX[++iTX]!='\0')
        UDR0 = arrTX[iTX];
}
//OVF - overflow
ISR(TIMER0_OVF_vect) {
    TCCR0B = 0;
    PORTB &= ~LED;
}

ISR(TIMER1_OVF_vect) {
    //Obsluga timera
    TCNT1 = 65535 - 15625;

    //Wypisywanie
    char msg[20];
    restartTime++;
    sprintf(msg,"Time: %"PRIu16"s\n\0",restartTime);
    transmit(msg);

    //Dioda
    TCCR0B |= SET(CS02) | SET(CS00);
    PORTB |= LED;
    TCNT0 = 90;
}

int main(void) {
    DDRB  |= LED;
    uart_init();
    initTimer();
    //Ustawiamy bit aktywacji uœpienia
    sleep_enable();
    sei();
    while (1)
        //Usypiamy procesor
        sleep_cpu();
}
