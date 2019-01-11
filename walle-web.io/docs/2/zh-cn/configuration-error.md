title: 检测错误
---

## 远程目标机器免密码登录失败
> 原因：
远程目标机器：172.16.0.231 错误：Authentication failed.

解决建议：
在宿主机中配置免密码登录，把宿主机用户work的~/.ssh/ssh_rsa.pub添加到远程目标机器用户172.16.0.231的~/.ssh/authorized_keys。了解更多：http://walle-web.io/docs/troubleshooting.html
