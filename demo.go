package main

// #cgo LDFLAGS: -L. -lmytan -lm
// #include "mytan.h"
import "C"

import "fmt"

func main(){
	x := C.mytan(1.0)
	fmt.Printf("tan(1.0) = %f\n", x)
}

