package server

import (
	"log"
	"net/http"
	"sync/atomic"
	"time"

	"github.com/gin-gonic/gin"
)

type Server struct {
	counter int64
	server  *http.Server
	router  *gin.Engine
}

func New() *Server {
	router := gin.Default()

	server := &Server{
		router:  router,
		counter: 0,
	}

	router.GET("/", server.CounterHandler)
	router.GET("/health_checks", server.HealthHandler)

	return server
}

func (s *Server) CounterHandler(gc *gin.Context) {
	counter := atomic.AddInt64(&s.counter, 1)
	gc.JSON(http.StatusOK, gin.H{"counter": counter})
}

func (s *Server) HealthHandler(gc *gin.Context) {
	gc.JSON(http.StatusOK, gin.H{"success": true})
}

func (s *Server) Start(addr string) error {
	s.server = &http.Server{
		Addr:        addr,
		Handler:     s.router,
		ReadTimeout: 10 * time.Second,
	}

	log.Printf("Start server on %s", addr)

	return s.server.ListenAndServe()
}

func (s *Server) Stop() error {
	log.Printf("Stop server")
	if s.server != nil {
		return s.server.Close()
	}

	return nil
}
