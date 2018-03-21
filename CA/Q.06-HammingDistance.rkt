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
---------------
FIRST ATTEMPT:
---------------

The following solution assumes that the lists are of the same length, however the 
question doesn't specify that they are.

(define (hamming-distance n m)
    (define (hamming-distance-calc n m d)
    (cond
        ((null? n) d)
        ((= (car n) (car m)) (hamming-distance-calc (cdr n) (cdr m) d))
        (else (hamming-distance-calc (cdr n) (cdr m) (+ d 1)))))
    (hamming-distance-calc n m 0))

---------------
SECOND ATTEMPT:
---------------

The following solution is NOT A BETTER solution and assumes that the lists are of the 
same length AND binary:

(define (hamming-distance n m)
    (define (hamming-distance-calc n d)
        (cond 
           ((null? n) d)
           ((= (modulo (car n) 2) 0)  (hamming-distance-calc (cdr n) d))
           (else (hamming-distance-calc (cdr n) (+ d 1)))))
    (hamming-distance-calc (map + n m) 0))

---------------
THIRD ATTEMPT:
---------------

Again similar to the last question - a loop with copies of the input and a counter 
is used. The counter or distance will be incremented if the first number of each 
list is the same. Using cond again:
1. Both lists are null - return d (distance) if both are null.
2. Arg1(list 1) null - recursion while passing in cdr of non-null list arg2 and 
incremented arg3(d).
3. Arg2(list 2) null - recursion while passing in cdr of non-null list arg1 and 
incremented arg3(d).
4. Car of both lists are the same - recursion while passing in cdr of both and 
don't increment arg3(d).
5. Else - mustn't be the same so recursion while passing in cdr of both and 
incremented arg3(d).

(define (hamming-distance n m)
    (define (hamming-distance-calc n m d)
    (cond
        ((and (null? n) (null? m)) d)
        ((null? n) (hamming-distance-calc n (cdr m) (+ d 1)))
        ((null? m) (hamming-distance-calc (cdr n) m (+ d 1)))
        ((= (car n) (car m)) (hamming-distance-calc (cdr n) (cdr m) d))
        (else (hamming-distance-calc (cdr n) (cdr m) (+ d 1)))))
    (hamming-distance-calc n m 0))

---------------
FINAL ATTEMPT:
---------------

Like Q.5, the following solution is an optimized version off the previous attempt. 
I updated it upon realising that the inner function and counter to keep track of the 
hamming weight was not the most sophisticated means to sum up the result. Instead 
the result would be continuously built adding either 0 or 1 per iteration.
|#

(define (hamming-distance n m)
    (cond
        ((and (null? n) (null? m)) 0)
        ((null? n) (+ 1 (hamming-distance n (cdr m))))
        ((null? m) (+ 1 (hamming-distance (cdr n) m)))
        ((= (car n) (car m)) (+ 0 (hamming-distance (cdr n) (cdr m))))
        (else (+ 1 (hamming-distance (cdr n) (cdr m))))))

(test (hamming-distance (list 1 0 1 0 1 1 1 0) (list 1 1 1 1 0 0 0 0)) 5)
(test (hamming-distance (list 1 0 1) (list 1 1 1)) 1)
(test (hamming-distance (list 1 1 1) (list 1 1 1)) 0)
(test (hamming-distance (list 1 2 1) (list 1 4 71)) 2)
(test (hamming-distance (list 1 2 1) (list 1 4 71 7)) 3)