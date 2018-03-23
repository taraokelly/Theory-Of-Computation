# CA

Continuous assessment assigned for the module [Theory of Algorithms](https://github.com/theory-of-algorithms/). This CA is responsible  for 30% of the overall grade. A list of 10 functional programming tasks, to be written in Racket, are to be completed by the 8th of April.

The questions along with their solutions can be found in the found in the separate files named: **_Qx.-title.rkt_**, e.g. question number one, about the function ```decide-prime```, is located in __*Q.01-DecidePrime.rkt*__. Easy read copies of the solutions can be found in the [solutions](#solutions) section of this README. The full specification of this assignment can be found [here](https://github.com/taraokelly/Theory-Of-Computation/blob/master/CA/problems.pdf).

## Table of Contents

+ [How to Run](#how-to-run)
+ [Additional Features](#additional-features)
+ [Solutions](#solutions)

## How to Run

### With Visual Studio (Recommended)

+ Download Racket if needed, download [here](http://racket-lang.org/download/). Don't forget to add racket to the environment variable path!
+ Open current directory, CA, as a folder in Visual Studio Code. If needed, download [here](https://code.visualstudio.com/download).
+ To run a problem, e.g. Q.01-DecidePrime.rkt, open in the editor and make sure it is the selected tab. Next, press ```ctrl + shift + b``` to run.

### From Terminal

+ Download Racket if needed, download [here](http://racket-lang.org/download/). Don't forget to add racket to the environment variable path!
+ Open the CA directory in terminal.
+ Enter ```racket Qx.-title.rkt``` to run.

### With DrRacket

+ Download Racket if needed, download [here](http://racket-lang.org/download/). DrRacket is a programming environment that is included.
+ Open DrRacket.
+ Open desired file.
+ Click run or press ```F5``` to run.

## Additional Features

### Test Racket

The other racket file found in this repository is the **_Test.rkt_** file. This file held a generalized function that was used as an import to test the individual problems/questions in the separate files.

```racket
(define (test m n)
  (if (equal? m n)
    #t
    #f
  )
)
```

This test function takes advantage of the function ```equal?``` and its generalized datatype support. These include strings, byte strings, pairs, mutable pairs, vectors, boxes, hash tables, and inspectable structures. Ref: https://docs.racket-lang.org/reference/booleans.html#%28def._%28%28quote._~23~25kernel%29._equal~3f%29%29

## Solutions

### Q.01

Breaking this task down and examining what must be done, it is to be noted that a "brute-force" algorithm is greedy exhaustive. In this case, every positive number less than the positive number *n* should be checked to see if it is a factor of *n*. If it is, then *n* must not be a prime number. This is because a prime number is a number where it's component factors can only consist of itself(*n*) and 1. Since it is only every number less than *n* being evaluated, *n* itself is never checked. The number 1 should also be excluded from the search. Every number is to be checked until the answer is found.

**_Answer_**:

```racket
(define (decide-prime n)
      (define (prime-loop n m)
      ; Check if m is equal to n - m acts as a counter, starting from 2 -> n.
      ; If m has reached n without finding a component factor of n and returning false, 
      ; then must be a prime number.
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

**_Answer_**:

```racket
(define (collatz-list n)
  ; Cond allows more than 2 conditions (true or false), similar to an else if statement or 
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
    (else
      ; cons (3 * n) + 1 to the list.
      (cons n (collatz-list (+ (* 3 n) 1))))))
```

### Q.03

#### lcycle

To create the lcycle function - the first digit can easily be separated using car and the rest can also be separated using cdr.

**_First attempt_** (works but method uses append):

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

**_Answer_**:

```racket
; Separate with cdr and car - then loop to append each individual digit to list by 
; the cons function.
(define (lcycle n)
    (define (lcycle-build n a)
        (if (null? n)
            (cons a '())
            (cons (car n) (lcycle-build (cdr n) a))))
    (if (null? n) '() (lcycle-build (cdr n) (car n))))
```

### rcycle

To create the rcycle function - the last digit can be achieved by looping till the end 
to find the number next to null. I tried to find the end node and build the list in the same loop. This was unsuccessful as 
the function returns the list backwards as the way it is built. To remedy this would 
destroy the integrity of the single list. 

**_First attempt_**:

```racket
(define (rcycle n)
    (define (rcycle-build n a)
        (if (null? (cdr n))
            (cons (car n) a)
            (rcycle-build (cdr n) (cons (car n) a ))))
    (rcycle-build n '()))
```

Instead, I then used two loops, one to find the end node and 
one to build the list, and then used cons to join the results of these functions.

**_Answer_**:

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
    (if (null? n) '() (cons (get-last n) (rcycle-build n))))
```

### Q.04

The combinations function does all of the hard work for us here. 
It returns all the possible combinations of a given list in the form of a list of subsets,
including itself and an empty list. The empty list always comes first and the set of
everything in the original list always comes last in the list of subsets - so these are
easily removed from the loop that is building the final result. The loop acts as a filter only 
including the subsets with the sum of 0. It ends on the last subset and doesn't add this last subset
to the list being returned.

**_Answer_**:

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
anything about only accepting binary but only uses binary in the example.

**_First attempt_**:

```racket
(define (hamming-weight n)
    (define (hamming-weight-calc n c)
    (if (null? n)
        c
        (hamming-weight-calc (cdr n) (+ c (car n)))))
    (hamming-weight-calc n 0))
```

Moving onto a solution that will work for all whole numbers, a loop is required. Plan to use the cond function with three conditions:

+ If *n* is null - then return the counter *c* 
+ If the first number or car of *n* is zero - use recursion to continue the loop passing in the 
cdr of *n* and the unchanged counter
+ Else                        - use recursion to continue the loop passing in the 
cdr of *n* and the incremented counter *c*

**_Second attempt_**:

```racket
(define (hamming-weight n)
    (define (hamming-weight-calc n c)
    (cond
        ((null? n) c)
        ((= (car n) 0) (hamming-weight-calc (cdr n) c))
        (else (hamming-weight-calc (cdr n) (+ c 1)))))
    (hamming-weight-calc n 0))
```

The following solutions are optimized versions off the previous attempts. I updated 
these upon realising that the inner function and counter to keep track of the 
hamming weight was not the most sophisticated means to sum up the result. Instead the result would be continuously built, adding either 0 or 1 
per iteration. I began with applying this to the binary only version.

**_Third attempt_**:

```racket 
(define (hamming-weight n)
    (if(null? n) 
        0
        (+ (car n) (hamming-weight (cdr n)))))
```
I then moved on to updating the better solution.

**_Answer_**:

```racket 
(define (hamming-weight n)
    (cond
        ((null? n) 0)
        ((= (car n) 0) (+ 0 (hamming-weight (cdr n))))
        (else (+ 1 (hamming-weight (cdr n))))))
```

### Q.06

The following solution is a BETTER solution than the next but assumes that the lists are of the same 
length. However, the question doesn't specify that they are.

**_First attempt_**:

```racket
(define (hamming-distance n m)
    (define (hamming-distance-calc n m d)
    (cond
        ((null? n) d)
        ((= (car n) (car m)) (hamming-distance-calc (cdr n) (cdr m) d))
        (else (hamming-distance-calc (cdr n) (cdr m) (+ d 1)))))
    (hamming-distance-calc n m 0))
    
```

In regards to a solution that will accept lists of differing length, a looping function with copies of the input and a counter starting from 0 can be used. The counter or distance will be incremented if the first number of each 
list is the same. Using cond again:

+ Both lists (*n* amd *m*) are null - return *d* (distance) if both are null.
+ *n* is null - recursion while passing in cdr of non-null list *m* and an incremented *d*.
+ *m* is null - recursion while passing in cdr of non-null list *n* and an incremented *d*.
+ Car of both lists are the same - recursion while passing in cdr of both and a non-incremented *d*.
+ Else - mustn't be the same so recursion while passing in cdr of both lists and an incremented *d*.

**_Second attempt_**:

```racket
(define (hamming-distance n m)
    (define (hamming-distance-calc n m d)
    (cond
        ((and (null? n) (null? m)) d)
        ((null? n) (hamming-distance-calc n (cdr m) (+ d 1)))
        ((null? m) (hamming-distance-calc (cdr n) m (+ d 1)))
        ((= (car n) (car m)) (hamming-distance-calc (cdr n) (cdr m) d))
        (else (hamming-distance-calc (cdr n) (cdr m) (+ d 1)))))
    (hamming-distance-calc n m 0))
```

Like Q.5, the following solution is an optimized version off the previous attempt. I updated the last solution 
upon realising that the inner function and counter to keep track of the hamming weight was 
not the most sophisticated means to sum up the result. Instead the result would be 
continuously built, adding either 0 or 1 per iteration.

**_Answer_**:

```racket 
(define (hamming-distance n m)
    (cond
        ((and (null? n) (null? m)) 0)
        ((null? n) (+ 1 (hamming-distance n (cdr m))))
        ((null? m) (+ 1 (hamming-distance (cdr n) m)))
        ((= (car n) (car m)) (+ 0 (hamming-distance (cdr n) (cdr m))))
        (else (+ 1 (hamming-distance (cdr n) (cdr m))))))
```

### Q.07

Not worrying about non-finite sized lists, maps can be used. 
With a lambda expression iterating over the three maps, it sums the *n*th number 
from each and checks if the sum > 1. If the sum is not > 1 - there can't be more 
than one 1 present and 0 is mapped to the new list. If the sum is not > 1 - 1 is 
mapped to the new list.

**_Answer_**:

```racket
(define (maj a b c)
    (map (lambda (n1 n2 n3)
         (if(> (+ n1 n2 n3) 1) 1 0))
       a b c))
```

Ref: [https://docs.racket-lang.org/reference/pairs.html](https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Fmap..rkt%29._map%29%29) 

### Q.08

Again, we don't have to worry about non-finite sized lists and non-binary. With a map iterating 
over the three maps (*x*, *y* and *z*) using a lambda expression, it checks if the nth number of *x* is 
equal to 1. If it is return the *n*th number of *z*, and if it is not the *n*th number *y*.

**_Answer_**:

```racket
(define (chse x y z)
    (map (lambda (n1 n2 n3)
         (if(= n1 1) n2 n3))
       x y z))
```

### Q.09

Implemented similarily to the last two tasks, the sod2 function uses different logic in 
its if statement. It checks if the sum of the *n*th number of *x*, *y* and *z* is divisible by 
2. If it is, the answer must be even, and 0 is mapped to the *n*th spot in the resulting 
list. If it is not divisible by 2, the answer must be odd, and 1 is mapped to the *n*th 
spot in the resulting list.  

**_Answer_**:

```racket
(define (sod2 x y z)
    (map (lambda (n1 n2 n3)
         (if(= (modulo (+ n1 n2 n3) 2) 0) 0 1))
       x y z))
```

### Q.10

This task requires the squared distance between each of the *i*th pair elements to be 
summed together to create the result. Using maps again, the map finds the distance 
between both elements and multiplies it by itself. This number is mapped the a new 
list. The returned list is then looped over recursively, building the sum of every
element in the list.

**_First attempt_**:

```racket
(define (lstq m l)
    (define (lsum l)
            (if (null? l) 0 (+ (car l) (lsum (cdr l)))))
    (lsum (map (lambda (i1 i2)
         (* (- i1 i2) (- i1 i2)))
       m l)))
```

The above solution works well bar the minor issue that it unnecessarily finds the 
distance between each of the *i*th pair elements twice - ```(* (- i1 i2) (- i1 i2))```. This could be easily 
corrected, I add another function, ```square```, to find the square root. As a result, 
the distance is only calculated once.

**_Second attempt_**:

```racket
(define (lstq m l)
    (define (lsum l)
            (if (null? l) 0 (+ (car l) (lsum (cdr l)))))
    (define (square n) (* n n))
    (lsum (map (lambda (i1 i2)
         (square (- i1 i2)))
       m l)))
```

The separate ```square``` function can only be called once, so I thought it simpler to convert
it into a lambda  expression.

**_Answer_**:

```racket
(define (lstq m l)
    (define (lsum l)
            (if (null? l) 0 (+ (car l) (lsum (cdr l)))))
    (lsum (map (lambda (i1 i2)
         ((lambda (x) (* x x)) (- i1 i2)))
       m l)))
```

-----

__*Tara O'Kelly - G00322214@gmit.ie*__
