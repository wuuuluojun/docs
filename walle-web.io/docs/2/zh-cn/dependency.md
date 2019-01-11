title: 依赖
---
## 开箱即食
walle 2.0 相比 [walle-v1.x](https://walle-web.io/docs/1) 安装更为方便，堪称**开箱即食**！

## 安装前了解
* Linux + Bash(git、ssh)
    * 意味着不支持win，也不要装在mac，兼容性问题
* Python 3.5+ 和 Python 2.7+
* ** MySQL 5.6.5以上**，否则会在安装时报错
  - 在MySQL 5.6.5版本之前，Automatic Initialization and Updating只适用于TIMESTAMP，而且一张表中，最多允许一个TIMESTAMP字段采用该特性。从MySQL 5.6.5开始，Automatic Initialization and Updating同时适用于TIMESTAMP和DATETIME，且不限制数量。
* 将所有*目标主机* 加入 *宿主机*(walle安装所在机器)[ssh免密登录配置](http://walle-web.io/docs/troubleshooting.html)

## 有些前置的基础包可以装下

以下是基于`CentOS 7.6.1810`安装，感谢[warmwinter](https://github.com/warmwinter)issue/pr提供。如果有什么问题找他：）

- 更换阿里云源
```shell
cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo 
yum clean all  
yum makecache
```

- 安装EPEL源 RHEL/CentOS 7
```shell
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
```

- 安装的系统自身的mariaDB(未验证)
```shell
yum install -y mariadb-devel gcc gcc-c++ python-devel
```

- 安装的MySQL
```shell
yum install -y mysql-devel gcc gcc-c++ python-devel MySQL-python
```
