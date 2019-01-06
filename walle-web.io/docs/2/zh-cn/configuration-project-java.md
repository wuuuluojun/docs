title: Java Tomcat Demo配置
---

简单写了个 Java MVC + Tomcat Demo 和 SpringBoot Demo 配置，小demo仅仅是用来测试的，各家还得根据自己公司的调调来配置。

![permission](/docs/2/zh-cn/static/project_java_tomcat.png)

## 高级任务-Deploy前置任务
在宿主机未检出代码前的前置任务，常为安装依赖、配置环境变量等

## 高级任务-Deploy后置任务
```
# 打包编译
${MVN_HOME}/bin/mvn clean package -Dmaven.test.skip=true
cp target/walle-web.war .
```

## 高级任务-Release前置任务
```
# 停服
${TOMCAT_HOME}/bin/shutdown.sh
```

## 高级任务-Release后置任务
```
# tomcat 更新服务
cp ${WEBROOT}/walle-web.war ${TOMCAT_HOME}/webapps/
# 服务启动
${TOMCAT_HOME}/bin/startup.sh
```


![permission](/docs/2/zh-cn/static/project_java_springboot.png)

SpringBoot的部署的方式有多种，有`java -jar xx.jar`，也有配置Tomcat部署方式，结合热部署、配置中心，以及ansible等方案。

欢迎各位提issue交流，我看能不能对各位方案做针对性做`Java`统一模板。
