all: main.o
	gcc -no-pie -o zad6 main.o -Wall -Wextra 

main.o: main.s
	gcc -c main.s -Wall -Wextra

clean:
	rm -f main.o main.o zad6

dis:
	objdump -d main
	