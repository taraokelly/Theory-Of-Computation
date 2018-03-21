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
---------------
FIRST ATTEMPTS:
---------------

Similar to the last task a loop is needed that holds a counter instead of a result 
list. Plan to use cond with three conditions:
1. if arg1(input list) is null - then return counter (arg2) 
2. if the first number is zero - use recursion to continue the loop passing in the 
cdr of n and the unchanged counter
3. else - use recursion to continue the loop passing in the 
cdr of n and the incremented counter  

(define (hamming-weight n)
    (define (hamming-weight-calc n c)
    (cond
        ((null? n) c)
        ((= (car n) 0) (hamming-weight-calc (cdr n) c))
        (else (hamming-weight-calc (cdr n) (+ c 1)))))
    (hamming-weight-calc n 0))

The following solution only works on binary strings. However, it is a little more efficient 
- with one less operation than the previous solution per iteration. The question says to 
"return the number of non-zero elements" and doesn't specify anything about binary but only 
uses binary in the example. Works by adding the number itself to the overall sum each 
iteration. So this will either be 0 or 1.

(define (hamming-weight n)
    (define (hamming-weight-calc n c)
    (if (null? n)
        c
        (hamming-weight-calc (cdr n) (+ c (car n)))))
    (hamming-weight-calc n 0))

---------------
FINAL ATTEMPTS:
---------------

The following solutions are optimized versions off the previous attempts. I updated these 
upon realising that the inner function and counter to keep track of the hamming weight was 
not the most sophisticated means to sum up the result. Instead the result would be 
continuously built adding either 0 or 1 per iteration.

Binary only version of the solution:

(define (hamming-weight n)
    (if(null? n) 
        0
        (+ (car n) (hamming-weight (cdr n)))))

|#

(define (hamming-weight n)
    (cond
        ((null? n) 0)
        ((= (car n) 0) (+ 0 (hamming-weight (cdr n))))
        (else (+ 1 (hamming-weight (cdr n))))))

(test (hamming-weight (list 1 0 1 0 1 1 1 0)) 5)
(test (hamming-weight (list 0 0 0 0)) 0)
(test (hamming-weight (list 1 2 3 4 5)) 5)
(test (hamming-weight (list 0 1 2 3 4 5)) 5)