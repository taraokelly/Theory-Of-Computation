#lang racket
(provide test)
; Tester function.
; https://stackoverflow.com/questions/43470743/racket-include-require-and-provide-dont-work?rq=1
; https://stackoverflow.com/questions/4809433/including-an-external-file-in-racket
(define (test m n)
  (if (equal? m n)
    #t
    #f
  )
)