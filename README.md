# Dr. Quine

A collection of quine implementations in multiple programming languages. A quine is a program that produces its own source code as output.

## Overview

This project contains three different quine implementations (Colleen, Grace, and Sully) written in C, Python, and Assembly(x86-64).

### What is a Quine?

A quine is a self-replicating computer program that produces its own source code as output without:
- Reading its own source file
- Using trivial solutions like empty programs or error messages

## Project Structure

```
dr-quine/
├── C/              # C implementations
│   ├── Colleen.c   # Basic C quine
│   ├── Grace.c     # C quine variant
│   ├── Sully.c     # C quine variant
│   └── Makefile
├── Python/         # Python implementations
│   ├── Colleen.py  # Basic Python quine
│   ├── Grace.py    # Python quine variant
│   └── Sully.py    # Python quine variant
├── ASM/            # x86-64 Assembly implementations
│   ├── Colleen.s   # Basic Assembly quine
│   ├── Grace.s     # Assembly quine variant
│   ├── Sully.s     # Assembly quine variant
│   └── Makefile
├── LICENSE
└── README.md
```

## Building and Running

### C Programs

```bash
cd C
make
./Colleen
./Grace
./Sully
```

### Python Programs

```bash
cd Python
python3 Colleen.py
python3 Grace.py
python3 Sully.py
```

### Assembly Programs

```bash
cd ASM
make
./Colleen
./Grace
./Sully
```

## Expected Output

When executed, each quine program should output its own source code exactly as written.

Example:
```bash
$ ./Colleen > output.c
$ diff output.c Colleen.c
```

The above commands should produce no differences, confirming the quine is working correctly.

## Quine Variants

- **Colleen**: The basic, simple quine implementation
- **Grace**: A more complex quine variant
- **Sully**: An even more sophisticated quine variant

## Implementation Details

Each language has different approaches to solving the quine problem:

- **C**: Uses format strings and printf to embed and reproduce the source
- **Python**: Leverages Python's string formatting and repr functionality
- **Assembly**: Direct system calls and careful memory manipulation

## References

- [Wikipedia: Quine (computing)](https://en.wikipedia.org/wiki/Quine_(computing))
- [The Quine Page](http://www.nyx.net/~gthompso/quine.htm)
