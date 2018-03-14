# Problem Sheets

Continuous assessment assigned for the module [Theory of Algorithms](https://github.com/theory-of-algorithms/). This CA is responsoble for 30% of the overall grade.

The **questions along with their breakdowns and solutions** can be found in the found in the separate files named: **_Qx.-title.rkt_**, e.g. question number one, about the function ```decide-prime```, can be located in __*Q.01-DecidePrime.rkt*__. The full specification of this assignment can be found [here](https://github.com/taraokelly/Theory-Of-Computation/blob/master/CA/problems.pdf).

## How to Run

### With Visual Studio (Reccomended)

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

This test fucntion takes advantage of the the function ```equal?``` and its generalized datatype support. These include strings, byte strings, pairs, mutable pairs, vectors, boxes, hash tables, and inspectable structures. Ref: https://docs.racket-lang.org/reference/booleans.html#%28def._%28%28quote._~23~25kernel%29._equal~3f%29%29

-----

__*Tara O'Kelly - G00322214@gmit.ie*__
