
---
title: Two examples of lists in environment diagram
date: 2026-09-22 16:00:00 +0800
category: Notes
tags: [CS61A, Python, List, MutableData]
description: Lists in environment diagram
lang: en
---

# A list can be a mutable data as an entry of list

```python
>>> s = [1, 2]
>>> t = [3, 4]
>>> t += [s]    #take list s as an list entry
>>> t
[1, 2, [3, 4]]
>>> t[0] = -1
>>> t
[-1, 4]
>>> s
[1, 2, [-1, 4]]
```
When an entry of a list is a list, it's like a node, linking the list in the frame as a Linked List. 

# Adding a list to a list will create a new list and rebind the name

```python
>>> s = [1, 2]
>>> t = s
>>> s = s + t
>>> s
[1, 2, 1, 2]
>>> t
[1, 2]
```
As the example shows, the name `s` is rebound to a newly created list. 