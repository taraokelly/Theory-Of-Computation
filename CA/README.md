# Problem Sheets

Continuous assessment assigned for the module [Theory of Algorithms](https://github.com/theory-of-algorithms/). This CA is responsoble for 30% of the overall grade.

The **questions along with their breakdowns and solutions** can be found in the found in the separate files named: **_Qx.-title.rkt_**, e.g. question number one, about the function ```decide-prime```, can be located in __*Q.01-DecidePrime.rkt*__. The full specification of this assignment can be found [here](https://github.com/taraokelly/Theory-Of-Computation/blob/master/CA/problems.pdf).

## How to Run

### With Visual Studio (Recommended)

+ Download Racket if needed, download [here](http://racket-lang.org/download/). Don't forget to add racket to the environment variable path!
+ Open current directory, CA, as a folder in Visual Studio Code. If needed, download [here](https://code.visualstudio.com/download).
+ To run a problem, e.g. Q.01-DecidePrime.rkt, open in the editor and make sure it is the selected tab. Next, press ```ctrl + shift + b``` to run.

### From Terminal

+ Download Racket if needed, download [here](http://racket-lang.org/download/). Don't forget to add racket to the environment variable path!
+ Open the CA directory in terminal.
+ Enter ```racket Qx.-title.rkt``` to run.

### DrRacket

+ Download Racket if needed, download [here](http://racket-lang.org/download/). DrRacket is a programming environment that is included.
+ Open DrRacket.
+ Open desired file.
+ Click run or press ```F5``` to run.

## Additional Features

### Test Racket

The other racket file found in this repository is the **Test.rkt** file. This file held a generalized function that was used as an import to test the individual problems/questions in the separate files.

```racket
(define (test m n)
  (if (equal? m n)
    #t
    #f
  )
)
```

This test fucntion takes advantage of the function ```equal?``` and its generalized datatype support. These include strings, byte strings, pairs, mutable pairs, vectors, boxes, hash tables, and inspectable structures. Ref: https://docs.racket-lang.org/reference/booleans.html#%28def._%28%28quote._~23~25kernel%29._equal~3f%29%29

## Solutions

### Q.01

Breaking this task down and examining what has to be done, it is to be noted that a "brute-force" algorithm is greedy exhaustive. In this case, every positive number less than the positive number *n* should be checked to see if it is a factor of *n*. If it is, then *n* must not be a prime number. This is because a prime number is a number where it's component factors can only consist of itself(*n*) and 1. Since it is only every number less than *n* being evaluated, *n* itself is never checked. The number 1 must also be excluded from the search. Every number is to be checked until the answer is found.

**Answer**:

```racket
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
```

### Q.02

The function collatz-list should take a positive integer and, using the formula given, return the corresponding list. The function collatz-list should loop using recursion, continuing (and passing in the new value *n* to be joined to *n* in the next iteration) or ending the loop per iteration. The loop should end when the number *n* is 1.

**Answer**:

```racket
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
      (cons n (collatz-list (+ (* 3 n) 1))))))
```

### Q.03

#### lcycle

To create the lcycle function - the first digit can easily be separated using car and the rest can also be separated using cdr.

**First attempt** (works but method uses append):

```racket
(define (lcycle n)
    (define (lcycle-flatten lst)
    (cond ((null? lst) '())
            ((pair? lst)
            (append (lcycle-flatten (car lst)) (lcycle-flatten (cdr lst))))
            (else (list lst))))
    (lcycle-flatten (cons (cdr n) (cons (car n) '()))))
```

Upon using the attempting to combine the pair (tail,head) using one cons operation, it
became apparent that a recursive loop was required to build the single merged list.

**Answer**:

```racket
; Separate with cdr and car - then loop to append each individual digit to list by 
; the cons function.
(define (lcycle n)
    (define (lcycle-build n a)
        (if (null? n)
            (cons a '())
            (cons (car n) (lcycle-build (cdr n) a))))
    (lcycle-build (cdr n) (car n)))
```

### rcycle

To create the rcycle function - the last digit can be acheived by looping till the end 
to find the number next to null. 

**First attempt**:

```racket
(define (rcycle-build n a)
        (if (null? (cdr n))
            (cons (car n) a)
            (rcycle-build (cdr n) (cons (car n) a ))))
    (rcycle-build n '()))
```
I tried to find the end node and build the list in the same loop. This was unsuccessful as 
the function returns the list backwards as the way it is built. To rememedy this would 
destroy the integrity of the single list. 

Instead, I then used two loops, one find the end node and 
one to build the list, and then used cons to join the results of these functions.

**Answer**:

```racket
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
```

### Q.04

The combinations function does all the hard work for us here. 
It returns all the possible combinations of a given list in the form of a list of subsets,
including itself and an empty list. The empty list always comes first and the set of
everything in the original list always comes last in the list of subsets - so these are
easily removed from the loop that is building the final result. The loop acts as a filter only 
incluing the subsets with the sum of 0. It ends on the last subset and doesn't add this last subset
to the list being returned.

**Answer**:

```racket
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
```

Ref: https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Flist..rkt%29._combinations%29%29.

### Q.05

The first attempt seems like a better solution but will only work on a binary string. Works by adding the number itself to the counter each iteration. Will either better
1 or 0.
However, the question says to "return the number of non-zero elements" and doesn't specify 
anything about binary but only uses binary in the example.

**First attempt**:

```racket
(define (hamming-weight n)
    (define (hamming-weight-calc n c)
    (if (null? n)
        c
        (hamming-weight-calc (cdr n) (+ c (car n)))))
    (hamming-weight-calc n 0))
```

Similar to the last task a loop is required but holds a counter instead. Plan to use the cond function with three conditions:

+ If arg1(input list) is null - then return counter (arg2) 
+ If the first number is zero - use recursion to continue the loop passing in the 
cdr of n and the unchanged counter
+ Else                        - use recursion to continue the loop passing in the 
cdr of n and the incremented counter

**Answer**:

```racket
(define (hamming-weight n)
    (define (hamming-weight-calc n c)
    (cond
        ((null? n) c)
        ((= (car n) 0) (hamming-weight-calc (cdr n) c))
        (else (hamming-weight-calc (cdr n) (+ c 1)))))
    (hamming-weight-calc n 0))
```

-----

__*Tara O'Kelly - G00322214@gmit.ie*__
