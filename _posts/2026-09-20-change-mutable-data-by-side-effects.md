---
title: Change Mutable Data by Side Effects
date: 2026-09-20 2:33:00 +0800
category: Notes
tags: [CS61A, Python, Mutable Data, Frame]
description: To tell the difference between rebinding a formal parameter and to mutate data by side effects.
lang: en
---

When you pass a mutable data as an argument into a function, then the formal parameter will be bound to the mutable data. 
**BUT** , when you write something like `<parameter> = ...` , then the name `<parameter>` usually will be rebound to a new data, which means whatever you are going to do with the `<parameter>` again, you are never changing the initial mutable data. 

example
```python
def rebind(list1):
	list1 = list1 + [1]
def mutate(list2):
	list2[0] = -1
	list2.append(-2)
	
"""
>>> list1 = [1, 2, 3]
>>> list2 = [1, 2, 3]
>>> rebind(list1)
>>> list1
[1, 2, 3]
>>> mutate(list2)
>>> list2
[-1, 2, 3, -2]
"""
```
**NOTE**: When it comes to other objects in OOP, it's similarly. 
```python
"""
>>> link = Link(1, Link(2))
#  Now we are going to implement a function which add(mutate the initial link) a node n between 1 and 2; returns None.
>>> link.edit(n)
>>> link
Link(1, Link(3, Link(2)))
"""

# CORRECT ONE
	def mutate(self, n):
		self.rest = Link(n, self.rest)

# INCORRECT ONE
	def rebind(self, n):
		self = Link(1, Link(n, Link(2)))
```

Easy to find that what does the incorrect one do is just rebind the formal parameter self to another Link. Thus, when the function finished, the formal parameter is erased, and you've done nothing. 