#lang racket
(require "Test.rkt")

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.8)

Write a function chse in Racket that takes three lists x, y and z of equal length and
containing only 0’s and 1’s. It should return a list containing the elements of y in
the positions where x is 1 and the elements of z otherwise. For example:
> (chse (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
'(0 1 0 1 0 0 1 1)
|#

#| 
Again we don't have to worry about non-finite sized lists and non-binary. With a map iterating 
over the three maps (x, y and z) using a lambda expression, it checks if the nth number of x is 
equal to 1. If it is return the the nth number of z, and if it is not the nth number y.
|#

(define (chse x y z)
    (map (lambda (n1 n2 n3)
         (if(= n1 1) n2 n3))
       x y z))

(test (chse (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1)) '(0 1 0 1 0 0 1 1))
