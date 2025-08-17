#!/bin/bash

# 作业1 问题14: 从远程服务器检索update1分支并切换到它
# 从远程服务器检索update1分支并切换到它

git fetch origin
git checkout update1
echo "已从远程服务器检索update1分支并切换到它"
