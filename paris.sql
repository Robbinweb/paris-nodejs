-- 设置编码方式为utf8
SET NAMES UTF8;

-- 查询是否存在 paris 数据库，如果存在则删除
DROP DATABASE IF EXISTS paris;

-- 创建数据库 paris，并将编码方式设置为urf8
CREATE DATABASE paris CHARSET=UTF8;

-- 进入paris数据库
USE paris;

-- 管理员表
CREATE TABLE admin(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  aname VARCHAR(32) UNIQUE, #账号
	apwd   VARCHAR(64),  #密码
	anick  VARCHAR(32),  #用户昵称
  avatar VARCHAR(64),  #用户头像
  phone  VARCHAR(64)   #手机号
);

-- 用户表
CREATE TABLE user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32) UNIQUE, #账号
	upwd   VARCHAR(64),  #密码
	unick  VARCHAR(32),  #用户昵称
	email  VARCHAR(64),  #邮箱
	phone  VARCHAR(32) UNIQUE, # 手机号
	gender BOOL                 #男 女
);
INSERT INTO user VALUES(NULL,"qwer","123456","tom","tom@huanlu.com","15717514752",1);
INSERT INTO user VALUES(NULL,"admin","123456","sunny","sunny@qq.com","13513514752",1);
INSERT INTO user VALUES(NULL,"root","123456","dive","dive@sina.com","13513514751",1);

-- 网站导航表
CREATE TABLE navbar(
  navid INT PRIMARY KEY AUTO_INCREMENT, #网站导航表ID
  navname  VARCHAR(32),  #导航名称
  href   VARCHAR(64),           #导航路径
  navdesc  VARCHAR(128)           #网站描述
);
INSERT INTO navbar VALUES(NULL,"登录","login.html","登录");
INSERT INTO navbar VALUES(NULL,"注册","register.html","注册");
INSERT INTO navbar VALUES(NULL,"巴黎经典婚纱摄影","index.html","巴黎经典婚纱摄影");
INSERT INTO navbar VALUES(NULL,"首页","index.html","首页");
INSERT INTO navbar VALUES(NULL,"客照欣赏","photos.html","婚纱照:想你所想，找你所找。");
INSERT INTO navbar VALUES(NULL,"旅拍MV","movie.html","旅拍婚纱照&&爱情微电影");
INSERT INTO navbar VALUES(NULL,"婚品商城","shop.html","婚纱照特惠,手快有手慢无啊亲~");
INSERT INTO navbar VALUES(NULL,"婚车租赁","rentcart.html","热门婚车品牌");
INSERT INTO navbar VALUES(NULL,"客户评价","evaluation.html","愿重要的选择只因喜欢，而非便宜。");

-- 轮播图
CREATE TABLE carousel(
   cid SMALLINT PRIMARY KEY AUTO_INCREMENT,  #轮播图id
   title   VARCHAR(64),   #轮播图标题
   img_url VARCHAR(128),  #轮播图路径
   href    VARCHAR(128)  #跳转链接
);
INSERT INTO carousel VALUES(NULL,"轮播图1","img/carousel/1803201617062668.jpg","photo-details.html");
INSERT INTO carousel VALUES(NULL,"轮播图2","img/carousel/1803231710206780.jpg","pictures-details.html");
INSERT INTO carousel VALUES(NULL,"轮播图3","img/carousel/1803201607204711.jpg","pictures-details.html");


-- 照片标签
CREATE TABLE tags(
  tid SMALLINT PRIMARY KEY AUTO_INCREMENT,  #标签id
  tname  VARCHAR(32) #标签名称
);
INSERT INTO tags VALUES(NULL,"中国风");
INSERT INTO tags VALUES(NULL,"轻奢");
INSERT INTO tags VALUES(NULL,"青春");
INSERT INTO tags VALUES(NULL,"军旅");
INSERT INTO tags VALUES(NULL,"都市");

-- 客照详情
CREATE TABLE photos_details(
  pid INT PRIMARY KEY AUTO_INCREMENT,  #客照id
  title  VARCHAR(64),    #客照标题
  dices  VARCHAR(128),  #客照描述
  clientnames  VARCHAR(32),  #客户名称
  img_url VARCHAR(128),  #客照路径
  href    VARCHAR(128),  #跳转链接
  counts  VARCHAR(32),    #客照数量
  tagsId SMALLINT,                      #标签
  FOREIGN KEY(tagsId) REFERENCES tags(tid)
);
INSERT INTO photos_details VALUES(NULL,"玫瑰情缘","描述栏：玫瑰情缘","许先生&陈女士","img/photos/4/2207251.jpg","photo-details.html",4,5);
INSERT INTO photos_details VALUES(NULL,"听你说爱情的样子","描述栏：听你说爱情的样子","许先生&陈女士","img/photos/1/2212119.jpg","photo-details.html",3,3);
INSERT INTO photos_details VALUES(NULL,"浪漫巴黎","描述栏：浪漫巴黎","陈先生&许女士","img/photos/2/2206035.jpg","photo-details.html",5,2);
INSERT INTO photos_details VALUES(NULL,"我愿在在你身边守护着","描述栏：我愿在在你身边守护着","许先生&陈女士","img/photos/3/2206547.jpg","photo-details.html",4,5);
INSERT INTO photos_details VALUES(NULL,"玫瑰情缘","描述栏：玫瑰情缘","许先生&陈女士","img/photos/4/2207242.jpg","photo-details.html",4,5);
INSERT INTO photos_details VALUES(NULL,"我爱的样子你都有","描述栏：我爱的样子你都有","许先生&陈女士","img/photos/5/2210291.jpg","photo-details.html",6,3);
INSERT INTO photos_details VALUES(NULL,"华灯初上","描述栏：华灯初上","许先生&陈女士","img/photos/6/2211382.jpg","photo-details.html",10,3);
INSERT INTO photos_details VALUES(NULL,"浓情蜜意","描述栏：浓情蜜意","许先生&陈女士","img/photos/7/2210844.jpg","photo-details.html",10,3);


