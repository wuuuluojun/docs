title: Docker安装
---
## 鸣谢
此篇由[夜行书生](https://github.com/owen-carter)贡献，为社区提供了 Docker 版本。人人为我，我为人人！而且极其注重细节，甚至细腻到中英文之间空格的控制。

## About Docker
Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。


## Install Docker
> 参考：https://docs.docker.com/install/linux/docker-ce


- Centos
> [https://docs.docker.com/install/linux/docker-ce/centos](https://docs.docker.com/install/linux/docker-ce/centos)
```bash
sudo yum install -y yum-utils  device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
sudo systemctl enable docker
sudo systemctl start docker
```


- Ubuntu
> 参考：[https://docs.docker.com/install/linux/docker-ce/ubuntu/](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
```bash
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update   
sudo apt-get install docker-ce


```

- Mac

[https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-for-mac](https://docs.docker.com/docker-for-mac/install/#install-and-run-docker-for-mac)


- Windows

[https://docs.docker.com/docker-for-windows/install/#start-docker-for-windows](https://docs.docker.com/docker-for-windows/install/#start-docker-for-windows)

## Install docker-compose
> 参考：https://docs.docker.com/compose/overview/
- about docker-compose
docker-compose是Docker的服务编排工具，主要用来构建基于Docker的复杂应用，
docker-compose通过一个配置文件来管理多个Docker容器，非常适合组合使用多个容器进行部署的场景


- install docker-compose
```bash
pip install docker-compose -i https://mirrors.aliyun.com/pypi/simple/
```


### Prepare Before Deploy
> 修改配置文件
```python

# walle/config/settings_prod.py:17
class ProdConfig(Config):
    """Production configuration."""

    # .....
    # .....

    # todo 数据库设置
    SQLALCHEMY_DATABASE_URI = 'mysql://user:password@localhost/walle'

```
```yaml
version: "3.6"

services:

  mysql:
    image: mysql:5.7
    ports:
      - 0.0.0.0:3306:3306
    expose:
      - 3306
    environment:
      # todo 数据库root密码，这个如果需要修改，需要和 walle/config/settings_prod.py 中数据库密码保持一致
      MYSQL_ROOT_PASSWORD: walle
      MYSQL_DATABASE: walle
    volumes:
      - ${HOME}/.walle/mysql:/var/lib/mysql
    restart: always

  web:
    build: ./
    links:
      - mysql
    expose:
      - 5000
    environment:
      - WALLE_SECRET="guess me out"
    restart: always

  gateway:
    image: nginx
    links:
      - mysql
      - web
    ports:
      - 0.0.0.0:80:80
    volumes:
      - ./fe/:/data/web/:ro
      - ./gateway/nginx/default.conf:/etc/nginx/conf.d/default.conf:ro
    restart: always

```

### Start
> 万事俱备，只欠东风

- 一键启动（快速体验）
```bash
docker-compose build && docker-compose up -d && docker-compose logs -f
```


- 常用操作
```bash
# 构建服务
docker-compose build
# 启动服务,启动过程中可以直接查看终端日志，观察启动是否成功
docker-compsoe up
# 启动服务在后台，如果确认部署成功，则可以使用此命令，将应用跑在后台，作用类似 nohup python waller.py &
docker-compose up -d
# 查看日志,效果类似 tail -f waller.log
docker-compose logs -f
# 停止服务,会停止服务的运行，但是不会删除服务所所依附的网络，以及存储等
docker-compsoe stop
# 删除服务，并删除服务产生的网络，存储等，并且会关闭服务的守护
docker-compose down
```
