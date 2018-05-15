all: main.o clz.o
	gcc -g -o zad1 main.o clz.o -Wall -Wextra 

main.o: main.c
	gcc -g -Og -c main.c -Wall -Wextra

clz.o: clz.s
	gcc -g -c clz.s -Wall -Wextra

clean:
	rm -f main.o clz.o zad1

	