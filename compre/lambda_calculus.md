### Given the following lambda calculus encodings, prove the statements that follow:

### **Church Numerals**:
   - 0 = λf. λx. x
   - 1 = λf. λx. f x
   - 2 = λf. λx. f (f x)
   - 3 = λf. λx. f (f (f x))

### **Operators Table**:

| **Operator**        | **Encoding**                                      |
|----------------------|----------------------------------------------------|
| `True`               |  λx. λy. x                      |
| `False`              |  λx. λy. y                      |
| `S` (Successor)      |  λn. λf. λx. f (n f x)   |
| `add` (Addition)     |  λm. λn. λf. λx. m f (n f x) |
| `mul` (Multiplication) |  λm. λn. λf. m (n f)   |
| `exp` (Exponentiation) |  λm. λn. n m                  |
| `pred` (Predecessor)|  λn. λf. λx. n (λg. λh. h (g f)) (λu. x) (λu. u) |
| `iszero`            |  λn. n (λx. False) True |
| `not`               |  λb. b False True        |
| `and`               |  λp. λq. p q False       |
| `or`                |  λp. λq. p True q        |
| `if`                |  λb. λx. λy. b x y       |
| `sub` (Subtraction) |  λm. λn. n pred m      |
| `gt`                |  λm. λn. iszero (sub n m) |
| `lt`                |  λm. λn. iszero (sub m n) |

### **Statements to prove**:

1. `add 2 3` is ß-equivalent to `5`
2. `mul 2 3` is ß-equivalent to `6`
3. `exp 2 3` is ß-equivalent to `8`
4. `pred 3` is ß-equivalent to `2`
5. `iszero 0` is ß-equivalent to `True`
6. `not True` is ß-equivalent to `False`
7. `and True False` is ß-equivalent to `False`
8. `or True False` is ß-equivalent to `True`

#### **For each proof**:
- Use the operators table to find the encoding of each operator.
- Use the Church numerals to find the encoding of each Church numeral.
- Perform ß-reductions on LHS step by step to convert it to the RHS.
