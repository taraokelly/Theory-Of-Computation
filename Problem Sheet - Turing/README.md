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
q0	-	0	R 	qa
q0	0	0   R   q0
q0	1	1   R   q1
q1	- 	1   R   qa
q1	0   0   R   q1
q1	1   1   R   q0
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

### 5. Give the state table for a Turing Machine that multiplies a string a consecutive 0's and 1's by 2. The machine should treat the initial contents of the tape as a natural number written in binary form, with the most significant bit at the end. That is, if the contents of the tapeare 01101, then the right-most 1 repr

-----

__*Tara O'Kelly - G00322214@gmit.ie*__