#!/bin/bash
webServer() {
    echo "======================================"
	echo "请选择需要执行的apache命令选项"
	echo "0. 开启apache "
	echo "1. 重启apache"
	echo "2. 关闭apache"
	echo "3. 部署目录或者文件到apache根目录"
	echo "======================================"
	
	read -p "输入选项编号：" number
	case $number in 
		0) startApache	
		;;
			
		1) restartApache	
		;;
		
		2) stopApache	
		;;

		3) movePathToApache	
		;;

	esac	
 }
#开启
startApache (){
	sudo /usr/sbin/apachectl start
}
#重启
restartApache (){
	sudo /usr/sbin/apachectl restart
}
#停止
stopApache (){
	sudo /usr/sbin/apachectl stop
}

#部署
movePathToApache (){
	read -p "输入需要部署的项目路径: " root_proj_dir
	webServer_dir="/Library/WebServer/Documents" 
	sudo cp -R ${root_proj_dir} ${webServer_dir}
	echo "已部署至127.0.0.1目录下"
	open /Library/WebServer/Documents
}

####################################################
webServer
