all: main.o approx.o
	gcc -no-pie -g -o zad8 main.o approx.o -Wall -Wextra 

main.o: main.c
	gcc -g -Og -c main.c -Wall -Wextra

fib.o: approx.s
	gcc -g -c approx.s -Wall -Wextra

clean:
	rm -f main.o approx.o zad8
