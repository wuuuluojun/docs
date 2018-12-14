title: Docker安装
---

## About Docker
Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。


## Install Docker
> 参考：https://docs.docker.com/install/linux/docker-ce


- Centos
> https://docs.docker.com/install/linux/docker-ce/centos
```bash
sudo yum install -y yum-utils  device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce -y
sudo systemctl enable docker
sudo systemctl start docker
```


- Ubuntu
```bash

```


- Mac
```bash

```


- Windows
```bash

```

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
