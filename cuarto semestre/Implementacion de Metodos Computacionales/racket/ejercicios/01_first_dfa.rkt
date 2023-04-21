#lang racket

(provide (all-defined-out))

(define (transition-even-a-b state char)
  " Transition function for a language that requires at least one b
  and an even number of a's before it
  Initial state: q0
  Accept states: q1 "
  (cond
    [(eq? state 'q0) (cond
       [(eq? char #\a) 'q2]
       [(eq? char #\b) 'q1]
       [else 'inv])]
    [(eq? state 'q1) (cond
       [(eq? char #\a) 'q1]
       [(eq? char #\b) 'q1]
       [else 'inv])]
    [(eq? state 'q2) (cond
       [(eq? char #\a) 'q3]
       [(eq? char #\b) 'inv]
       [else 'inv])]
    [(eq? state 'q3) (cond
       [(eq? char #\a) 'q2]
       [(eq? char #\b) 'q1]
       [else 'inv])]
    [else 'inv]))

(define (delta-even-b state char)
  "Transition function to validate (a * (bb)+) *
   Initial state: q0
   Accept states q0 q2 "
   (case state
     ['q0 (cond 
	    [(eq? char #\a) 'q3]
	    [(eq? char #\b) 'q1]
	    [else 'inv])]
     ['q1 (cond 
	    [(eq? char #\a) 'inv]
	    [(eq? char #\b) 'q2]
	    [else 'inv])]
     ['q2 (cond 
	    [(eq? char #\a) 'q3]
	    [(eq? char #\b) 'q1]
	    [else 'inv])]
     ['q3 (cond
	    [(eq? char #\a) 'q3]
	    [(eq? char #\b) 'q1]
	    [else 'inv])]
     [else 'inv]))

(define (delta-numeric state char)
  "Transition function to validate numbers
   Initials state: char
   Accept states: int float exp"
   (case state
     [ 'start (cond
       [(char-numeric? char) 'int]
       [(or (eq? char #\+) (eq? char #\-)) 'sign]
       [else 'inv])]
     [ 'sign (cond
	[(char-numeric? char) 'int]
	[else 'inv])]
     [ 'int (cond
	[(char-numeric? char) 'int]
	[(eq? char #\.) 'dot]
	[(or (eq? char #\e) (eq? char #\E)) 'e]
	[else 'inv])]
     [ 'dot (cond
	[(char-numeric? char) 'float]
	[(or (eq? char #\e) (eq? char #\E)) 'e]
	[else 'inv])]
     [ 'e (cond
	[(char-numeric? char) 'exp]
	[(or (eq? char #\+) (eq? char #\-)) 'e_sign]
	[else 'inv])]
     ['e_sing (cond
	[(char-numeric? char) 'exp]
	[else 'inv])]
     [else 'inv]))
