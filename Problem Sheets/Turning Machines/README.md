# Problem Sheet: Turning Machines

### 1. Consider the following Turn Machine.

| State         | Input        | Write        | Move       | Next         |
|:-----------:|:-----------:|:-----------:|:-----------:|:-----------:|
| *q0*        | -               | -               | L               |  *qa*  |
| *q0*        | 0              |  0              | R               | *q0*  |
| *q0*        | 1              |  1              | R               | *q1*  |
| *q1*        | -               | -               | L               |  *qf*  |
| *q1*        | 0              |  0              | R               | *q1*  |
| *q1*        | 1              |  1              | R               | *q0*  |

Determine what happens when the Turing Machine is run with the following inputs initially on the tape.

**(a)** 0001

```
(q0)0 0 0 1
0 (q0)0 0 1
0 0 (q0)0 1
0 0 0 (q0)1
0 0 0 1(q1)

ANS: fail
```

**(b)** 0111

```
 (q0)0 1 1 1
 0 (q0)1 1 1
 0 1 (q1)1 1
 0 1 1 (q0)1

ANS: fail
```

**(c)** 0110

```
 (q0)0 1 1 0
 0 (q0)1 1 0
 0 1 (q1)1 0
 0 1 1 (q0)0

ANS: pass
```

**(d)** 0101010001

```
 (q0)0 1 0 1 0 1 0 0 0 1
 0 (q0)1 0 1 0 1 0 0 0 1
 0 1 (q1)0 1 0 1 0 0 0 1
 0 1 0 (q1)1 0 1 0 0 0 1
 0 1 0 1 (q1)0 1 0 0 0 1
 0 1 0 1 0 (q0)1 0 0 0 1
 0 1 0 1 0 1 (q1)0 0 0 1
 0 1 0 1 0 1 0 (q1)0 0 1
 0 1 0 1 0 1 0 0 (q1)0 1
 0 1 0 1 0 1 0 0 0 (q1)1

ANS: pass
```

**(e)** 0101010001

```
 (q0)0 1 0 1 0 1 0 0 0 1
 0 (q0)1 0 1 0 1 0 0 0 1
 0 1 (q1)0 1 0 1 0 0 0 1
 0 1 0 (q1)1 0 1 0 0 0 1
 0 1 0 1 (q0)0 1 0 0 0 1
 0 1 0 1 0 (q0)1 0 0 0 1
 0 1 0 1 0 1 (q1)0 0 0 1
 0 1 0 1 0 1 0 (q1)0 0 1
 0 1 0 1 0 1 0 0 (q1)0 1
 0 1 0 1 0 1 0 0 0 (q1)1

ANS: pass
```

**(f)** 00

```
 (q0)0 0
 0 (q0)0

ANS: pass
```

**(g)**

```
ANS: pass
```

### 2. Give the state table for a Turing Machine that appends a parity bit to a tape with a string of consecutive 0's and 1's.

```
s 	r 	w 	m 	n
q0	-	0	r	qa
q0	0	0	r	q0
q0	1	1	r	q1
q0	-	1	r	qa
q0	0	0	r	q0
q0	1	1	r	q1
```

### 3. Construct a Turing Machine to compute the sequence 0 - 1 - 0 - 1 - 0 - ..., that is, 0 blank 1 blank 0 blank, etc [1].

```
s 	r 	w 	m 	n
q0	- 	0 	r 	q1
q0	0 	0	r	q1
q0	1	0	r	q1
q1	- 	- 	r 	q2
q1	0 	-	r	q2
q1	1	-	r	q2
q2	- 	1 	r 	q3
q2	0 	1	r	q3
q2	1	1	r	q3
q3	- 	- 	r 	q0
q3	0 	-	r	q0
q3	1	-	r	q0
```

### 4. Give the state table for a Turing Machine that multiplies a string of consecutive 0's and 1's by 2. The machine should treat the initial contents of the tape as a natural number written in binary form, with the least significant bit at the end. That is, if the contents of the tape are 01101, then the right-most 1 represents the number 1, the middle 1 represents the number 4 and the left-most 1 represents the number 8. Then the number on the tape is 8 + 4 + 1 = 13.

