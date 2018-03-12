#lang racket

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.2)

Write, from scratch, a function in Racket that takes a positive integer n0 as input
and returns a list by recursively applying the following operation, starting with the
input number.

ni+1 =
    3ni + 1 - if n base i is odd
    ni ÷ 2 - otherwise

End the recursion when (or if) the number becomes 1. Call the function collatz-list.
So, collatz-list should return a list whose first element is n0, the second element
is n1, and so on. For example:
> (collatz-list 5)
'(5 16 8 4 2 1)
> (collatz-list 9)
'(9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)
> (collatz-list 2)
'(2 1)
|#

#|
The function collatz-list should take a positive integer and, using the formula given, return 
the corresponding list. The function collatz-list should loop using recursion, adding or 
ending the loop per iteration. The loop should end when the number n is 1.
|#

(define (collatz-list n)
  ; Cond allows more than 2 conditions (true or false), similar to and else if statement or 
  ; switch statement. We need to check if n is odd, even or equal to 1 - so cond is optimal here.
  (cond
    ; Check if equal to 1.
    ; This won't return '(1) unless called on the first loop.
    ((= n 1) '(1))
    ; Check if even.
    ((= (modulo n 2) 0)
      ; cons n / 2 to the list.
      ; cons will create a pair creating a list even if from a single number.
      (cons n (collatz-list (/ n 2)))
    )
    ; Check if odd.
    ((= (modulo n 2) 1)
      ; cons (3 * n) + 1 to the list.
      (cons n (collatz-list (+ (* 3 n) 1)))
    )
  )
)

; Tester function.
(define (test m n)
  (if (equal? m n)
    #t
    #f
    )
)

; Execute testing.
(test (collatz-list 5) '(5 16 8 4 2 1))
(test (collatz-list 9) '(9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1))
(test (collatz-list 2) '(2 1))
(test (collatz-list 1) '(1))