-- 图片库 
CREATE TABLE photos(
  pid INT PRIMARY KEY AUTO_INCREMENT,  #图片库id
  sort  VARCHAR(64),  #照片分类
  img_url VARCHAR(128),  #客照路径
  pdid SMALLINT         #客照id
);
INSERT INTO photos VALUES(NULL,"六月","img/photos/1/2212119.jpg",1);
INSERT INTO photos VALUES(NULL,"六月","img/photos/1/2212111.jpg",1);
INSERT INTO photos VALUES(NULL,"六月","img/photos/1/2212112.jpg",1);
INSERT INTO photos VALUES(NULL,"六月","img/photos/2/2206035.jpg",2);
INSERT INTO photos VALUES(NULL,"六月","img/photos/2/2206036.jpg",2);
INSERT INTO photos VALUES(NULL,"六月","img/photos/2/2206037.jpg",2);
INSERT INTO photos VALUES(NULL,"六月","img/photos/2/2206038.jpg",2);
INSERT INTO photos VALUES(NULL,"六月","img/photos/2/2206042.jpg",2);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206540.jpg",3);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206541.jpg",3);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206543.jpg",3);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206544.jpg",3);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206547.jpg",3);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206552.jpg",3);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206613.jpg",3);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206627.jpg",3);
INSERT INTO photos VALUES(NULL,"六月","img/photos/3/2206628.jpg",3);


-- 旅拍MV
CREATE TABLE movie(
  mid INT PRIMARY KEY AUTO_INCREMENT,  #旅拍id
  title  VARCHAR(64),    #旅拍标题
  img_url VARCHAR(128),  #缩略图路径
  mv_url VARCHAR(128),  #视频路径
  href    VARCHAR(128),  #跳转链接
  clientnames  VARCHAR(32),  #客户名称
  adds   VARCHAR(32),    #旅拍城市
  dices  VARCHAR(128)   #旅拍描述
);
INSERT INTO movie VALUES(NULL,"从此你是我的信仰","movie/img/20180901.jpg","video/20180901.mp4","movie-details.html","许先生&陈女士","泰国","双机位,顶级剪辑师");
INSERT INTO movie VALUES(NULL,"青春的岁月与他相遇","movie/img/20180902.jpg","video/20180902.mp4","movie-details.html","刘先生&许女士","上海","小清新,顶级编导,校园风");
INSERT INTO movie VALUES(NULL,"留住那些小美好","movie/img/20180903.jpg","video/20180903.mp4","movie-details.html","许先生&陈女士","毛里求斯","轻奢,大气。首席编导特制");
INSERT INTO movie VALUES(NULL,"和你在一起的每一天都好","movie/img/20180904.jpg","video/20180904.mp4","movie-details.html","王先生&韩女士","上海","轻奢,大气。首席编导特制");
INSERT INTO movie VALUES(NULL,"恋爱和旅行一样","movie/img/20180905.jpg","video/20180905.mp4","movie-details.html","许先生&陈女士","丽江","恋爱和旅行一样，总是要迈出脚步");
INSERT INTO movie VALUES(NULL,"青春就是一封回忆写得信","movie/img/20180906.jpg","video/20180907.mp4","movie-details.html","许先生&陈女士","三亚","青春就是一封回忆写得信");
INSERT INTO movie VALUES(NULL,"爱情微电影，留住那些小美好。","movie/img/20180907.jpg","video/20180907.mp4","movie-details.html","许先生&陈女士","深证","爱情微电影，留住那些小美好。");
-- 商品分类
CREATE TABLE product_tags(
  ptid INT PRIMARY KEY AUTO_INCREMENT,  #商品分类id
  title    VARCHAR(32),      #分类名称
  dices    VARCHAR(128),     #商品描述
  href     VARCHAR(128)     #跳转链接
);
INSERT INTO product_tags VALUES(NULL,"婚纱摄影","婚纱摄影套餐风格欣赏，想你所想，找你所找。","product-list.html");
INSERT INTO product_tags VALUES(NULL,"婚纱礼服","高端定制:不给人生留遗憾","product-list.html");
INSERT INTO product_tags VALUES(NULL,"婚车租赁","热门婚车品牌应有尽有","product-list.html");
INSERT INTO product_tags VALUES(NULL,"喜糖喜酒","婚礼专属高端定制","product-list.html");
INSERT INTO product_tags VALUES(NULL,"钻石珠宝","万里挑一,知名品牌应有尽有！","product-list.html");
INSERT INTO product_tags VALUES(NULL,"婚礼百货","品质保证,假一赔十","product-list.html");

