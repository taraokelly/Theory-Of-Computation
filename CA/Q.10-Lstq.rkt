#lang racket
(require "Test.rkt")

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.9)

Write a function lstq in Racket that takes as arguments two lists l and m of equal
length and containing numbers. It should return d, the distance given by the sum of
the square residuals between the numbers in the lists:

d = E (l(i) − m(i))^2
    i
This means take the ith element of m from the ith element of l and square the result
for all i. Then add all of those to get d. For example:
> (lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8))
54.61
|#

#| 
This task requires the squared distance between each of the ith pair elements to be 
summed together to create the result. Using maps again, the map finds the distance 
between both elements and multiplies it by itself. This number is mapped the a new 
list. The returned list is then looped over recursively, building the sum of every
element in the list.

--------------
First Attempt
--------------

(define (lstq m l)
    (define (lsum l)
            (if (null? l) 0 (+ (car l) (lsum (cdr l)))))
    (lsum (map (lambda (i1 i2)
         (* (- i1 i2) (- i1 i2)))
       m l)))

--------------
Second Attempt
--------------

The above solution works well bar the minor issue that it unnecessarily finds the 
distance between each of the ith pair elements twice. This could be easily 
corrected, another function "square" is added to find the square root. As a result 
the distance need only be calculated once.

(define (lstq m l)
    (define (lsum l)
            (if (null? l) 0 (+ (car l) (lsum (cdr l)))))
    (define (square n) (* n n))
    (lsum (map (lambda (i1 i2)
         (square (- i1 i2)))
       m l)))

--------------
Third Attempt
--------------

The seperate "square" function can only be called once, so I thought it simpler to convert
it into a lamba expression.

|#

(define (lstq m l)
    (define (lsum l)
            (if (null? l) 0 (+ (car l) (lsum (cdr l)))))
    (lsum (map (lambda (i1 i2)
         ((lambda (x) (* x x)) (- i1 i2)))
       m l)))

(test (lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8)) 54.61)
(test (lstq '() '()) 0)