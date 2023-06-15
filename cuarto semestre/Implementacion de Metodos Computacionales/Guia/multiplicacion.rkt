#lang racket

(define (all-provided-out))

(define (index-mult lst)
  (let loop 
    [lst lst]
    [index 1]
    [res '()])
  (if (empty? lst)
    (reverse res)
    (loop (cdr lst)
	  (add1 index)
	  (cons ( * (car lst) index) res))))
