#设置客户端连接服务器端的编码
SET NAMES UTF8;
#丢弃数据库，如果存在
DROP DATABASE IF EXISTS lincang;
#创建数据库，设置编码
CREATE DATABASE lincang CHARSET=UTF8;
#进入数据库
USE lincang;
#用户表
CREATE TABLE user(
  uid INT PRIMARY KEY AUTO_INCREMENT,#用户编号  主键
  uname VARCHAR(16) UNIQUE NOT NULL, #用户名
  password VARCHAR(20) NOT NULL,     #用户密码
  phone VARCHAR(16) NOT NULL,        #用户电话
  role BOOLEAN DEFAULT 1,            #用户角色
  createtime DATETIME(0),            #创建时间
  updatetime DATETIME(0)             #更新时间
);

#商品表
CREATE TABLE product(
  proid INT PRIMARY KEY AUTO_INCREMENT,#商品编号  主键
  cid INT,
  FOREIGN KEY(cid) REFERENCES category(cateid),#商品类型编号  外键
  protitle VARCHAR(16) NOT NULL,       #商品副标题
  proimage VARCHAR(500) NOT NULL,      #商品主图
  proimages TEXT,                      #商品图片
  detail TEXT NOT NULL,              #商品详情
  price DECIMAL(20,2),               #商品价格
  number INT,                        #商品库存数量
  status BOOLEAN DEFAULT 1,          #商品状态 1，在售 ，0，下架
  createtime DATETIME(0),            #创建时间
  updatetime DATETIME(0)             #更新时间
);

#商品类别表
CREATE TABLE category(
  cateid INT PRIMARY KEY AUTO_INCREMENT,#类别编号
  parentid VARCHAR(64) NOT NULL,     #父类别编号，为0表示根节点
  cname VARCHAR(50),                 #类别名称
  status BOOLEAN DEFAULT 1,          #类别状态 1，可用 ，0，已弃用
  createtime DATETIME(0),            #创建时间
  updatetime DATETIME(0)             #更新时间
);

#购物车表
CREATE TABLE cart(
  carid INT PRIMARY KEY AUTO_INCREMENT,#购物车编号
  userid INT,
  FOREIGN KEY(userid) REFERENCES user(uid),        #用户编号  外键
  productid INT,
  FOREIGN KEY(productid) REFERENCES product(proid), #产品编号  外键
  quantity INT(11),                 #产品数量
  cheched INT(11) ,                 #是否勾选 1，勾选 2，未勾选
  createtime DATETIME(0),            #创建时间
  updatetime DATETIME(0)             #更新时间
);