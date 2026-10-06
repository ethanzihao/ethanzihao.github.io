---
title: Use Anaconda to Create a Virtual Environment
date: 2026-10-06 12:24:00 +0800
category: Notes
tags: [anaconda, conda, virtual environment]
description: Basic commands to create a virtual environment. 
lang: en
---

# How to create a python environment

```zsh
conda create --name <environment_name> python=3.12 (pip)
```
# Switch environment

```zsh
conda activate <environment_name>
```
```zsh
conda deactivate
```
# Run code

```zsh
conda run --name <envirnment_name> python <file_path>
```
# Install

```zsh
conda install <package_name>
conda --name <environment_name> <package_name>
```
**Always** use `conda install` instead of `pip install` ! 
When u have to use `pip` , use
```zsh
python -m pip install <package_name>
```
# Remove whole environment

```zsh
conda deactivate    #deactivate first! 
conda env remove --name <environment_name>
```
# Check environment list

```zsh
conda env list
```