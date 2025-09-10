# 用户管理系统后端

## 项目简介

基于 Spring Boot + MySQL 的 RESTful 用户管理后端服务（JDK 1.8），支持用户增删改查、角色管理等功能。

## 技术栈

| 类别         | 技术                         | 说明                                       |
|--------------|------------------------------|--------------------------------------------|
| 后端框架     | Spring Boot 2.6.4            | 快速构建 Java Web 应用                     |
| 数据库       | MySQL8.0                        | 关系型数据库                               |
| JDBC 驱动    | mysql-connector-java         | Java 连接 MySQL                            |
| ORM 框架     | MyBatis + MyBatis-Plus       | 数据库访问与增强工具，简化 CRUD            |
| 构建工具     | Maven                        | 依赖管理与项目构建                         |
| 代码简化     | Lombok                       | 减少 Getter/Setter 等样板代码              |
| 测试框架     | JUnit 4 + Spring Boot Test   | 单元测试与集成测试                         |
| 代码覆盖率   | JaCoCo                       | 测试覆盖率统计（可选）                     |

## 功能特性

- 用户 CRUD
- 用户状态与角色管理
- RESTful API
- 统一异常处理

## 项目目录结构

- user-center-system-backend/
  - src/
    - main/
      - java/com/zjl/usercenter/
        - common/
          - BaseResponse.java
          - ErrorCode.java
          - ResultUtils.java
        - contant/
          - UserConstant.java
        - controller/
          - UserController.java
        - exception/
          - BusinessException.java
          - GlobalExceptionHandler.java
        - mapper/
          - UserMapper.java
        - model/domain/
          - request/
            - UserLoginRequest.java
            - UserRegisterRequest.java
          - User.java
        - service/
          - UserService.java
          - impl/
            - UserServiceImpl.java
        - UserCenterApplication.java
      - resources/
        - application.yml
        - static/pages/
          - content.html
          - login-register.html
    - test/java/com/zjl/usercenter/
      - UserCenterApplicationTests.java.bak
      - service/
        - UserServiceTest.java.bak
  - postman/
    - UserCenter.postman_collection.json
  - sql/
    - schema.sql
    - data.sql
  - pom.xml
  - README.md
  - user-center-backend-0.0.1-SNAPSHOT.jar//打包程序，构建好数据库可直接使用终端运行
 
## 远程访问
1.访问前端页面登录（AI生成，存在瑕疵，但基本实现后端接口）http://110.42.60.104:8080/api/pages/login-register.html

2.登录管理员账号：testuser123  密码：password123,跳转http://110.42.60.104:8080/api/pages/content.html

3.通过前端页面测试接口

4.也可以通过postman发送请求测试接口，见postman文件夹中UserCenter Copy （远程）.postman_collection，可直接测试后端接口


## 快速开始(本地)

1.构建数据库

    schema.sql与data.sql构建数据库结构并导入数据，用于后续登录、注册、查询、登出等操作

2.更改数据库配置

    application.yml中  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/user_center?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true//架构名称user_center，表名user
    username: root//更改
    password: root//更改

3.postman测试

    将UserCenter.postman_collection.json导入postman中，其中提供了简单的部分测试；访问地址：http://localhost:8080/api/user/*** （***为后端接口，如register、login等）

4.与前端交互演示（AI生成，仅作演示使用）

    http://localhost:8080/api/pages/login-register.html

5.其他

    业务代码中对于用户的属性提出了要求，使用后端接口时需要注意：


| 校验维度     | 要求详情                        | 出现位置         | 是否强制 | 说明                                                         |
|--------------|---------------------------------|------------------|----------|--------------------------------------------------------------|
| ​**非空校验**​ | 不能为 `null` 或空字符串        | 注册 & 登录      | ✅ 强制  | 使用 `StringUtils.isAnyBlank(...)` 检查，任一为空则校验失败  |
| ​**最小长度**​ | 至少 ​**4 个字符**​               | 注册 & 登录      | ✅ 强制  | `userAccount.length() < 4` 时直接报错，拒绝短账号             |
| ​**字符合法性**​ | 不能包含特殊字符                | 注册 & 登录      | ✅ 强制  | 使用正则表达式校验，命中特殊字符则拒绝（如 `~ ! @ # $ % ^` 等） |
| ​**密码匹配性**​ | 注册时需与 `checkPassword` 一致 | 仅注册           | ✅ 强制  | 不属于 account 属性本身，但作为注册流程中的关联校验            |
| ​**唯一性**​   | 不能与已有用户的 userAccount 重复 | 仅注册           | ✅ 强制  | 通过 `QueryWrapper` 查询数据库，存在相同账号则拒绝注册         |
| ​**登录匹配性**​ | 账号 + 加密后密码 必须匹配数据库记录 | 仅登录           | ✅ 强制  | 通过账号查找用户，且密码（MD5 + 盐值加密后）必须一致才能登录   |

## 作者

GitHub: https://github.com/CSDNzjl/usercenter/edit/main/README.md
