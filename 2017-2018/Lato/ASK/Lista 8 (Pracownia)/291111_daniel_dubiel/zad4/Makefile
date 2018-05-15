all: main.o fib.o
	gcc -g -o zad4 main.o fib.o -Wall -Wextra 

main.o: main.c
	gcc -g -Og -c main.c -Wall -Wextra

fib.o: fib.s
	gcc -g -c fib.s -Wall -Wextra

clean:
	rm -f main.o fib.o zad4