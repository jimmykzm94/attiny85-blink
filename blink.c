// 8MHz internal clock
#define F_CPU 8000000UL

// Include headers
#include <avr/io.h>
#include <util/delay.h>

int main(void){
	// Set PB0 as output
	DDRB |= (1 << PB0);

	while(1){
		// Toggle LED and set 200ms delay
		PORTB ^= (1 << PB0);
#ifndef SIMULATOR
		_delay_ms(100);
#endif
	}
}
