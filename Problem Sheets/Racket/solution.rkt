#lang racket

#|
Problem Sheet: Racket
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#


; Q.1)

; (a) (3 × (5 + (10 ÷ 5)))
(* 3 (+ 5 (/ 10 5)))

; (b) (2 + 3 + 4 + 5)
(+ 2 3 4 5)

; (c) (1 + (5 + (2 + (10 ÷ 3))))
(+ 1 (+ 5 (+ 2 (/ 10 3))))

; (d) (1 + (5 + (2 + (10 ÷ 3.0))))
(+ 1 (+ 5 (+ 2 (/ 10 3.0))))

; (e) (3 + 5) × (10 ÷ 2)
(* (+ 3 5) (/ 10 2))

; (f) (3 + 5) × (10 ÷ 2) + (1 + (5 + (2 + (10 ÷ 3))))
(+ (* (+ 3 5) (/ 10 2)) (+ 1 (+ 5 (+ 2 (/ 10 3)))))


; Q.2)

; Convert the discount to a percentage, and multiply by the full price.
(define (discount a b) (* a (/ b 100.0)))
; Test:
(discount 10 5)
(discount 29.90 50)

; Q.3)

; Euclid's Algorithm
(define (grcomdiv a b)
  (if (< a b)
      (grcomdiv b a)
      (if (= b 0)
          a
          (grcomdiv (modulo a b) b)
        )
    )
)
;Test:
(grcomdiv 10 15)
(grcomdiv 64 30)