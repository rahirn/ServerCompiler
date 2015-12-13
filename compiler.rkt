#lang racket
(define (compile-file source object)
  (with-output-to-file object	
    (lambda () (compile (open-input-file source)))    
    #:exists 'replace)
  )