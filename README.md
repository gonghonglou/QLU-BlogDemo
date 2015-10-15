# QLU  模拟的一款校园app

说明：因项目中的课程表，一卡通余额，图书馆，展示的内容是从服务器中获取的，而其他内容是从工程中的本地获取的

故：工程下载至本地后，请在本地服务器中新建名为“qlu”的文件夹，并在该文件夹中添加QLU工程中的Course.plist,Borrow.plist,Query.plist文件，另外请添加money.txt文件（内容随意，例：86.55，将展示为一卡通余额）到服务器中的qlu文件夹中   

###用到的第三方库：   
* 网络连接采用AFNetworking   
* 图片下载采用SDWebImage   
* 刷新采用MJRefresh   
* 还用到MBProgressHUD 

##app部分截图

* 课程表--CollectionView
* 查找书籍--手写cell，计算行高-MVC模式
* 我的借阅--采用xib-MVC模式
* 成绩查询--xib-MVC   

![](http://7xn9bi.com1.z0.glb.clouddn.com/app.png)    

* 我--修改密码，退出登录等   

![](http://7xn9bi.com1.z0.glb.clouddn.com/MineViewController.png)

###有兴趣的话欢迎关注我的微博：[期兮夕张](http://www.weibo.com/3126314295/profile?rightmod=1&wvr=6&mod=personinfo)

