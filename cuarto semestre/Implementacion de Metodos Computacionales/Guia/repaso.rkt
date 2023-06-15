#lang racket

(provide (all-defined-out))

(define (multiplication lst)
  (define (helper lst index)
    (cond
      [(empty? lst) empty]
      [else (cons (* (car lst) index)
                  (helper (cdr lst) (add1 index)))]))
  (helper lst 1))

(define (scanner-four lst)
  (let loop
    ([lst lst]
     [res '()])
    (if (empty? lst)
        (reverse res)
        (loop (cdr lst)
              (if (equal? 4 (remainder (car lst) 10))
                  (cons (car lst) res)
                  res)))))

