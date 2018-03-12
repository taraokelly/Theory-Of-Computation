#lang racket

#|
CA: 30%
Tara O'Kelly, G00322214
Theory of Algorithms, Software Development, Fourth Year, GMIT.
|#

#| 
Q.1)

Write, from scratch, a function in Racket that uses a brute-force algorithm that takes
a single positive integer and return true if the number is a prime and false otherwise.
Call the function decide-prime.
|#

#| 
Breaking this task down and examining what has to be done, it is to be noted that a "brute-force" 
algorithm is greedy exhaustive. In this case, every positive number less than the positive number 
n should be checked to see if it is a factor of n. If it is, then n must not be a prime number. 
This is because a prime number is a number where it's component factors can only consist of 
itself(n) and 1. Since it is only every number less than n being evaluated, n itself is never 
checked. The number 1 must also be excluded from the search. Every number is to be checked until 
the answer is found.
|#

(define (decide-prime n)
      (define (prime-loop n m)
      ; Check if m is equal to n - m acts as a counter, starting from 2 -> n.
      ; If m has reached n without finding a component factor of n and returning false, n must be a prime number.
      (if (= m n)
          #t
          ; If the modulus is equal to 0 then, m divides equally into n and therfore must be a factor of n.  
          (if (= (modulo n m) 0)
              #f
              ; Use recursion to create a loop, while also incrementing the counter.
              (prime-loop n (+ m 1)))))
      ; Check if positive number. 0 and 1 cannot be primes.
      (if (< n 2) 
        #f
        ; Counter starts at 2 - 0 and 1 don't need to be checked, and 1 will disrupt the results.
        (prime-loop n 2)))


; Tester function.
(define (test m n)
  (if (equal? m n)
    #t
    #f
    )
)

; Execute testing.
(test (decide-prime 2) #t)
(test (decide-prime 19) #t)
(test (decide-prime 47) #t)
(test (decide-prime 103) #t)
(test (decide-prime 163) #t)
(test (decide-prime 4) #f)
(test (decide-prime 15) #f)
(test (decide-prime 72) #f)
(test (decide-prime 105) #f)
(test (decide-prime 180) #f)