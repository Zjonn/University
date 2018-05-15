all: main.o lcm_gcd.o
	gcc -o zad2 main.o lcm_gcd.o -Wall -Wextra 

main.o: main.c
	gcc -Og -c main.c -Wall -Wextra

lcm_gcd.o: lcm_gcd.s
	gcc -c lcm_gcd.s -Wall -Wextra

clean:
	rm -f main.o lcm_gcd.o zad2
