mytan.o: mytan.c
	gcc -fpic -Wall -c mytan.c

libmytan.so: mytan.o
	gcc -shared -o libmytan.so mytan.o

sample.o: mytan.h sample.c
	gcc -Wall -c sample.c

sample.bin: sample.o libmytan.so
	gcc -L. -o sample.bin sample.o -lmytan -lm

clean:
	rm -f *.bin
	rm -f *.o
	rm -f *.so

run: sample.bin
	env LD_LIBRARY_PATH=. ./sample.bin

