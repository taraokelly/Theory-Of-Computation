#lang racket
(require "Test.rkt")

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.7)

Write a function maj in Racket that takes three lists x, y and z of equal length and
containing only 0’s and 1’s. It should return a list containing a 1 where two or more
of x, y and z contain 1’s, and 0 otherwise. For example:
> (maj (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
'(0 0 0 1 0 1 1 1)
|#

#| 
Not worrying about non-finite sized lists, maps can be used. With a lambda expression iterating 
over the three maps, it sums the the nth number from each and checks if the sum > 1, if not 
there cant be more than one 1 present and 0 is mapped to the new list. If so the answer is 1.
|#

(define (maj a b c)
    (map (lambda (n1 n2 n3)
         (if(> (+ n1 n2 n3) 1) 1 0))
       a b c))

(test (maj (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1)) '(0 0 0 1 0 1 1 1))
