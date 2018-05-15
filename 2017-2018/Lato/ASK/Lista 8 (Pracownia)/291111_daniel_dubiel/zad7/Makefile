all: funny.o
	gcc -no-pic -o zad7 funny.o -Wall -Wextra -nostdlib

funny.o: funny.s
	gcc -c funny.s -Wall -Wextra

clean:
	rm -f src.o funny.o zad7

	