#lang racket
(require "Test.rkt")

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.5)

Write a function hamming-weight in Racket that takes a list l as input and returns
the number of non-zero elements in it. For example:
> (hamming-weight (list 1 0 1 0 1 1 1 0))
5
|#

#|
Similar to the last task a loop is required that holds a counter instead of a result 
list. Plan to use cond with three conditions:
1. if arg1(input list) is null - then return counter (arg2) 
2. if the first number is zero - use recursion to continue the loop passing in the 
cdr of n and the unchanged counter
3. else                        - use recursion to continue the loop passing in the 
cdr of n and the incremented counter  
|#

(define (hamming-weight n)
    (define (hamming-weight-calc n c)
    (cond
        ((null? n) c)
        ((= (car n) 0) (hamming-weight-calc (cdr n) c))
        (else (hamming-weight-calc (cdr n) (+ c 1)))))
    (hamming-weight-calc n 0))

#|
Seems like a better solution but will only work on a binary string: 

(define (hamming-weight n)
    (define (hamming-weight-calc n c)
    (if (null? n)
        c
        (hamming-weight-calc (cdr n) (+ c (car n)))))
    (hamming-weight-calc n 0))

Works by adding the number itself to the counter each iteration. Will either better
1 or 0.

The question says to "return the number of non-zero elements" and doesn't specify 
anything about binary but only uses binary in the example.
|#

(test (hamming-weight (list 1 0 1 0 1 1 1 0)) 5)
(test (hamming-weight (list 0 0 0 0)) 0)
(test (hamming-weight (list 1 2 3 4 5)) 5)
(test (hamming-weight (list 0 1 2 3 4 5)) 5)