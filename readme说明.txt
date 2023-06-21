
	1、先安装 MySql5.6 数据库文件（mysql-installer-community-5.6.11.0.msi）

	2、再安装数据库管理工具（Navicat_Premium 注册码NAVN-U6QE-6PX7-44K5），如需正版，请自行购买

	3、使用数据库管理工具连接MySql5.6数据库，并新建一个名为 repast 的数据库

	4、对新建的repast数据库进行初始化备份还原操作，备份文件还原后的数据库密码为123488

	5、默认MySql5.6禁止远程登陆，因此要开启远程登陆，开启方法(可在Navicat_Premium中操作)：
	   GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'youpassword' WITH GRANT OPTION; 
	   FLUSH PRIVILEGES;

	6、运行文件夹 “repast(免安装)” 中的exe文件 “smosu.exe” 启动客户端

	7、在登陆窗口点击左下角的展开按扭，填写数据库地址(127.0.0.1)和端口(3306),并测试连接可用性

	8、输入账号“root” 密码“123488”即可登陆系统


	说明：
	本系统支持热敏打印机出账单和菜品单，需先配置热敏打印机的IP地址。
	本系统支持M1会员卡的管理，可发行IC卡。
	更多技术支持请联系：132 6060 7328 系统已开源，有问必答。
	

