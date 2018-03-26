/*
* ReciveMors.ino
*
* Created: 10/20/2017 12:49:37 AM
* Author: Zjonn
*/
#include <string.h>

#define DXOR (PORTD ^= 0b11111100)
#define BXOR (PORTB ^= 0b1000)
#define DOT 100

void blink(String s);
void soundDelay(unsigned long ms);
void analyzeText(String read);

int main() {
	init();
	Serial.begin(9600);
	Serial.print("Hello Word");
	String read;


	DDRD |= 0b11111100;
	DDRB |= 0b1000;
	while(1) {
		if (Serial.available()) {
			read = Serial.readString();
			analyzeText(read);
		}
	}
}

void analyzeText(String read){
	String ch[] = {".-","-...","-.-.","-..", ".", "..-.", "--.",
		"....", "..", ".---", "-.-", ".-..", "--",
		"-.", "---", ".--.", "--.-", ".-.", "...", "-",
		"..-", "...-", ".--", "-..-", "-.--", "--.."
	};
	String num[] = {"------",".--.","..-..","...-.","....-","---","......","--..","-....","-..-"};
		
	for(int i = 0; i<read.length(); i++) {
		int n = read[i];
		
		if(n >= '0' && n <= '9') {
			n-='0';
			blink(num[n]);
		}
		
		else {
			if(n >= 'a' && n <= 'z') n-='a';
			else if(n >= 'A' && n <= 'Z') n-='A';
			else continue;
			
			blink(ch[n]);
		}
		_delay_ms(DOT*3);
	}
}

void blink(String s) {
	for(int i = 0; i<s.length(); i++) {
		if(s[i] == '.') {
			DXOR;
			soundDelay(DOT);
		}
		else {
			DXOR;
			soundDelay(DOT * 3);
		}
		DXOR;
		_delay_ms(DOT);
	}
}

void soundDelay(unsigned long ms) {

	int t=1;
	for(int i = 0; i<ms; i+=t+t) {
		delay(t);
		BXOR;
		delay(t);
		BXOR;
	}
}



