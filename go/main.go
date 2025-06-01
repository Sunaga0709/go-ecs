package main

import (
	"fmt"
	"log"

	"github.com/Sunaga0709/go-ecs/server"
)

const (
	host = "0.0.0.0"
	port = "8080"
)

func main() {
	s := server.New()
	if err := s.Start(fmt.Sprintf("%s:%s", host, port)); err != nil {
		s.Stop()
		log.Fatalf("Server stopped with error: %s", err)
	}
}
