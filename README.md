# C--Teach-assistant
C语言辅助教学平台，含在线编译运行，编译结果和运行结果显示，支持交互，课程、题库、考试管理，记录保存（请自行下载在线编辑器codemirror-5.39.0，该项目暂时交给其他人去做了，最近有事，以后会更新更好的版本）

https://hust-cqq.oss-cn-shenzhen.aliyuncs.com/C%E8%AF%AD%E8%A8%80%E8%AF%84%E5%88%A4%E7%B3%BB%E7%BB%9F_v1.0%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.docx
# C语言助教平台雏形
# 1.	目标功能
1.在线编译运行C语言代码（完成）

2.编译信息保存与显示，标准输入输出重定向到文件测试用例（完成）

3.提交记录保存于显示（完成）

4.自动评判作业是否通过（未完成）

# 2.	环境与配置
1.前端：HTML5+CSS3+JQuery（可下载Hbuilder加快h5开发）

2.后台：java EE(jsp+servlet)（Eclipse开发），请自行安装jdk和配置环境变量

3.服务器：Tomcat9.0，下载和配置环境变量

4.数据库：Mysql+数据库驱动程序，注意：数据库驱动程序要么放在Tomcat的lib文件夹下面，要么放在对应webapps的lib下面，最好将驱动程序添加至path环境变量

5.下载gcc编译器并配置环境变量，当前支持Windows操作系统（机房服务器是Windows），后台通过cmd/gcc编译运行

# 3.	代码图文说明（可忽略丑陋的UI，可参考文档）
https://hust-cqq.oss-cn-shenzhen.aliyuncs.com/C%E8%AF%AD%E8%A8%80%E8%AF%84%E5%88%A4%E7%B3%BB%E7%BB%9F_v1.0%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.docx

1.	登录页面

Index.html+index.css+index.js

register.html+register.js
 

2．用户页面
功能：

1.	显示个人信息

2.	添加课程并显示课程信息和考试信息

home.jsp/program.html

home.css/codeedit.css
 
3.答题页面do.jsp
 
3．后台页面
       
# 4.	后台代码说明

导入eclipse后可看到三个包

1.	com.servlet下面的所有类用于接收前台的post请求，即servlet类

2.	upload.program是servlet类的具体实现，可通过类名一一对应

3.	sandbox.security是安全管理器，暂时没有用，可忽略

添加课程：AddClassServlet.java+AddClass.java

管理员登录：AdminLogin.java+LoginProgram.java

用户登录：UserLogin.java+ LoginProgram.java

用户注册：Register.java+RegisterProgram.java

管理员信息管理：BackAdminSet.java+AdminSet.java,删除，添加和修改权限

课程信息管理：BackCourseSet.java+CourseSet.java,添加课程和发布考试

考试管理：BackTestSet.java+TestSet.java

题库管理：BackProblemSet.java+ProblemSet.java,添加题目，题目信息显示：内容，难度，类型

编译运行：Code.java+CodeProgram.java+CodeCompile.java+CodeRun.java

数据库父类：DBMessage.java,请修改为自己的数据库信息

题库文件夹：E:/ExamOL/Problem

考试文件夹：E:/ExamOL/Exam

黑名单：E:/ExamOL/blackname.txt，用来剔除用户提交代码中的恶意操作

examol.sql是该项目的数据库文件导入即可使用

# 数据库examol说明:

admin:管理员

user:用户

course:课程

test:考试记录

submit:提交记录

problem:题库
