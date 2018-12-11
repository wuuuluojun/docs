title: 安装错误
---

## Python / Pip
如果是Python或Pip环境安装有问题，请自行百度/google解决。其它问题严格对照手册，一步步来应该不会出现问题


## Can`t connet to local MYSQL server through socket
执行`sh admin.sh migration` 后，提示Can`t connet to local MYSQL server through socket "/var/lib/mysql/mysql.sock"，可将mysql.sock做一个软连接，比如mysql.sock文件在/usr/local/mysql/mysqld.sock，则执行ln -s /usr/local/mysqld.sock /var/lib/mysql/mysql.sock 即可

## mysqlclient install failed
执行`sh admin.sh migration`，其中在安装mysqlclient包时，`pip install -r requirements/prod.txt`<kbd>后提示mysqlclient安装失败</kbd>

解决：CENTOS下安装执行 yum install mysql-devel 即可

## OSError: Command  setuptools failed
```OSError: Command venv/bin/python - setuptools pip wheel failed with error code 1
```
mac 可能会有用anaconda的python，这个版本的python不支持virtualenv，[issue](https://github.com/pypa/virtualenv/issues/788)

解决办法：安装失败在 `admin.sh` > `init` 方法 > `-p`参数 指定python路径：
`virtualenv --no-site-packages -p /usr/local/bin/python2.7 venv`

## 其它问题
- [提Issue](https://github.com/meolu/walle-web/issues/new/choose)
- 加微信群，互帮互助
![](/docs/2/zh-cn/static/group-wechat.jpg)
