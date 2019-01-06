title: 部署出错
---

walle运行过程，以及部署过程出错了，具体日志可以查看`logs/runtime.log`，别说你在启动walle的时候没注意到？

## git clone error
Initialized empty Git repository in /tmp/walle/codebase/17/.git/
 error: while accessing https://github.com/meolu/java-deploy.git/info/refs

fatal: HTTP request failed

解决办法
 ```
 yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel asciidoc
 yum install -y gcc
 ```

## mvn command not found
`/bin/bash: mvn: command not found`

原因分析：如果是在宿主机里使用`mvn`编译，是因为没有把环境变量初始化，也就是大家常配置在`/etc/profile`里的`JAVA_HOME`、`M2_HOME`、`PATH`，最简单的方式就是初始化下。

一般用户登录Linux，会初始化`~/.bashrc`，`~/.bashrc`又会先初始化`/etc/bashrc`

```
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
```

解决方法：增加一行初始化`/etc/profile`即可。

```
if [ -f /etc/bashrc ]; then
  # 增加一行初始化
	. /etc/profile
	. /etc/bashrc
fi
```


## /etc/bashrc: line 65: id: command not found
```
/etc/bashrc: line 65: id: command not found
/etc/bashrc: line 65: id: command not found
/home/work/.bashrc: line 7: tput: command not found
/home/work/.bashrc: line 7: tput: command not found
/home/work/.bashrc: line 7: tput: command not found
/home/work/.bashrc: line 7: tput: command not found
```

原因分析：`/etc/profile` 下配置环境变量`PATH`出现了问题，自己找台一样的机器，把`PATH`路径修复下即可。


如果你有其它错误，请点右上角的**改进文本**


<br><br><br>
