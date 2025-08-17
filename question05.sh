#!/bin/bash

# 作业1 问题05: 创建目录和文件并暂存
# 1. 在当前存储库中创建一个dir1目录，包含文件file2
# 2. 暂存(但不提交) dir1目录及其所有内容

mkdir -p dir1
echo "这是dir1/file2的内容" > dir1/file2
git add dir1/
echo "dir1目录及其内容已暂存"
