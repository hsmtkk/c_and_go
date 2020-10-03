mytan.o: mytan.c
	gcc -fpic -Wall -c mytan.c

libmytan.so: mytan.o
	gcc -shared -o libmytan.so mytan.o

sample.o: mytan.h sample.c
	gcc -Wall -c sample.c

sample.bin: sample.o libmytan.so
	gcc -L. -o sample.bin sample.o -lmytan -lm

crun: sample.bin
	env LD_LIBRARY_PATH=. ./sample.bin

demo.bin: demo.go libmytan.so
	go build -o demo.bin demo.go

gorun: demo.bin
	env LD_LIBRARY_PATH=. ./demo.bin

clean:
	rm -f *.bin
	rm -f *.o
	rm -f *.so

