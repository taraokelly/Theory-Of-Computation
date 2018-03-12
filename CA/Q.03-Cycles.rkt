#lang racket

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.3)

Write, from scratch, two functions in Racket. The first is called lcycle. It takes a
list as input and returns the list cyclically shifted one place to the left. The second
is called rcycle, and it shifts the list cyclically shifted one place to the right.
For example:
> (lcycle (list 1 2 3 4 5))
'(2 3 4 5 1)
> (rcycle (list 1 2 3 4 5))
'(5 1 2 3 4)
|#

#|
To create the lcycle function - the first digit can easily be separated using car and the
rest can also be separated using cdr.
First lcycle Attempt - works but method uses append.

(define (lcycle n)
    (define (lcycle-flatten lst)
    (cond ((null? lst) '())
            ((pair? lst)
            (append (lcycle-flatten (car lst)) (lcycle-flatten (cdr lst))))
            (else (list lst))))
    (lcycle-flatten (cons (cdr n) (cons (car n) '())))
)

Upon using the attempting to combine the pair (tail,head) using one cons operation, it
became apparent that a recursive loop was required to build the single merged list.

|#

(define (lcycle n)
    (define (lcycle-build n a)
        (if (null? n)
            (cons a '())
            (cons (car n) (lcycle-build (cdr n) a))))
    (lcycle-build (cdr n) (car n))
)

(define (rcycle n)
    (display n)
)

; Tester function.
(define (test m n)
  (if (equal? m n)
    #t
    #f
    )
)

(test (lcycle (list 1 2 3 4 5)) '(2 3 4 5 1))