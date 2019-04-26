# Online Ticketing

## 项目介绍
项目使用原生Jsp技术, 服务器使用Apache的Tomcat.
服务端开发使用MyEclispe, 前端开发使用sublime2.
服务器数据库使用Mysql5.6, 使用Jdbc技术连接数据库.

## 功能说明

##### 需求分析

1. 乘客在注册后可以实现车次查询、网上订票、网上支付、网上退票、历史订票信息查询等功能；
2. 网上订票票价分为可退票价格和不可退票价格，可退票价格高于不可退票价格，不可退票价格不能退票；
3. 车票生成包括几种形式：发到用户邮箱自己打印车票；发到手机上的电子车票信息；车站取票；
4. 管理员可以根据不同的条件（不同季节、是否周末、是否是单程票还是往返票、每天不同的发车时间、一次购票数量、提前购票天数间隔、是否儿童、是否老年人）来设置不同的优惠幅度；可以管理长途汽车线路（包括发车时间）。
5. 管理员还可以实现已售车票的统计和查询、打印功能，可以月度、季度、年度财务结算等功能。

##### 图形描述
<img src="https://github.com/NX10086/online_ticketing/blob/master/images/function.png" width="450" height="300" />

## 效果演示

### 普通用户界面

##### 首页

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/index.png" width="450" height="300" />

##### 用户登录

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/login.png" width="450" height="300" />

##### 查询车次

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/query_ticket.png" width="450" height="300" />

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/query_result.png" width="450" height="300" />

##### 我的订单

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/my_order.png" width="450" height="300" />

##### 添加乘客

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/add_passenger.png" width="450" height="300" />

### 管理员界面

##### 设置折扣

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/disaccount.png" width="450" height="300" />

##### 车次管理

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/bus_manage.png" width="450" height="300" />

##### 财政管理

<img src="https://github.com/NX10086/online_ticketing/blob/master/images/finnace_manage.png" width="450" height="300" />

## 联系作者
**Author**
* Crusher: yuewang_louie@163.com
* Niexu: 1123421827@qq.com