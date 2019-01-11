title: 用户配置
---

## 权限模型
磨刀不误砍柴工，先理解权限模型，才能更好地进行用户配置。权限的角色分为**SUPER 超管**、**OWNER 所有者**、**MASTER 负责人**、**DEVELOPER 开发者**、**REPORTER 访客**，操作的资源包括空间、项目、上线单（任务）、环境、用户等

![permission](/docs/2/zh-cn/static/permission.png)

更详细的权限模型说明：[权限模型](https://walle-web.io/docs/2/permission.html)


## Super视角 - 空间owner分配
Super是个平台管理员，主要负责walle运维，空间分配。更多的操作交由空间自行管理，分配完空间，添加所有用户，使命就完成了。

![permission](/docs/2/zh-cn/static/space-super.png)
![permission](/docs/2/zh-cn/static/user-add-super.png)

## Owner视角 - 用户组配置
Owner是空间下最高的权限，空间下的一切资源均可管理，包括把自己的空间出卖。

![permission](/docs/2/zh-cn/static/space-owner.png)

空间的用户组在空间内全局有效，项目均继承此权限。看到这，是不是有点gitlab的味道？

![permission](/docs/2/zh-cn/static/user-add-owner.png)

## Owner视角 - 项目级的用户权限管理
默认所有项目的权限继承用户组，但你可能需要不同的leader负责不同的项目，这个时候你就需要在项目上做更精细化的用户权限配置。

![permission](/docs/2/zh-cn/static/project-user-icon.png)

比如把某个用户设置为某个项目的项目管理员，这样他就可以帮你审核上线单，以及项目的配置管理。是不是很贴心？

![permission](/docs/2/zh-cn/static/project-user-edit.png)
