---
title: Git Basics
date: 2026-09-27 20:50:00 +0800
category: Notes
tags: [Git]
description: Basic commands and workflow of git.
lang: en
---

# What is `HEAD` ? 

1. Simply imagine `HEAD` notes the latest version of your whole project in your current branch , after your latest commitment. 
	1. `HEAD` points at current branch. 
	2. Current branch is also a pointer to the latest commit done in the branch. 
	3. A branch points at the latest commit. 
# What's in `index` , or `staging area` ? 

1. When a new file is created in `working tree` , it has not been tracked, and has not been in `index` . 
2. Once you `add` a new file. It will be tracked, which means git will memorize its snapshot at that moment. Once git finds its `index` version is different from the one in `working tree` , `git diff` will tell you by a `modified` statement. 
# What happens when `commit` ?

1. When you commit, a snapshot of file in `index` is recorded as a commit. 
	1. Not only those newly added file will be record, but also those tracked, unchanged ones. 
2.  Branch (a pointer) will step forward to the latest commit. 
# Differences between `git diff` and `git diff --staged` 

1. `git diff` will show differences between `working tree` and `staging area` .
2. `gti diff --staged` will show differences between `staging area` and `HEAD` . 
# What does `working tree clean` means? 

1. `index` = `HEAD` = `working tree` 
2. no untracked files. 
# Red 'modified' and green 'modified'

1. `modified` means you modified the file. It appears when you call `git diff` or `git diff --staged` 
	1. Red `modified`  means you have not staged the modification .
	2. Green `modified` means the modified version has been staged. 
	3. A file could appear both in red and green `modified` , which means you changed it after you staged it. 
# About undo

1. `git restore --staged <filename>` : restore the *staged* file to *HEAD* version.  
2. `git restore <filename>` : restore the *woking tree* file to *staged* version.   
3. `git restore --source=<Hash value> (--worktree --staged)( -- <filename>)` , restore current index or working tree to former commit snapshot. 
	1. Untracked files will not be overrode. 
	2. After restore, remember to **commit**. 
	3. If you add ` -- <filename>` , you can pick up `<filename>` only. 
	4. **Be careful** , if a commit is noted as 'remove file_A', then you **cannot** find it from this commit, because no such file in this snapshot. You should find even more former commits. 
# About ignore

1. `.gitignore` will only tell git to ignore those which have not been tracked. But if you forget to `rm` a file from `index` , then though you write a rule in `.gitignore` , it will still be tracked. So, **REMOVE** it from index first!  
# About remove

1. To remove a tracked file from `index` , use `git rm --cached <filename>` . **Keep in mind** , remove also need to be committed. 
# About rename

If you changed a tracked file's name, then git will recognize it as an untracked file `new_name.md` and a deleted file `old_name.md` .
1. One way to rename is use `git mv old_name.md new_name.md` , then **commit**. 
2. Another way is to `mv old_name.md new_name.md` `git add new_name.md` `git rm --cached old_name` , then **commit**. 
Obviously, former one is better. 
# Branch

1. A branch is **not** a 'real branch' with another set of `index` , `working tree` . 
2. A branch is simply a movable pointer to a commit. And each commit has a father commit node. 
3. When switching branch, `index` and `working tree` will be updated to the commit that the new branch points at. 
# Merge conflicts

## When will git tell a merge conflict? 

Let B, C be different version of a file in different branches; let A be their common ancestor. 
1. When B, C both modified the file **in the same line** compared to A. 
2. When B deleted something while C modified it. 
## How to fix a conflict note? 

1. Modify files with a conflict note. Usually override all the conflict notes with correct content. 
2. `add` the modified files. 
	1. Once you add all files with a conflict note, git will tell that 'all conflicts fixed'.==Even if you modified nothing before add==.
	2. When you add all conflict files, merging has **not** ben completed yet. 
3. `commit`. (Once you commit, the merging is completed. )
## What happens when merging? 

Consider 
```
. --- A --- C  #main
      |
        --- B  #feature/check
```
1. When `git switch main` , `git merge feature/chech` 
	1. B becomes new commit M's father commit. 
	2. **BUT** there is no changes in feature/check branch. 
```
. --- A --- C --- M  #main
      |        /
        --- B -
```
2. Then if `git switch feature/check` `git merge main` . 
	1. Because B is a former commit of `HEAD_main` , so there will be a fast-forward merge. 
	2. Then the two branches will be at a same start line. **But** they are still two different branches; **merging does not mean to delete any branches**. 

# What is `origin/main` ?

1. It is a tracker of your remote main branch on your local computer. 
2. Also called upstream of remote main. 

# `git fetch origin` & `git pull` ? 

1. `fetch` updates `orgin/main` , then `git merge origin/main` can create a new commit. 
2. `pull` is complex, I don't wanna talk about it. 
# Why `push` is rejected? 

1. Commits on remote main must be your father commit. 
2. If being rejected, you should `fetch` first, then `merge` . 
