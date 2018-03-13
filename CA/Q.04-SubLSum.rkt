#lang racket
(require "Test.rkt")

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.4)

Write a function sublsum in Racket that takes a list (of integers) as input and returns
a list of sublists of it that sum to zero. For this problem, you can use the
combinations built-in function. Note the order of the sublists and their elements
doesn’t matter. For example:
> (sublsum (list 1 2 3 4 -5))
'((2 3 -5) (-5 1 4))
> (sublsum (list 1 2 3 4 5))
'()
|#

|#
The combinations function does all the hard work for us here. 
https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Flist..rkt%29._combinations%29%29. 
It returns all the possible combinations of a given list in the form of a list of subsets,
including itself and an empty list. The empty list always comes first and the set of
everything in the original list always comes last in the list of subsets - so these are
easily removed from the loop building the final result. The loop acts as a filter only 
incluing the subsets with the sum of 0. It end on the last subset and doesn't add it
to the list being returned.
#|

(define (sublsum n)
    ; lsum function adds all elements in the list together.
    (define (lsum L)
        (if (null? L) 0 (+ (car L) (lsum (cdr L)))))
    ; sublsum-filter builds new list with the contents of only the desired sublists.
    (define (sublsum-filter n a)
    (cond
        ((null? (cdr n)) a)
        ((= (lsum (car n)) 0)  (sublsum-filter (cdr n) (cons (car n) a )))
        (else (sublsum-filter (cdr n) a))))
    (sublsum-filter (cdr (combinations n)) '()))

(test (sublsum (list 1 2 3 4 -5)) '((1 4 -5) (2 3 -5)))
(test (sublsum (list 1 2 3 4 5)) '())