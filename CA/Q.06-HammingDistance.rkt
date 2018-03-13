#lang racket
(require "Test.rkt")

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.6)

Write a function hamming-distance in Racket that takes two lists and returns the
number of positions in which they differ. For example:
> (hamming-distance (list 1 0 1 0 1 1 1 0) (list 1 1 1 1 0 0 0 0))
5
|#

#|
Again similar to the last question - a loop with copies of the input and a counter 
is used. The counter or distance will be incremented if the first number of each list 
is the same. 
|#

(define (hamming-distance n m)
    (define (hamming-distance-calc n m d)
    (cond
        ; return d (distance) if both are null
        ((and (null? n) (null? m)) d)
        ; recursion while passing in cdr of non-null list m and incremented d
        ((null? n) (hamming-distance-calc n (cdr m) (+ d 1)))
        ; recursion while passing in cdr of non-null list n and incremented d
        ((null? m) (hamming-distance-calc (cdr n) m (+ d 1)))
        ; they are the same so recursion while passing in cdr of both and don't increment d
        ((= (car n) (car m)) (hamming-distance-calc (cdr n) (cdr m) d))
        ; they aren't the same so recursion while passing in cdr of both and incremented d
        (else (hamming-distance-calc (cdr n) (cdr m) (+ d 1)))))
    (hamming-distance-calc n m 0))

#|
The following solution is a BETTER solution but assumes that the lists are of the same 
length:

(define (hamming-distance n m)
    (define (hamming-distance-calc n m d)
    (cond
        ((null? n) d)
        ((= (car n) (car m)) (hamming-distance-calc (cdr n) (cdr m) d))
        (else (hamming-distance-calc (cdr n) (cdr m) (+ d 1)))))
    (hamming-distance-calc n m 0))

However the question doesn't specify that they are.

The following solution is NOT A BETTER solution and assumes that the lists are of the same length AND binary:

(define (hamming-distance n m)
    (define (hamming-distance-calc n d)
        (cond 
           ((null? n) d)
           ((= (modulo (car n) 2) 0)  (hamming-distance-calc (cdr n) d))
           (else (hamming-distance-calc (cdr n) (+ d 1)))))
    (hamming-distance-calc (map + n m) 0))
|#

(test (hamming-distance (list 1 0 1 0 1 1 1 0) (list 1 1 1 1 0 0 0 0)) 5)
(test (hamming-distance (list 1 0 1) (list 1 1 1)) 1)
(test (hamming-distance (list 1 1 1) (list 1 1 1)) 0)
(test (hamming-distance (list 1 2 1) (list 1 4 71)) 2)
(test (hamming-distance (list 1 2 1) (list 1 4 71 7)) 3)