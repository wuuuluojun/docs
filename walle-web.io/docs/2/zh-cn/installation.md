title: 安装
---

## 1.给此项目标个星star
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
    server dev.admin.walle-web.io:5000 weight=1; #域名设置
}

server {
    listen       80;
    server_name  api.walle-web.io dev.admin.walle-web.io; # 域名设置
    access_log   /usr/local/nginx/logs/walle.log main;
    index index.html index.htm; # 日志目录

    location / {
        try_files $uri $uri/ /index.html;
        add_header access-control-allow-origin *;
        root /walle-web/fe; # 前端代码
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

# add one line
127.0.0.1  dev.admin.walle-web.io # 与nginx配置一致
```

## 5.Config environment
安装**Python 2.7** + `pip`。``{PROJECT}`` 默认指项目。
```
pip install virtualenv

cd {PROJECT}
virtualenv venv
source venv/bin/activate
pip install -r requirements/prod.txt
```

## 6.Config code
You will know to change what to suit for you environment
```
vi walle/config/settings_prod.py
```

## 7.Data Migration
7.1创建一个数据库 walle
```
mysql  -hxx -uxx -p -e'CREATE SCHEMA walle'
```
7.2Data Migration
```
export FLASK_APP=waller.py
flask db upgrade
```

## 8.Start
```
sh admin.sh start  # start with debug mode
```


## 9.开启walle 2.0之旅
浏览器打开`http://admin.walle-web.io`（因nginx配置域名而定）


## 10.账号
超管：super@walle-web.io Walle123
所有者：owner@walle-web.io Walle123
负责人：master@walle-web.io Walle123
开发者：developer@walle-web.io Walle123
访客：reporter@walle-web.io Walle123