-- 商品表
CREATE TABLE product_details(
  pid INT PRIMARY KEY AUTO_INCREMENT,  #商品id
  ptid  INT,                 #商品分类id
  title    VARCHAR(64),      #商品标题
  dices    VARCHAR(128),     #商品描述
  img_url  VARCHAR(128),     #商品图片
  mv_url   VARCHAR(128),     #视频路径
  href     VARCHAR(128),     #跳转链接
  price_old DECIMAL(10,2),   #旧价格
  price_new DECIMAL(10,2),   #新价格
  stock    INT,              #库存
  concern  INT,              #关注度
  add_time DATETIME          #发表时间
);
INSERT INTO product_details VALUES(NULL,"1","法国巴黎团购套系","普吉岛双人跟拍摄影，下单就送旅拍微电影","img/photos/1/2212119.jpg","NULL","product-details.html","23999","21199","NULL","214",now());
INSERT INTO product_details VALUES(NULL,"1","青岛团购套系","青岛双人跟拍摄影，下单就送旅拍微电影","img/photos/2/2206035.jpg","NULL","product-details.html","3999","2999","NULL","314",now());
INSERT INTO product_details VALUES(NULL,"1","普吉岛团购套系","普吉岛双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","13999","11999","NULL","114",now());
INSERT INTO product_details VALUES(NULL,"1","刘公岛团购套系","刘公岛双人跟拍摄影，下单就送旅拍微电影","img/photos/4/2207242.jpg","NULL","product-details.html","3999","2999","NULL","14",now());
INSERT INTO product_details VALUES(NULL,"1","毛里求斯团购套系","毛里求斯双人跟拍摄影，下单就送旅拍微电影","img/photos/6/2211382.jpg","NULL","product-details.html","13999","11999","NULL","27",now());
INSERT INTO product_details VALUES(NULL,"1","普罗旺斯团购套系","普罗旺斯双人跟拍摄影，下单就送旅拍微电影","img/photos/1/2212119.jpg","NULL","product-details.html","23999","21999","NULL","127",now());
INSERT INTO product_details VALUES(NULL,"1","泰国清迈团购套系","泰国清迈双人跟拍摄影，下单就送旅拍微电影","img/photos/5/2210291.jpg","NULL","product-details.html","23999","21999","NULL","127",now());
INSERT INTO product_details VALUES(NULL,"1","香港九龙团购套系","香港九龙双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","23999","21999","NULL","127",now());
INSERT INTO product_details VALUES(NULL,"1","普吉岛团购套系","普吉岛双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","13999","11999","NULL","114",now());
INSERT INTO product_details VALUES(NULL,"1","刘公岛团购套系","刘公岛双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","3999","2999","NULL","14",now());
INSERT INTO product_details VALUES(NULL,"1","毛里求斯团购套系","毛里求斯双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","13999","11999","NULL","27",now());
INSERT INTO product_details VALUES(NULL,"1","普罗旺斯团购套系","普罗旺斯双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","23999","21999","NULL","127",now());
INSERT INTO product_details VALUES(NULL,"1","泰国清迈团购套系","泰国清迈双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","23999","21999","NULL","127",now());
INSERT INTO product_details VALUES(NULL,"1","台湾垦丁团购套系","台湾垦丁双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","23999","21999","NULL","127",now());
INSERT INTO product_details VALUES(NULL,"1","魔都上海团购套系","魔都上海双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","5148","4140","NULL","124",now());
INSERT INTO product_details VALUES(NULL,"1","帝都北京团购套系","帝都北京双人跟拍摄影，下单就送旅拍微电影","img/photos/3/2206547.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());

INSERT INTO product_details VALUES(NULL,"3","奥迪","1","img/zuche/1.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());
INSERT INTO product_details VALUES(NULL,"3","奔驰","2","img/zuche/2.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());
INSERT INTO product_details VALUES(NULL,"3","宾利","3","img/zuche/3.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());
INSERT INTO product_details VALUES(NULL,"3","宝马","4","img/zuche/4.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());
INSERT INTO product_details VALUES(NULL,"3","丰田","5","img/zuche/5.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());
INSERT INTO product_details VALUES(NULL,"3","兰博基尼","6","img/zuche/6.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());
INSERT INTO product_details VALUES(NULL,"3","劳斯莱斯","7","img/zuche/7.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());
INSERT INTO product_details VALUES(NULL,"3","玛莎拉蒂","8","img/zuche/8.jpg","NULL","product-details.html","6999","5999","NULL","1427",now());


-- 评论表
