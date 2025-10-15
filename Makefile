.PHONY: all build upload debug clean

all: build upload

build:
	avr-gcc -mmcu=attiny85 -Wall -Os blink.c -o blink.elf
	avr-objcopy -O ihex blink.elf blink.hex

upload:
	@if [ -z "$(PORT)" ]; then \
			echo "Error: PORT argument required. Usage: make upload PORT=/dev/ttyUSB0"; \
			exit 1; \
	fi
	avrdude -p attiny85 -c avrisp -P $(PORT) -b 19200 -U flash:w:blink.hex:i

debug:
	avr-gcc -mmcu=attiny85 -DSIMULATOR -g -O0 blink.c -o blink.elf
	simulavr -d attiny85 -f blink.elf -g 

clean:
	@rm -f *.elf *.hex
	