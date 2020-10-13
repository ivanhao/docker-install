#!/bin/bash

echo "Start install? (y/n)"
read x
case "$x" in
    y | Y )
        apt update

        curl -sSL https://get.docker.com/ | sh

        if [ `cat /etc/fstab |grep cgroup |wc -l` = 0 ];then
            echo "none             /sys/fs/cgroup  cgroup  defaults          0       0 " >> /etc/fstab
            echo "Install complete,need reboot.(y/n)"
            read x
            if [ $x = 'y' ];then
                reboot
            else
                echo "you may reboot manually."
            fi
        fi
        ;;
    * )
        echo "you choose quit."
        exit
esac

