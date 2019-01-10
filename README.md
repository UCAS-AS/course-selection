# 一个简单的选课系统

本项目为中国科学院大学研究生课程《高级软件工程》的课程项目，仅作为教育用途。

## 项目信息

### 题目
选课系统

### 简介
选课系统面向学生、教师与管理员（例如教务处），提供与课程管理有关功能，目标是为学生、教师与管理员等用户进行教育教学相关工作和安排提供有效的信息化管理手段。

本项目仅作为选课系统的一个原型，无商业用途。

### 成员
颜复海（组长），王毅蒙，徐文文。

## 部署与运行
### 1. 克隆本仓库到本地

```bash
$ git clone https://github.com/UCAS-AS/course-selection.git
```

### 2. 数据库设置（推荐使用 MySQL）
1. 在数据库中创建以下数据库
	
	```course_selection```，```course_selection_test```。
	
2. 修改配置文件```config/database.yml```

	添加你的数据库信息，如：
	
	```bash
	default: &default
	  adapter: mysql2
	  encoding: utf8
	  username: ruby
	  password: neptune.
	  host: localhost
	  port: 3306
	  flags:
	  - -COMPRESS
	  - FOUND_ROWS
	  - MULTI_STATEMENTS
	  secure_auth: false
	
	development:
	  <<: *default
	  database: course_selection
	
	test:
	  <<: *default
	  database: course_selection_test
	
	production:
	  <<: *default
	  database: course_selection
	
	```

### 3. 邮箱服务配置（可选）

本项目默认使用我们已经注册的 126 邮箱作为邮件发送邮箱。

如果你需要使用自己的邮箱服务器，将以下配置中的有关账号信息修改成你的邮箱账号信息即可。在文件 ```config/environments/development``` 和 ```config/environments/production``` 中修改以下信息：

```bash
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  host = 'localhost:3000'
  config.action_mailer.default_url_options = { host: host }
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.xxx.com',
    :port           => 'xx',
    :authentication => :plain,
    :user_name      => 'your account',
    :password       => 'your password',
    :domain         => 'xxx.com',
  }
```

### 4. 启动服务器

```bash
$ cd course-selection
$ bundle install
$ rails db:migrate
$ rails db:seed
$ rails s
```

启动服务器后，在浏览器中输入：```http://localhost:3000``` 即可访问选课系统。

### 5. 默认账户

1. 学生：
	
	学号：```2018E000000000```
	
	密码：```neptune.```
	
2. 教师：

	教职工号：```200010101000```
	
	密码：```neptune.```

## 功能简介
### 一、学生模块
1. 登录验证
2. 通过邮件链接重置密码
3. 邮箱激活
4. 账号管理
	- 查看个人资料
	- 绑定新邮箱
	- 修改密码
5. 课程管理
	- 选课
		- 选课冲突检测
		- 选课人数限制
	- 退课
	- 学分统计
	- 查询成绩

### 二、教师模块
1. 登录验证
2. 通过邮件链接重置密码
3. 邮箱激活
4. 账号管理
	- 查看个人资料
	- 绑定新邮箱
	- 修改密码
5. 课程管理
	- 查看教授课程
	- 登记成绩
	- 发布课程通知

### 三、管理员模块
1. 用户管理（用户包括：学生，教师）
	- 添加新用户
	- 删除用户
	- 更新用户信息
	- 查看所有用户
2. 课程管理
	- 添加新课程
	- 删除课程
	- 更新课程信息
	- 查看所有课程
3. 院系管理
	- 添加新院系
	- 删除院系
	- 更新院系信息
	- 查看所有院系

### 四、待完善功能
1. 课表查询
2. 管理员后台登录验证
3. 选课权限开放

## 系统截图
#### 1. 学生登录界面
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/学生登录.png)

#### 2. 教师登录界面
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/教师登录.png)

#### 3. 重置密码
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/重置密码.png)

#### 4. 邮箱设置
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/邮箱设置.png)

#### 5. 修改密码
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/修改密码.png)

#### 6. 学生选课
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/学生选课.png)

#### 7. 学生查看已选课程
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/学生查看已选课程.png)

#### 8. 学生学分统计
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/学生学分统计.png)

#### 9. 学生成绩查询
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/学生成绩查询.png)

#### 10. 教师查看教授课程
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/教师查看教授课程.png)

#### 11. 教师登记课程成绩
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/教师登记课程成绩-1.png)
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/教师登记课程成绩-2.png)

#### 12. 教师发布课程通知
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/发布课程通知.png)

#### 13. 后台管理
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/后台管理%20-%20主界面.png)
![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/后台管理%20-%20课程管理.png)

## 测试
### 一、运行所有测试样例
执行命令：

```bash
$ rails test
```

结果如下：

![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/测试结果.png)

### 二、模型测试
模型测试中，我们针对各模型的字段进行了验证，具体如下：

执行命令：

```bash
$ rails test:models
```

结果如下：

![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/模型测试.png)

### 三、集成测试
集成测试中，我们主要做了用户登录验证以及用户登录后的页面跳转的测试，具体如下：

#### 1. 用户登录验证

执行命令：

```bash
$ rails test test/integration/user_login_test.rb  
```

结果如下：

![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/集成测试-2.png)

#### 2. 用户登录后页面跳转

执行命令：

```bash
$ rails test test/integration/actions_after_login_test.rb   
```

结果如下：

![](https://raw.githubusercontent.com/UCAS-AS/course-selection/master/%20screenshots/集成测试-1.png)



