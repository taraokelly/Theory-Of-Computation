# Theory of Algorithms
Revision notes for final exam.

+ [Functional Programming](#functional-programming)

## Functional Programming
Functional programming (e.g. *Lisp, Haskell, Racket*), a form of declarative programming, is a programming paradigm based on lambda calculus. 

Functional programming greatly contrasts with the current dominant programming paradigm, imperative programming (e.g. *Java, JavaScript, C, etc*. are predominantly imperative).

The main difference between imperative and functional is that functional programming is stateless. Rather than assigning values which can then be mutated (to track the state like in imperative languages) the value returned by a function is only dependent on its input.
The lack of state allows a functional language to be reasoned just by looking at a function’s input and output. 

Instead of ```for``` and ```while``` loops, recursion is used instead. Most people are exposed to recursion in imperative languages, but functional languages can have special support for recursion (such as tail recursion).

###### ** The sequence of state changes in imperative programming is often called a *side effect*. A side effect can be described as a modification of some state outside its scope or has an observable interaction with its calling functions besides returning a value.

###### ** *Recursion* is just the idea of one’s own definition to call itself.

###### ** *Tail recursion* can be achieved in Racket by passing in the ```cdr``` of a list as the parameter of the the recursive call. 

### Functional Pros
- **Less Bugs** - utilizing pure functions, leads to reliable functions with no side effects that accomplish and return exactly what you expect them to. 
- **Easier troubleshooting** - the usage of independent units(in the form of functions) come into play here. Unit testing can be easier as the modular functions can be singled out and tested.
- **Better Performance** - utilizing a more declarative style, which focuses more on “what to do” and less about “how it’s being done”, places the emphasis on performance and optimization.
- **Better Encapsulation** - functional supports better encapsulation than even the OO style common within imperative with the use of pure functions.
- **Increase Reusability** - as functional programs are made up of independent units, we can reuse them very easily.
- **Good Modularity** - a product of the smaller and independent units to support the stateless programming model. 
- **Efficient Parallel Programming** - as functional languages have NO mutable state, they don’t raise any state-change issues. 
- **Support for Big Data** - as functional programming supports parallel programming and better performance, it is very good for developing big data applications

### Functional Cons
- **Steep learning curve** - [ insert waffle ].
- **A young paradigm** - it’s much harder to find documentation and information.
- **Poor readability** - sometimes functions can become very verbose and become difficult to follow in comparison to the imperative programming.
- **Requires a Lot of Memory** - due to functional programmings statelessness. Since the creation of new objects may be needed to perform additional actions (instead of modifying existing objects), it takes lot of memory.

### Bit’a History
- Alonzo Church introduced lambda calculus in 1932.
- Church was Turing’s supervisor. 
- Church–Turing thesis: **lambda calculus _is_ computation**.
- Turing showed that some problems are not solvable by any computer with Turing machines, and Church with lambda Calculus. E.g. **Entscheidungsproblem** or **halting problem** - the problem of creating algorithm to check if another algorithm finishes in a finite or infinite time.
In the 1950’s, John McCarthy created **Lisp**, the first functional programming language.
