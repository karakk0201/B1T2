#!/bin/bash

# 作业1 问题09: 创建分支并添加文件
# 1. 在当前存储库中创建一个名为branch1的分支
# 2. 切换到该分支
# 3. 在新分支中创建一个名为file3的新文件
# 4. 暂存并提交file3到branch1

git checkout -b branch1
echo "这是branch1中的file3内容" > file3
git add file3
git commit -m "在branch1中添加file3"
echo "branch1分支已创建，file3已添加并提交"
