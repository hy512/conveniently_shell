#!/bin/bash

# 命令执行的目录
baseDir=`pwd`;
# 脚本目录, 也就是 init.sh 所在目录
shellDir=`cd $(dirname $0); pwd`;
# 传递的脚本参数设置为数组
args=($@)

source "${shellDir}/base/bootstrap.sh"
source "${shellDir}/centos/bootstrap.sh"
