#!/bin/bash

# 作业1 问题16: 合并分支并解决冲突
# 1. 合并branch3到branch2
# 2. 解决任何合并冲突
# 3. 删除branch3

# 检查branch3是否存在
if ! git branch | grep -q "branch3"; then
    if git branch -r | grep -q "origin/branch3"; then
        echo "发现远程分支 origin/branch3，正在创建本地分支..."
        git checkout -b branch3 origin/branch3
        echo "已创建本地branch3分支并跟踪远程分支"
    else
        echo "错误：branch3分支不存在"
        echo "可用的分支："
        git branch -a
        echo ""
        echo "请先创建branch3分支或检查分支名称"
        exit 1
    fi
fi

# 切换到branch2
git checkout branch2

# 尝试合并branch3
if git merge branch3; then
    # 合并成功，解决冲突（如果有）
    if git status | grep -q "both modified"; then
        echo "检测到合并冲突，需要手动解决..."
        echo "请手动编辑冲突文件，然后运行："
        echo "git add ."
        echo "git commit -m '解决合并冲突'"
        exit 1
    fi
    
    # 没有冲突，直接提交
    git add .
    git commit -m "合并branch3到branch2"
    
    # 删除branch3
    if git branch | grep -q "branch3"; then
        git branch -d branch3
        echo "已删除本地branch3分支"
    fi
    
    echo "✅ 已成功合并branch3到branch2并删除branch3"
else
    echo "❌ 合并失败"
    echo "请检查："
    echo "1. branch3分支是否存在"
    echo "2. 是否有未提交的更改"
    echo "3. 是否有合并冲突需要解决"
    exit 1
fi
