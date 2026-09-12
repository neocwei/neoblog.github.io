---
title: "Escaping Chemical Engineering: My First Year of Python"
date: 2026-09-13 21:00:00
tags:
  - Python
  - Learning
---

There's a repository in my GitHub whose README opens with a line that barely tried to be polite:

> This is my learning record. Begin from 2025.04.03. I want to get away from chemical engineering rubbish.

On April 3, 2025, a chemical engineer decided to learn Python. Today, that repository holds 213 Python files, roughly four thousand lines of code, and every bit of clumsiness and honesty along the way. This post is its summary.

## The route: one textbook for foundations, two mountains for practice

Looking back, my learning path was almost textbook-perfect:

1. ***Python Crash Course***: from chapter 3 all the way to chapter 11 — lists, dictionaries, loops, functions, classes and inheritance, files and JSON, exception handling, and a final chapter where I dutifully wrote pytest unit tests.
2. **Code Capriccio (代码随想录)**: hand-written data structures and algorithms — linked lists, every major sorting algorithm, stacks and queues, binary trees, strings, hash tables. Nothing skipped.
3. **LeetCode**: two dozen classics — Two Sum, Trapping Rain Water, sliding window maximum, Combination Sum, top-K frequent elements...
4. **Back to reality**: numpy and matplotlib to plot piecewise cost functions for an actual business question, plus data-statistics exercises on the Bohrium scientific computing platform.

## Progress you can see

The things I'm proudest of are the places where I kept multiple solutions side by side:

- **Trapping Rain Water**: six solutions in a single file, from brute-force O(n²) to dynamic programming, two pointers, and monotonic stacks. The full evolution of my thinking lives in the comments — including a bug-fix note that literally says "the original code had a logic error here", followed by the fix.
- **Hand-written linked list**: the same data structure written three times. The last version has a dummy head node and a voluntary note — "optimization: reuse addAtIndex to reduce code duplication". Turns out refactoring instinct really is something you can train.
- **Unified iterative tree traversal**: using a `(node, visited)` tuple to unify preorder, inorder, and postorder traversal into one template. The first time I got it working was a genuine "aha" moment.

## The mistakes stay too

This repository is not perfect — not even close. I spelled practice as practise and enumeration as enmuation. My very first algorithm-efficiency experiment printed `start_time - end_time`, which is negative. A few problem files were created and never filled in.

I've decided not to fix any of that. A learning log should keep errors and progress together — a year from now, the negative timer will be just as precious as the monotonic stack.

## Easter egg: a rose in the binary tree folder

When I was learning the turtle module, I drew a red rose. Later, after learning numpy parametric equations, I drew a 3D one — and put it in the `binarytree` folder (no idea what I was thinking that day). It's titled "Ling ❤ Neo, 2025", and the last line of the code reads:

```python
# My love for you is an infinite loop, unbreakable and eternal
```

Programmer romance hides in the places you'd never think to look.

## Closing words

From Hello World to monotonic stacks, from a resignation letter to a 3D rose — the biggest gain of this year wasn't four thousand lines of code. It was the confirmation of one thing: **a low starting point is not scary. Stopping is.**

The blog is called Becoming — I'm still on my way to becoming myself.
