---
title: Vim Basics
date: 2026-09-26 16:00:00 +0800
category: Notes
tags: [vim]
description: Basic commands of vim.
lang: en
---
# Basic commands

##  insert model 

1. insert in front of cursor`i` 
2. insert behind cursor `a` 
3. insert at the end of the current line `A` 
4. create a new line downward and enter insert model `o` 
5. create a new line upward and enter insert model `O` 
6. `dd` delete the whole row
7. `cc` delete the whole row and enter insert model
8. `x` delete the word under cursor
## move cursor

1. `h j k l` ——> `left down up right` 
2. `A` ——> move to the end of current line and enter insert model
3. `$` ——> move to the rightmost word of current  line (in vim, cursor represents a word rather than a gap between two words, so you cannot put a cursor at the end of a line when in normal model)
4. `gg` move to the first row of a file
5. `G` move to the last row of a file
6. `esc`
7. `u` undo
8. `w` `b` move to next / former words
## Save and exit

1. save and exit: press `esc` to enter normal model, then type `:wq` 
2. exit without saving: `esc` , then `:q!` 
3. save: `esc` , then `:w` 