```
Odd binary numbers end in 1 and even binary numbers always end in 0. 
Since any number divisible by 2 will always be even, the result of 
the turing machine algorithm will therefore always end in zero. 
Building on this knowledge, we noticed from examining a conversion 
table of decimal to binary that any number multiplied by 2 is the same 
binary number with another zero appended to the end
- i.e. with (x)2 -> notation for binary and (x)10 notation for decimal:
(1)2 * (2)10 = (10)2, (111)2 * (2)10 = (1110)2, (111100)2 * (2)10 = (1111000)2.

s 	r 	w 	m 	n
q0	-	0	r	qa
q0	0	0	r	q0
q0	1	1	r	q0
```

### 5. Give the state table for a Turing Machine that multiplies a string of consecutive 0’s and 1’s by 2. The machine should treat the initial contents of the tape as a natural number written in binary form, with the most significant bit at the end. That is, if the contents of the tape are 01101, then the right-most 1 represents the number 16, the middle 1 represents the number 4 and the left-most 1 represents the number 2. Then the number of the tape is 2 + 4 + 16 = 22.

```
s 	r 	w 	m 	n
q0	-	0	r	qa
q0	0	0	r	q0
q0	1	0	r	q1
q1	-	1	r	qa
q1	0	1	r	q0
q1	1	1	r	q1
```

### 6. Give the state table for a Turing Machine that adds 1 to a string of consecutive 0’s and 1’s, where the least significant digit is on the right of the input.

```
Assuming, like the questions above, that the numbers are to be read from right to left 
- like 01101 is to be read as 8 + 4 + 1 = 13. Therefore, this algorithm should take the 
input 01101 and produce the result like so 8 + 4 + 1 + 1 = 14.

s 	r 	w 	m 	n
q0	-	-	l	q1
q0	0	0	r	q0
q0	1	1	r	q0
q1	-	1	r	q2
q1	0	1	r	q2
q1	1	0	l	q1
q2	-	-	r	qa
q2	0	0	r	q2
q2	1	1	r	q2

```

### 7. Give the state table for a Turing Machine that subtracts 1 to a string of consecutive 0’s and 1’s, where the least significant digit is on the right of the input.

```
Assuming, like the questions above, that the numbers are to be read from right to left 
- like 01101 is to be read as 8 + 4 + 1 = 13. Therefore, this algorithm should take the 
input 01101 and produce 8 + 4 + 1 - 1 = 12.

s 	r 	w 	m 	n
q0	-	-	l	q1
q0	0	0	r	q0
q0	1	1	r	q0
q1	-	-	r	q3
q1	0	0	l	q1
q1	1	0	r	q2
q2	-	-	r	qa
q2	0	1	r	q2
q2	1	1	r	q2
q3	-	-	r	qa
q3	0	0	r	q3
q3	1	1	r	q3
```

### 8. List all words of length at most three in Σ∗ where Σ is: 

**(a)** {0, 1}

```
Σ, 0, 1, 00, 01, 10, 11, 001, 010, 011, 100, 101, 110, 111
```

**(b)** {a, b, c}

```
Σ, a, b, c, aa, ab, ba, bb, cc, cb, bc, ac, ca, aaa, bbb, ccc, aab, aac, aba, aca, abb, acc, abc, acb, bba, bbc, baa, bcc, bac, bca, caa, cbb, cab, cba 
```

**(c)** {}

```
Σ
```

### 9. Design a Turing machine to recognise the language {0^n1^n | n ≥ 0}.

### 10. Design a Turing machine to recognise the language {ww^R | w ∈ {0, 1}∗} where w R is w reversed. For example, when w = 101011 then w^R = 110101.

### 11. Design a Turing machine to recognise the language {(a^i)(b^j)(c^k)| i, j, k ∈ N0}

-----

__*Tara O'Kelly - G00322214@gmit.ie*__