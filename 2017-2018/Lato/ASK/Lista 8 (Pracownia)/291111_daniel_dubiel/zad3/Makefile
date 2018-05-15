all: main.o sort.o
	gcc -o zad3 main.o sort.o -Wall -Wextra 

main.o: main.c
	gcc -Og -c main.c -Wall -Wextra

sort.o: sort.s
	gcc -c sort.s -Wall -Wextra

clean:
	rm -f main.o sort.o zad3
