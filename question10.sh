#!/bin/bash

# 作业1 问题10: 切换到主分支并合并branch1
# 1. 自动检测主分支名称（main或master）
# 2. 切换到主分支
# 3. 将名为branch1的分支合并到主分支中

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

echo "检测到主分支：$MAIN_BRANCH"

# 切换到主分支
git checkout $MAIN_BRANCH

# 合并branch1
git merge branch1

echo "已切换到 $MAIN_BRANCH 分支并合并branch1"
