---
title: Anonymous Recursion
date: 2026-09-02 12:00:00 +0800
category: Solutions
tags: [CS61A, Python, Recursion]
description: How can recursion work without a function name? Exploring lambdas, self-application, and f(f) through a CS61A exercise.
lang: en
---

```python
def make_anonymous_factorial():  
    """Return the value of an expression that computes factorial.  
  
    >>> make_anonymous_factorial()(5)
    120    
    >>> from construct_check import check    
    >>> # ban any assignments or recursion    
    >>> check(HW_SOURCE_FILE, 'make_anonymous_factorial',    ...     ['Assign', 'AnnAssign', 'AugAssign', 'NamedExpr', 'FunctionDef', 'Recursion'])    
    True    """    
    return (lambda f: lambda x: 1 if x == 1 else x * f(f)(x-1))(lambda f: lambda x: 1 if x == 1 else x * f(f)(x-1))
```

This is a question about how to use recursion without calling the origin function name. 
## Core

1. Create a imaginary function (`f` here) and assume it plays the same role of the original function ( `make_anonymous_factorial` here). 
2. Pass the imaginary function `f` itself in `f` as a formal parameter. 

## Past Confusions

1. Q: Why `f(f)` ? `f` is a parameter, isn't it? 
	1. A: `f` is a parameter when you define the function. But when you pass itself( a function)in, `f` has been already bound to a function, which is itself. 
2. Q: Why `f(f)` ? We assume `f` plays the same role of the recursion function, isn't it? 
	1. A: Function `f` is a lambda function. So whenever you call it, you should pass its parameter, which is itself.
# Logic Steps

```python
return lambda x: 1 if x == 1 else f(x-1) * x
```
I want `f` to be the function `lambda x` itself, but `f` has not been defined yet.  
So I will bind `f` to the `lambda x` itself. In other words, pass `lambda x` to a parameter `f` so that `f` will be `lambda x: ...` . 
```python
return (lambda f: lambda x: 1 if x == 1 else f(x-1) * x)(lambda x: 1 if x == 1 else f(x-1) * x)
```
However, in right hand side, `f` has not been defined yet, so this is not the final solution.  
But if I said 'Hey python, you just regard `f` as a parameter first. ' Then, 
```python
return (lambda f: lambda x: 1 if x == 1 else f(x-1) * x)(lambda f: lambda x: 1 if x == 1 else f(x-1) * x)
```
However, now parameter `f` is bound to a lambda function which takes in an argument `f` , so `f(x-1)` is no more correct, instead, `f(f)(x-1)` .   
And the right hand side should be exactly the same as left hand side. 
```python
return (lambda f: lambda x: 1 if x == 1 else f(f)(x-1) * x)(lambda f: lambda x: 1 if x == 1 else f(f)(x-1) * x)
```
Finally, pass the last argument `n` , and we are done. 
```python
def factorial(n):
	return return (lambda f: lambda x: 1 if x == 1 else f(f)(x-1) * x)(lambda f: lambda x: 1 if x == 1 else f(f)(x-1) * x)(n)
```