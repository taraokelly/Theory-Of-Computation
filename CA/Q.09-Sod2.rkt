#lang racket
(require "Test.rkt")

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.9)

Write a function sod2 in Racket that takes three lists x, y and z of equal length and
containing only 0’s and 1’s. It should return a list containing a 1 where the number of
1’s in a given position in x, y and z contains an odd nubmer of 1’s, and 0 otherwise.
For example:
> (sod2 (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
'(0 1 1 0 1 0 0 1)
|#

#| 
Implemented similarily to the last two tasks, the sod2 function uses different logic in 
it's if statement. It checks if the sum of the nth number of x, y and z is divisible by 
2. If it is, the answer must be even, and 0 is mapped to the nth spot in the resulting 
list. If it is not divisible by 2, the answer must be odd, and 1 is mapped to the nth 
spot in the resulting list.  
|#

(define (sod2 x y z)
    (map (lambda (n1 n2 n3)
         (if(= (modulo (+ n1 n2 n3) 2) 0) 0 1))
       x y z))

(test (sod2 (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1)) '(0 1 1 0 1 0 0 1))