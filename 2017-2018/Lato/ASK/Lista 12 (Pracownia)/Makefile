UNAME := $(shell uname)

ifeq ($(UNAME), Linux)
CC = gcc -g
endif
ifeq ($(UNAME), Darwin)
CC = clang -g
endif

CFLAGS	= -std=gnu11 -march=native -O2 -Wall -Wextra

BINS = bsearch cache matmult transpose randwalk
SRCS = $(wildcard *.c *.h *.md *.gp *.dat Makefile)

all: $(BINS) # raport.html

bsearch: bsearch.o common.o test.o
bsearch.o: bsearch.c common.h test.h
cache: cache.o common.o test.o
cache.o: cache.c common.h test.h
matmult: matmult.o common.o test.o
matmult.o: matmult.c common.h test.h
randwalk: randwalk.o common.o test.o
randwalk.o: randwalk.c common.h test.h
transpose: transpose.o common.o test.o
transpose.o: transpose.c common.h test.h
test.o: test.c test.h common.h
common.o: common.c common.h


# requires "markdown" and "gnuplot" packages to be installed
raport.html: raport.md

test1zad:
	./matmult -n 1024 -v 2 -s > 1zad/1.txt
	./matmult -n 1024 -v 3 -s > 1zad/1_2.txt
	./matmult -n 2048 -v 3 -s >? 1zad/1_2.txt
test2zad:
	./matmult -n 1024 -v 1 -b 4 -s >> 2zad/2.txt
	./matmult -n 1024 -v 1 -b 8 -s >> 2zad/2.txt
	./matmult -n 1024 -v 1 -b 16 -s >> 2zad/2.txt
	./matmult -n 1024 -v 1 -b 32 -s >> 2zad/2.txt
	./matmult -n 1024 -v 1 -b 128 -s >> 2zad/2.txt
test3zad:
	./transpose -n 16384 -v 1 -s > 3zad/3.txt
test4zad:
	./randwalk -S 0xea3495cc76b34acc -n 15 -s 16 -t 14 -v 1 -z >> 4zad/4.txt


%.html: %.md
	markdown $< > $@

%.png: %.gp %.dat
	gnuplot $< > $@

%.eps: %.gp %.dat
	gnuplot $< > $@

clean:
	@rm -vf *.o *.html *.png *~ $(BINS)
	rm -rf 1zad/ 2zad/ 3zad/ 4zad/

dist:
	mkdir -p stripped 
	cp -a $(SRCS) stripped/
	cd stripped && \
	  for f in *.c; do \
	    sed -i -e '/^#if.*SOLUTION/,/^#endif.*SOLUTION/d' $$f; \
	  done
	cd stripped && tar cvzf ../../pracownia_2-$$(date +'%Y%m%d%H%M%S').tgz *
	rm -rf stripped

# vim: ts=8 sw=8
