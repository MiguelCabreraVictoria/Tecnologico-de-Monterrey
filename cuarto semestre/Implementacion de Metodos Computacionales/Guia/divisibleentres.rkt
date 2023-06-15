#lang racket

(provide (all-defined-out))


(define ( multiplicar-tres lst)
  (let loop 
    ([lst lst]
     [res '()])
    (if (empty? lst)
      res
      (loop (cdr lst)
	    ( cons ( * ( car lst) 3) res)))))

(define ( divisible-tres lst)
  (let loop
    ([lst lst]
     [res '()])
    (if (empty? lst)
      res
      (loop (cdr lst)
	    (if (equal? (remainder (car lst) 3) 0)
	      (cons (car lst) res) res)))))

(define ( cubo lst)
  (let loop 
    ([lst lst]
     [res '()])
    (if (empty? lst)
      res
      (loop (cdr lst)
	    (cons (expt (car lst) 3))))))
