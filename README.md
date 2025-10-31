# 🔤 Lex Token Recognition

A simple lexical analyzer built using **Flex (Fast Lexical Analyzer Generator)** to recognize and categorize tokens such as keywords, identifiers, operators, and literals in a C source code file.

---

## 📘 Project Overview

This project demonstrates how a **lexical analyzer** (lexer) works by tokenizing a C program and identifying:
- Keywords  
- Identifiers  
- Operators  
- Constants / Literals  

It also provides a summary count of each token type.

---

## ⚙️ Technologies Used

- **Flex** — for lexical analysis  
- **GCC** — to compile the generated C code  
- **C Language** — for integrating and running the lexer  

---

## 🧩 Files Included

| File Name | Description |
|------------|-------------|
| `token_recognition.l` | Flex source file containing lexer rules |
| `lex.yy.c` | C source generated automatically by Flex |
| `sample.c` | Example C input file to test token recognition |
| `README.md` | Project documentation file |

---

## 🧠 Lex Rules Overview

The lexer recognizes the following token types:

| Token Type | Example |
|-------------|----------|
| **Keyword** | `int`, `float`, `return` |
| **Identifier** | `main`, `a`, `b` |
| **Operator** | `=`, `+`, `<`, `>` |
| **Integer Constant** | `10`, `0` |
| **Float Constant** | `5.5` |
| **Character Literal** | `'x'` |

---

## 🧑‍💻 How to Run

```bash
flex token_recognition.l
gcc lex.yy.c -o token_recognition
token_recognition sample.c


