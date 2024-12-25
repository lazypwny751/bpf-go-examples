package main

import (
	"os"
	"fmt"
)

var x int = 99

func main() {
	println(fmt.Sprintf("Hello %d", x))
	os.Exit(0) 
}
