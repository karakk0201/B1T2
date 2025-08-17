#!/bin/bash

# 作业1 问题11: 创建分支、修改文件并暂存更改
# 1. 创建并切换到名为branch2的新分支
# 2. 创建并提交文件file4
# 3. 修改file4
# 4. 切换回main分支而不提交更改(采取适当的措施而不丢失数据)

git checkout -b branch2
echo "这是branch2中的file4内容" > file4
git add file4
git commit -m "在branch2中添加file4"
echo "修改后的file4内容" > file4
git add file4
git stash
# 检测主分支名称
MAIN_BRANCH=""
if git branch | grep -q "main"; then
    MAIN_BRANCH="main"
elif git branch | grep -q "master"; then
    MAIN_BRANCH="master"
else
    echo "错误：未找到主分支（main或master）"
    exit 1
fi

git checkout $MAIN_BRANCH
echo "branch2已创建，file4已修改并暂存，已切换回main分支"
