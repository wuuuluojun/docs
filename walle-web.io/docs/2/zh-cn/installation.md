title: 安装
---
## 0.安全
务必部署在内网！  
务必部署在内网！  
务必部署在内网！  

## 1.请给此项目标个星star
克隆项目前，请到github给此项目标个星star，不吝支持我们。

反过来正是你的微不足道的支持，让我们坚持免费开源做下去，反馈于你，感谢你的信任。

## 2.Clone code
```
git clone https://github.com/meolu/walle-web.git
```

## 3.Nginx config
别忘了要重启nginx，注意标出可能需要改的地方
```
upstream webservers {
    server 0.0.0.0:5000 weight=1; #域名设置
}

server {
    listen       80;
    server_name  admin.walle-web.io; # 域名设置
    access_log   /usr/local/nginx/logs/walle.log main;
    index index.html index.htm; # 日志目录

    location / {
        try_files $uri $uri/ /index.html;
        add_header access-control-allow-origin *;
        root /walle-web/fe; # 前端代码已集成到walle-web，即walle-web/fe的绝对路径
    }

    location ^~ /api/ {
        add_header access-control-allow-origin *;
        proxy_pass      http://webservers;
        proxy_set_header X-Forwarded-Host $host:$server_port;
        proxy_set_header  X-Real-IP  $remote_addr;
        proxy_set_header    Origin        $host:$server_port;
        proxy_set_header    Referer       $host:$server_port;
    }

    location ^~ /socket.io/ {
        add_header access-control-allow-origin *;
        proxy_pass      http://webservers;
        proxy_set_header X-Forwarded-Host $host:$server_port;
        proxy_set_header  X-Real-IP  $remote_addr;
        proxy_set_header    Origin        $host:$server_port;
        proxy_set_header    Referer       $host:$server_port;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;

        # WebScoket Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```

## 4.Hosts
```
vi /etc/hosts

# 新增一行
127.0.0.1  admin.walle-web.io # 与nginx配置一致
```

## 5.Install
安装**Python 2.7** + `pip`。
```
chmod +x admin.sh
./admin.sh init

# 注意：安装mysqlclient失败，需要先安装libmysqlclient-dev(ubuntu)
# 注意:安装失败请指定python路径. mac 可能会有用anaconda的python，找到自己系统的python 2.7追加参数指定 -p /usr/bin/python2.7 即可
vi admin.sh +20
virtualenv --no-site-packages -p /usr/local/bin/python2.7 venv
```

## 6.Config setting
带 **@TODO** 就是可能要修改的地方
```
vi walle/config/settings_prod.py
```

## 7 本地SSH免密码登录
```
# 准备启动walle的用户 A
# walle/config/settings_prod.py LOCAL_SERVER_USER B
# 配置 A => B 免密码登录

# if A == B
[A@127.0.0.1] cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# else
[A@127.0.0.1] cat ~/.ssh/id_rsa.pub  # 复制
[B@127.0.0.1] vi ~/.ssh/authorized_keys # 粘贴

```
更多免密码登录配置方法：[SSH 免密码登录](http://walle-web.io/docs/2/troubleshooting.html#Authentication-failed)


## 8.Data Migration
8.1创建一个数据库 walle
```
mysql  -hxx -uxx -p -e'CREATE SCHEMA walle'
```
8.2Data Migration
```
./admin.sh migration
```

## 9.Start
9.1 启动
```
./admin.sh start
```
9.2 重启、升级、Migration
```
./admin.sh restart # 重启
./admin.sh upgrade # 升级
./admin.sh migration # Migration
```


## 10.开启walle 2.0之旅
恭喜你，大功告成！浏览器打开`http://admin.walle-web.io`（因nginx配置域名而定）。登录账号如下，开启你的walle 2.0之旅吧：）
```
超管：super@walle-web.io Walle123
所有者：owner@walle-web.io Walle123
负责人：master@walle-web.io Walle123
开发者：developer@walle-web.io Walle123
访客：reporter@walle-web.io Walle123
```
