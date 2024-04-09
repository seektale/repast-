
双击 run.bat 即可运行程序，如果缺少JDK或JRE会自动下载到当前目录下；网络中只需有一台电脑启用数据库即可。

重置密码请将 conf/repast.properties 文件中参数设置为 RootPasswordReset=Y
重置登陆界面二维码请将 conf/repast.properties 文件中参数设置为 apkurl=你的的文本
运行环境下载地址(请解压后放在当前目录即可,也可从其它地方下载)：https://mirrors.sdwu.edu.cn/java/jre-8u202-windows-i586.tar.gz
为什么要在32位jvm下运行：因为需兼容热敏打印机串口打印和明华卡管理，如无这两项需求，可以改64位jvm运行。

安卓手机可以安装 help\repast.apk 版本要求Andorid7.0.0及以上，开发环境Android Studio 3.0.1

dblocal_raw.zip	初始化数据库，root密码123456
dblocal.zip	初始化数据库(含repast)，root密码123456

/*---------------------------------------------------------------------------------*/

 一、明华卡文件（JNative只支持32位的JDK, 64位的系统需要安装32位的JDK来使用JNative, 否则或报错：JNative library not loaded, sorry）
      JNative.jar(自带JNativeCpp.dll)   JNativeCpp.dll   mwrf32.dll

 二、热敏打印机串口文件
      comm.jar   win32com.dll   javax.comm.properties(必须有)

 三、语音播报
      jacob-1.18.jar   jacob-1.18-x64.dll(64位)   jacob-1.18-x86.dll(32位)

 讯飞需要 Msc.jar, json-jena-1.0.jar, msc32.dll 三个文件，已废弃，因为window自带语音播报功能。
 dll文件会自动复制到  C:\Windows\System32 或 jre\bin，但需要有对应权限。

/*---------------------------------------------------------------------------------*/

  JNative.jar 文件的引入用 %javahome%\jre7\lib\e 方式时
  测试表明，dll文件不存在时不报错。

  comm.jar 文件的引入用 %javahome%\jre7\lib\e 方式时
  测试表明，当comm.jar相关联的dll文件不存在时，对应串口打印线程会永远等待，占用资源，也不报错。

  串口打印参考旧版本
  comm.jar拷贝到		      	c:\Program Files\Java\jdk1.6.0_23\jre\lib\ext
  javax.comm.properties拷贝到  		c:\Program Files\Java\jdk1.6.0_23\jre\lib
  win32comm.dll拷贝到           		c:\Program Files\Java\jdk1.6.0_23\bin

/*---------------------------------------------------------------------------------*/

 本程序开发时断断续续长达10年有余，因技术变迁，维护时间成本高，市场未能开展，遂进行开源。
 如需技术支持，免费响应，请发邮件至：help@dmumu.com

