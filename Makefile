mytan.o: mytan.c
	gcc -Wall -c mytan.c

sample.o: mytan.h sample.c
	gcc -Wall -c sample.c

sample.bin: sample.o mytan.o
	gcc sample.o mytan.o -o sample.bin -lm
