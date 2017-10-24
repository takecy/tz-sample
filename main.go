package main

import (
	"fmt"
	"time"
)

func main() {
	jst, err := time.LoadLocation("Asia/Tokyo")
	if err != nil {
		panic(err)
	}

	now := time.Now()

	fmt.Printf("utc:%+v\n", now.String())
	fmt.Printf("jst:%+v\n", now.In(jst).String())
}
