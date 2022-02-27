#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请在Root用户下运行安装该脚本" && exit 1
while true
do
    ./XMinerProxy
done