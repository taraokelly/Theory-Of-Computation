#lang racket
(provide test)
; Tester function.
(define (test m n)
  (if (equal? m n)
    #t
    #f
    )
)