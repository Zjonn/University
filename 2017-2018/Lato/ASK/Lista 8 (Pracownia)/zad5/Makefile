all: main.o mulf.o
	gcc -no-pie -g -o zad5 main.o mulf.o -Wall -Wextra 

main.o: main.c
	gcc -g -Og -c main.c -Wall -Wextra

mulf.o: mulf.s
	gcc -g -c mulf.s -Wall -Wextra

clean:
	rm -f main.o mulf.o zad5
