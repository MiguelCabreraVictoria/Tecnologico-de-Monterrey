#lang racket

(provide (all-defined-out))


(define (char-operator? char)
  " Identify caracters that represent arithmetic operators "
  (member char '(#\+ #\- #\* #\/ #\=)))

(define (delta-arithmetic state char)
  " Transition function to validate numbers
  Initial state: start
  Accept states: int float exp "
  (case state
    ['start (cond
       [(char-numeric? char) 'int]
       [(or (eq? char #\+) (eq? char #\-)) 'sign]
       [(char-alphabetic? char) 'var]
       [(eq? char #\_) 'var]
       [else 'inv])]
    ['sign (cond
       [(char-numeric? char) 'int]
       [else 'inv])]
    ['int (cond
       [(char-numeric? char) 'int]
       [(eq? char #\.) 'dot]
       [(or (eq? char #\e) (eq? char #\E)) 'e]
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['dot (cond
       [(char-numeric? char) 'float]
       [else 'inv])]
    ['float (cond
       [(char-numeric? char) 'float]
       [(or (eq? char #\e) (eq? char #\E)) 'e]
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['e (cond
       [(char-numeric? char) 'exp]
       [(or (eq? char #\+) (eq? char #\-)) 'e_sign]
       [else 'inv])]
    ['e_sign (cond
       [(char-numeric? char) 'exp]
       [else 'inv])]
    ['exp (cond
       [(char-numeric? char) 'exp]
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['var (cond
       [(char-alphabetic? char) 'var]
       [(char-numeric? char) 'var]
       [(eq? char #\_) 'var]
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['op (cond
       [(char-numeric? char) 'int]
       [(or (eq? char #\+) (eq? char #\-)) 'sign]
       [(char-alphabetic? char) 'var]
       [(eq? char #\_) 'var]
       [(eq? char #\space) 'op_spa]
       [else 'inv])]
     ['spa (cond
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['op_spa (cond
       [(char-numeric? char) 'int]
       [(or (eq? char #\+) (eq? char #\-)) 'sign]
       [(char-alphabetic? char) 'var]
       [(eq? char #\_) 'var]
       [(eq? char #\space) 'op_spa]
       [else 'inv])]
    ))


(define (char-operator? char)
  " Identify caracters that represent arithmetic operators "
  (member char '(#\+ #\- #\* #\/ #\=)))

(define (delta-arithmetic state char)
  " Transition function to validate numbers
  Initial state: start
  Accept states: int float exp "
  (case state
    ['start (cond
       [(char-numeric? char) 'int]
       [(or (eq? char #\+) (eq? char #\-)) 'sign]
       [(char-alphabetic? char) 'var]
       [(eq? char #\_) 'var]
       [else 'inv])]
    ['sign (cond
       [(char-numeric? char) 'int]
       [else 'inv])]
    ['int (cond
       [(char-numeric? char) 'int]
       [(eq? char #\.) 'dot]
       [(or (eq? char #\e) (eq? char #\E)) 'e]
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['dot (cond
       [(char-numeric? char) 'float]
       [else 'inv])]
    ['float (cond
       [(char-numeric? char) 'float]
       [(or (eq? char #\e) (eq? char #\E)) 'e]
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['e (cond
       [(char-numeric? char) 'exp]
       [(or (eq? char #\+) (eq? char #\-)) 'e_sign]
       [else 'inv])]
    ['e_sign (cond
       [(char-numeric? char) 'exp]
       [else 'inv])]
    ['exp (cond
       [(char-numeric? char) 'exp]
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['var (cond
       [(char-alphabetic? char) 'var]
       [(char-numeric? char) 'var]
       [(eq? char #\_) 'var]
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['op (cond
       [(char-numeric? char) 'int]
       [(or (eq? char #\+) (eq? char #\-)) 'sign]
       [(char-alphabetic? char) 'var]
       [(eq? char #\_) 'var]
       [(eq? char #\space) 'op_spa]
       [else 'inv])]
     ['spa (cond
       [(char-operator? char) 'op]
       [(eq? char #\space) 'spa]
       [else 'inv])]
    ['op_spa (cond
       [(char-numeric? char) 'int]
       [(or (eq? char #\+) (eq? char #\-)) 'sign]
       [(char-alphabetic? char) 'var]
       [(eq? char #\_) 'var]
       [(eq? char #\space) 'op_spa]
       [else 'inv])]
    ))
