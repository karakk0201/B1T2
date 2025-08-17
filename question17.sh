#!/bin/bash

# 作业1 问题17: 创建分支并配置文件结构
# 创建分支branch1，branch2，然后添加、移动、删除和修改文件以匹配配置
# 注意：不包含克隆命令，因为题目要求排除克隆命令

echo "开始执行问题17..."

# 确保在正确的目录中（应该是git-practice-03目录）
if [ -d "git-practice-03" ]; then
    echo "检测到git-practice-03目录，切换到该目录"
    cd git-practice-03
fi

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

echo "1. 创建branch1分支并配置..."

# 创建branch1
git checkout -b branch1

# 配置branch1的文件结构：
# 从main分支开始，需要：
# - 删除dir1/dir2目录，将foo移动到dir1/
# - 删除dir3/bar_copy，保留dir3/bar
# - 添加newfile1

# 先移动foo文件到dir1/
if [ -f "dir1/dir2/foo" ]; then
    mv dir1/dir2/foo dir1/foo
fi

# 删除dir2目录
rm -rf dir1/dir2

# 删除bar_copy文件
rm -f dir3/bar_copy

# 添加newfile1
echo "newfile1内容" > newfile1

git add .
git commit -m "配置branch1：删除dir2，移动foo，删除bar_copy，添加newfile1"

echo "2. 创建branch2分支并配置..."

# 切换回主分支创建branch2
git checkout $MAIN_BRANCH
git checkout -b branch2

# 配置branch2的文件结构：
# 从main分支开始，需要：
# - 保持dir1/dir2/foo，但重命名为foo_modified
# - 创建dir1/dir3/并添加newfile2
# - 删除整个dir3目录

# 重命名foo为foo_modified
if [ -f "dir1/dir2/foo" ]; then
    mv dir1/dir2/foo dir1/dir2/foo_modified
fi

# 创建dir1/dir3目录并添加newfile2
mkdir -p dir1/dir3
echo "newfile2内容" > dir1/dir3/newfile2

# 删除整个dir3目录
rm -rf dir3

git add .
git commit -m "配置branch2：重命名foo为foo_modified，添加newfile2，删除dir3"

echo "3. 验证配置..."

# 显示各分支的文件结构
echo ""
echo "主分支 ($MAIN_BRANCH) 文件结构："
git checkout $MAIN_BRANCH
find . -type f -not -path "./.git/*" | sort

echo ""
echo "branch1文件结构："
git checkout branch1
find . -type f -not -path "./.git/*" | sort

echo ""
echo "branch2文件结构："
git checkout branch2
find . -type f -not -path "./.git/*" | sort

echo ""
echo "✅ branch1和branch2已创建并配置完成"
