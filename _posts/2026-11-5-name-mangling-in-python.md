---
title: name mangling in python
date: 2026-11-5 16:00:00 +0800
category: Notes
tags:
  - "#python"
  - "#OOP"
description: Brief intro to the name mangling in python, in class statement.
lang: en
---
# Name Mangling `__name` 

In a class statement, special attribute names like `__name` will be interpreted as `_ClassType__name` . Python does so to avoid conflicts in inheriting an object. 

```python
class A:
	def __init__(self):
		self.__value = 100
	
	def get_A_value(self):
		return self.__value

class B(A):
	def __init__(self):
		self.__value = 200
		super().__init__()
	
	def get_B_value(self):
		return self.__value
		
>>> B().get_B_value()
200
>>> B().get_A_value()
100
```

**NOTE**: When calling `B().get_A_value()` , `_A__value` is actually called. It indicates that what the class statement is the attribute name in matters, rather than what class type is `self` . 
**Warning**: DO NOT call `B()._B__value` directly! You are breaking **DATA ABSTRACTION** ! 