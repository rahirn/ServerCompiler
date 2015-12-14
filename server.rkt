#lang racket
(define (launch-server port)
  (printf "Starting server on port ~a...~n" port)
  (define listener (tcp-listen port 5 #t))
  (define (loop)
    (accept-and-handle listener)
    (loop))
  (loop))

(define (accept-and-handle listener)
  (define-values (in out) (tcp-accept listener))
  (displayln "Client connected.")
  (handle in out)
  (close-input-port in)
  (close-output-port out))

(define (handle in out)
  ; read input string into compiler and send response back
  (display (compile-file (port->string in) "test.txt") out))

(launch-server 2112)
