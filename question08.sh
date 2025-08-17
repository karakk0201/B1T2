#!/bin/bash

# 作业1 问题08: 创建目录并移动文本文件
# 1. 创建名为dir2的目录
# 2. 将所有文本文件(以.txt结尾的文件)从当前目录移动到dir2
# 3. 暂存并提交更改

mkdir -p dir2
mv *.txt dir2/ 2>/dev/null || echo "没有找到.txt文件或文件已在dir2中"
git add .
git commit -m "创建dir2目录并移动所有文本文件"
echo "dir2目录已创建，文本文件已移动并提交"
