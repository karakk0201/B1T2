#!/bin/bash

# 作业1 问题13: 创建新分支并清理文件
# 1. 在提交存储库中为这项作业创建一个新分支
# 2. 从该分支中删除.sh其他问题的所有文件
# 3. 创建、添加并提交file13.txt
# 4. 将新分支推送到GitHub

# 创建新分支（使用时间戳确保唯一性）
BRANCH_NAME="assignment1_$(date +%Y%m%d_%H%M%S)"
echo "创建新分支: $BRANCH_NAME"

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

# 确保在正确的仓库中
if [ ! -d ".git" ]; then
    echo "错误：当前目录不是Git仓库"
    exit 1
fi

# 切换到主分支并创建新分支
git checkout $MAIN_BRANCH
git checkout -b $BRANCH_NAME

# 删除所有.sh文件（其他问题的脚本文件）
echo "删除所有.sh文件..."
find . -name "*.sh" -type f -delete

# 创建file13.txt
echo "这是作业1问题13的file13.txt内容" > file13.txt

# 添加并提交file13.txt
git add file13.txt
git commit -m "Add file13.txt to $BRANCH_NAME branch"

# 推送到GitHub
echo "推送到GitHub..."
if git push -u origin $BRANCH_NAME; then
    echo "分支 $BRANCH_NAME 已成功推送到GitHub"
else
    echo "警告：推送到GitHub失败，但分支已创建并提交"
    echo "请检查网络连接和GitHub权限"
fi

echo "问题13完成：分支 $BRANCH_NAME 已创建并包含file13.txt"
