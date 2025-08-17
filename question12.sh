#!/bin/bash

# 作业1 问题12: 切换回branch2并恢复暂存的更改
# 1. 切换回branch2
# 2. 恢复并提交未提交的更改

git checkout branch2
git stash pop
git add file4
git commit -m "恢复并提交暂存的更改"
echo "已切换回branch2并恢复暂存的更改"
