# Problem Sheet: Turning Machines

### Q.1. 

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

### Q.2.

```
s 	r 	w 	m 	n
q0	-	0	r	qa
q0	0	0	r	q0
q0	1	1	r	q1
q0	-	1	r	qa
q0	0	0	r	q0
q0	1	1	r	q1
```

### Q.3.

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

### Q.4.

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

### Q.5.

```
s 	r 	w 	m 	n
q0	-	0	r	qa
q0	0	0	r	q0
q0	1	0	r	q1
q1	-	1	r	qa
q1	0	1	r	q0
q1	1	1	r	q1
```

### Q.6.

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

### Q.7.

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

### Q.8.

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

-----

__*Tara O'Kelly - G00322214@gmit.ie*__