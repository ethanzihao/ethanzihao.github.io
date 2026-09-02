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