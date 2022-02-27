#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请在Root用户下运行安装该脚本" && exit 1

cmd="apt-get"
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo "这个安装脚本不支持你的系统" && exit 1
fi


install(){    
    if [ -d "/root/x_miner_proxy" ]; then
        echo -e "检测到您已安装XMinerProxy，请勿重复安装，如您确认您未安装请使用rm -rf /root/x_miner_proxy指令" && exit 1
    fi
    if screen -list | grep -q "x_miner_proxy"; then
        echo -e "检测到您的XMinerProxy已启动，请勿重复安装" && exit 1
    fi

    $cmd update -y
    $cmd install wget screen -y
    
    mkdir /root/x_miner_proxy
    wget https://raw.githubusercontent.com/XMinerProxy/XMinerProxy/main/scripts/run.sh -O /root/x_miner_proxy/run.sh
    chmod 777 /root/x_miner_proxy/run.sh
    wget https://raw.githubusercontent.com/XMinerProxy/XMinerProxy/main/others/server.key -O /root/x_miner_proxy/server.key
    wget https://raw.githubusercontent.com/XMinerProxy/XMinerProxy/main/others/server.pem -O /root/x_miner_proxy/server.pem
    
    wget https://github.com/XMinerProxy/XMinerProxy/releases/download/1.0.4/XMinerProxy_v1.0.4_linux_amd64.tar.gz -O /root/XMinerProxy_v1.0.4_linux_amd64.tar.gz
    tar -zxvf /root/XMinerProxy_v1.0.4_linux_amd64.tar.gz -C /root/x_miner_proxy
    chmod 777 /root/x_miner_proxy/XMinerProxy

    screen -dmS x_miner_proxy
    sleep 0.2s
    screen -r x_miner_proxy -p 0 -X stuff "cd /root/x_miner_proxy"
    screen -r x_miner_proxy -p 0 -X stuff $'\n'
    screen -r x_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r x_miner_proxy -p 0 -X stuff $'\n'

    sleep 2s
    echo "XMinerProxy V1.0.4已经安装到/root/x_miner_proxy"
    cat /root/x_miner_proxy/pwd.txt
    echo ""
    echo "您可以使用指令screen -r x_miner_proxy查看程式端口和密码"
}


uninstall(){
    read -p "您确认您是否删除XMinerProxy)[yes/no]：" flag
    if [ -z $flag ];then
         echo "您未正确输入" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ];then
            screen -X -S x_miner_proxy quit
            rm -rf /root/x_miner_proxy
            echo "XMinerProxy已成功从您的伺服器上卸载"
        fi
    fi
}


update(){
    wget https://github.com/XMinerProxy/XMinerProxy/releases/download/1.0.4/XMinerProxy_v1.0.4_linux_amd64.tar.gz -O /root/XMinerProxy_v1.0.4_linux_amd64.tar.gz

    if screen -list | grep -q "x_miner_proxy"; then
        screen -X -S x_miner_proxy quit
    fi
    rm -rf /root/x_miner_proxy/XMinerProxy

    tar -zxvf /root/XMinerProxy_v1.0.4_linux_amd64.tar.gz -C /root/x_miner_proxy
    chmod 777 /root/x_miner_proxy/XMinerProxy

    screen -dmS x_miner_proxy
    sleep 0.2s
    screen -r x_miner_proxy -p 0 -X stuff "cd /root/x_miner_proxy"
    screen -r x_miner_proxy -p 0 -X stuff $'\n'
    screen -r x_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r x_miner_proxy -p 0 -X stuff $'\n'

    sleep 2s
    echo "XMinerProxy 已经更新至V1.0.4版本并启动"
    cat /root/x_miner_proxy/pwd.txt
    echo ""
    echo "您可以使用指令screen -r x_miner_proxy查看程式输出"
}


start(){
    if screen -list | grep -q "x_miner_proxy"; then
        echo -e "检测到您的XMinerProxy已启动，请勿重复启动" && exit 1
    fi
    
    screen -dmS x_miner_proxy
    sleep 0.2s
    screen -r x_miner_proxy -p 0 -X stuff "cd /root/x_miner_proxy"
    screen -r x_miner_proxy -p 0 -X stuff $'\n'
    screen -r x_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r x_miner_proxy -p 0 -X stuff $'\n'
    
    echo "XMinerProxy已启动"
    echo "您可以使用指令screen -r x_miner_proxy查看程式输出"
}


restart(){
    if screen -list | grep -q "x_miner_proxy"; then
        screen -X -S x_miner_proxy quit
    fi
    
    screen -dmS x_miner_proxy
    sleep 0.2s
    screen -r x_miner_proxy -p 0 -X stuff "cd /root/x_miner_proxy"
    screen -r x_miner_proxy -p 0 -X stuff $'\n'
    screen -r x_miner_proxy -p 0 -X stuff "./run.sh"
    screen -r x_miner_proxy -p 0 -X stuff $'\n'

    echo "XMinerProxy 已经重新启动"
    echo "您可以使用指令screen -r x_miner_proxy查看程式输出"
}


stop(){
    screen -X -S x_miner_proxy quit
    echo "XMinerProxy 已停止"
}


change_limit(){
    change_flag="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 100000" >>/etc/security/limits.conf
        change_flag="y"
    fi

    if [[ "$change_flag" = "y" ]]; then
        echo "系统连接数限制已修改，手动重启下系统即可生效"
    else
        echo -n "您的系统连接数限制可能已修改，当前连接限制："
        ulimit -n
    fi
}


check_limit(){
    echo -n "您的系统当前连接限制："
    ulimit -n
}


echo "======================================================="
echo "XMinerProxy 一键脚本，脚本默认安装到/root/x_miner_proxy"
echo "                                   脚本版本：V1.0.4"
echo "  1、安  装"
echo "  2、卸  载"
echo "  3、更  新"
echo "  4、启  动"
echo "  5、重  启"
echo "  6、停  止"
echo "  7、一键解除Linux连接数限制(需手动重启系统生效)"
echo "  8、查看当前系统连接数限制"
echo "======================================================="
read -p "$(echo -e "请选择[1-8]：")" choose
case $choose in
    1)
        install
        ;;
    2)
        uninstall
        ;;
    3)
        update
        ;;
    4)
        start
        ;;
    5)
        restart
        ;;
    6)
        stop
        ;;
    7)
        change_limit
        ;;
    8)
        check_limit
        ;;
    *)
        echo "请输入正确的数字！"
        ;;
esac