#lang racket
(require "Test.rkt")

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
First lcycle attempt - works but method uses append.

(define (lcycle n)
    (define (lcycle-flatten lst)
    (cond ((null? lst) '())
            ((pair? lst)
            (append (lcycle-flatten (car lst)) (lcycle-flatten (cdr lst))))
            (else (list lst))))
    (lcycle-flatten (cons (cdr n) (cons (car n) '()))))

Upon using the attempting to combine the pair (tail,head) using one cons operation, it
became apparent that a recursive loop was required to build the single merged list.

To create the rcycle function - the last digit can be acheived by looping till the end 
to find the number next to null. 
First rcycle attempt - calculates list in one loop but doesn't return.

(define (rcycle-build n a)
        (if (null? (cdr n))
            (cons (car n) a)
            ((rcycle-build (cdr n) (cons (car n) a)))))
    (rcycle-build n '())

I tried to find the end node and build the list in the
same loop. This was unsuccessful as the function never returns the value because the 
list was not being continuously built with each iteration. 
|#

; Separate with cdr and car - then loop to append each individual digit to list by 
; the cons function.
(define (lcycle n)
    (define (lcycle-build n a)
        (if (null? n)
            (cons a '())
            (cons (car n) (lcycle-build (cdr n) a))))
    (lcycle-build (cdr n) (car n)))

; Loop to get last digit and loop through 0...n-1 to build list. Then cons last 
; digit with the built list.
(define (rcycle n)
    (define (get-last n)
        (if (null? (cdr n))
            (car n)                
            (get-last (cdr n))))
    (define (rcycle-build n)
        (if (null? (cdr n))
            '()
            (cons (car n) (rcycle-build (cdr n)))))
    (cons (get-last n) (rcycle-build n)))

; Execute testing.
(test (lcycle (list 1 2 3 4 5)) '(2 3 4 5 1))
(test (rcycle (list 1 2 3 4 5)) '(5 1 2 3 4))