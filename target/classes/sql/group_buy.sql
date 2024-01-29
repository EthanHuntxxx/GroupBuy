/*

1. 商品
Pack(盒), Box(箱), Bottle(瓶), Bag(包), Dozen(打)
+-----------+-------------+-------+--------+----------+
| productId | productName | price |  unit  | isLaunch |
+-----------+-------------+-------+--------+----------+
|    501    |   Coffee    |  300  |  Pack  |   true   |
|    502    |  Green Tea  |  150  |  Box   |   false  |
|    503    |   Honey     |  200  | Bottle |   false  |
|    504    |   Sugar     |  100  |  Bag   |   true   |
|    505    |   Milk      |  450  |  Dozen |   true   |
+-----------+-------------+-------+--------+----------+

2. 使用者
level: 1(一般會員-進行團購), 2(後臺維運人員-進行團購+上架商品)
+--------+----------+----------+-------+----------+--------+
| userId | username | password | level | authType | authId |
+--------+----------+----------+-------+----------+--------+
|  101   | user123  | pass123  |   1   |          |        | 
|  102   | user456  | pass456  |   2   |          |        | 
|  103   | user789  | pass789  |   1   |          |        | 
|  104   | gitUser  | None     |   1   |  github  | 123456 |
+--------+----------+----------+-------+----------+--------+

3. 購物車主檔(Master)
+--------+----------+-----------+------------+--------------+
| cartId |  userId  | cartItems | isCheckout | checkoutTime |
+--------+----------+-----------+------------+--------------+
|  201   |   101    | [1, 2]    |    true    | /-/-/  0:0:0 |
|  202   |   102    | [3]       |    false   |              |
|  203   |   103    | [4, 5]    |    true    | /-/-/  0:0:0 |
|  204   |   103    | []        |    false   |              |
|  205   |   101    | [6]       |    true    | /-/-/  0:0:0 |
+--------+----------+-----------+------------+--------------+

ps: cartItems 一對多關聯

4. 購物車明細檔(Detail)
+--------+----------+-----------+------------+
| itemId |  cartId  | productId |  quantity  |
+--------+----------+-----------+------------+
|   1    |   201    |    501    |     10     |
|   2    |   201    |    502    |     8      |
|   3    |   202    |    503    |     5      |
|   4    |   203    |    502    |     8      |
|   5    |   203    |    504    |     20     |
|   6    |   205    |    505    |     15     |
+--------+----------+-----------+------------+

資料庫的建立: CREATE SCHEMA `group_buy` DEFAULT CHARACTER SET utf8mb4 ;

 * */
-- 授權資料表
drop table if exists level_ref_service;
drop table if exists service;
drop table if exists level;

drop table if exists cartitem;
drop table if exists cart;
drop table if exists user;
drop table if exists product;

-- 建立 Service table
create table if not exists service(
    serviceId int primary key,
    serviceLocation varchar(50),
    serviceName varchar(50),
    serviceUrl varchar(50)
);

-- 建立 Level
create table if not exists level(
    levelId int primary key,
    levelName varchar(50)
);

-- 建立 Service 與 Level 之間的關聯表 table
create table if not exists level_ref_service(
    levelId int not null,
    serviceId int not null,
    sort int default 1,
    foreign key (levelId) references level(levelId),
    foreign key (serviceId) references service(serviceId),
    constraint unique_sid_and_aid UNIQUE(levelId, serviceId)
);


-- 建立 Product
create table if not exists product(
	productId int auto_increment primary key,
    productName varchar(50) not null,
    price decimal(10, 2),
    unit varchar(10),
    isLaunch boolean,
    productDetail varchar(800)
);
-- 設置 AUTO_INCREMENT = 501
alter table product auto_increment = 501;

-- 建立 User
create table if not exists user(
	userId int auto_increment primary key,
    username varchar(50) not null,
    password varchar(50) not null,
    level int,
    authType enum('local', 'github', 'google') default 'local',
    authId varchar(100)
);
-- 設置 AUTO_INCREMENT = 101
alter table user auto_increment = 101;

-- 建立 Cart 購物車主檔
create table if not exists cart(
	cartId int auto_increment primary key,
    userId int not null, 
    isCheckout boolean default false,
    checkoutTime datetime default current_timestamp,
    foreign key (userId) references user(userId)
);
-- 設置 AUTO_INCREMENT = 201
alter table cart auto_increment = 201;

-- 建立 CartItem 購物車明細檔
create table if not exists cartitem(
	itemId int auto_increment primary key,
    cartId int not null,
    productId int not null,
    quantity int default 0,
    foreign key (cartId) references cart(cartId),
    foreign key (productId) references product(productId)
);
-- 設置 AUTO_INCREMENT = 1
alter table cartitem auto_increment = 1;

-- 預設資料
insert into service (serviceId, serviceLocation, serviceName, serviceUrl) values(1, 'frontend', '團購首頁', '/mvc/group_buy/frontend/main');
insert into service (serviceId, serviceLocation, serviceName, serviceUrl) values(2, 'frontend', '🛒 購物車', '/mvc/group_buy/frontend/cart');
insert into service (serviceId, serviceLocation, serviceName, serviceUrl) values(3, 'frontend', '登出', '/mvc/group_buy/logout');
insert into service (serviceId, serviceLocation, serviceName, serviceUrl) values(4, 'frontend', 'Profile', '/mvc/group_buy/frontend/profile');
insert into service (serviceId, serviceLocation, serviceName, serviceUrl) values(51, 'backend', '查看訂單', '/mvc/group_buy/backend/report');
insert into service (serviceId, serviceLocation, serviceName, serviceUrl) values(52, 'backend', '商品新增', '/mvc/group_buy/backend/main');

insert into level(levelId, levelName) values(1, '一般客戶');
insert into level(levelId, levelName) values(2, '內部員工');

insert into level_ref_service(levelId, serviceId, sort) values(1, 1, 1);
insert into level_ref_service(levelId, serviceId, sort) values(1, 2, 2);
insert into level_ref_service(levelId, serviceId, sort) values(1, 3, 4);
insert into level_ref_service(levelId, serviceId, sort) values(1, 4, 3);
insert into level_ref_service(levelId, serviceId, sort) values(2, 1, 1);
insert into level_ref_service(levelId, serviceId, sort) values(2, 2, 2);
insert into level_ref_service(levelId, serviceId, sort) values(2, 3, 6);
insert into level_ref_service(levelId, serviceId, sort) values(2, 4, 5);
insert into level_ref_service(levelId, serviceId, sort) values(2, 51, 3);
insert into level_ref_service(levelId, serviceId, sort) values(2, 52, 4);

INSERT INTO product (productId, productName, price, unit, isLaunch,productDetail ) VALUES
(501, '咖啡', 300.00, '瓶', true,'即溶咖啡，是由500多種的口味測試中嚴選出酸苦適中口感之咖啡' ),
(502, '綠茶', 150.00, '瓶', true,'口感清新芳香，招待客人好選' ),
(503, '蜂蜜', 200.00, '罐', true,'氣味最濃郁且風味獨特，不易結晶，口感溫潤，尾韻較沉' ),
(504, '糖包', 100.00, '包', true,'適宜牛奶、咖啡、紅茶、冰品、蓮子、煮豆湯、白木耳、製餡、作年糕、西點、花茶、果汁等一般家庭用調味糖及食品加工用糖 ' ),
(505, '牛奶', 450.00, '瓶', true,'經殺菌釜高溫高壓殺菌，不含防腐劑，完整保存乳品原味' ),
(506, '海鮮丼飯', 500.00, '碗', true,'魚肉好吃，醋飯難吃的海鮮丼飯'),
(507, '榴槤', 250.00, '顆', true,'濃郁的香味和獨特的口感'),
(508, '洋芋片', 50.00, '包', true,'馬鈴薯被切成薄片，然後炸或烤至金黃酥脆'),
(509, '藍莓杯子蛋糕', 180.00, '個', true,'小巧的蛋糕，製作成個體份量，加上奶霜及藍莓點綴'),
(510, '櫻桃杯子蛋糕', 180.00, '個', true,'小巧的蛋糕，製作成個體份量，加上一顆櫻桃增加甜美和果香'),
(511, '草莓蛋糕', 200.00, '塊', true,'新鮮的草莓、草莓醬，提供豐富的草莓風味'),
(512, '提拉米蘇', 200.00, '塊', true,'由咖啡沾濕的Ladyfinger餅乾、甜忌廉和可可粉層層疊疊而成，具有濃郁的咖啡和可可風味'),
(513, '吐司', 100.00, '包', true,'吐司是一種簡單且受歡迎的早餐食物');
-- (514, '水果茶', 40.00, '瓶', true,'由水果、草本植物或花卉製成的飲料'); 


-- password 已透過 AES 進行加密
-- KEY = 0123456789abcdef0123456789abcdef
INSERT INTO user (userId, username, password, level) VALUES
(101, 'user123', 'JqKLj+4Aw3DnndH0MHUQkg==', 1),
(102, 'user456', 'ormIciIAHZjZjQYphMuCHQ==', 2),
(103, 'user789', 'Nj8ZE1H01l0cDeX/GskzXg==', 1);

INSERT INTO cart (cartId, userId, isCheckout, checkoutTime) VALUES
(201, 101, true, current_timestamp),
(202, 102, false, NULL),
(203, 103, true, current_timestamp),
(204, 103, false, NULL),
(205, 101, true, current_timestamp);

INSERT INTO cartitem (itemId, cartId, productId, quantity) VALUES
(1, 201, 501, 10),
(2, 201, 502, 8),
(3, 202, 503, 5),
(4, 203, 502, 8),
(5, 203, 504, 20),
(6, 205, 505, 15);

-- 每個使用者的總消費金額
-- 建立View
/*
create view UserTotalAmountView as
select u.userId, u.username,coalesce(sum(p.price*ci.quantity),0) as total
from user u
left join cart c on u.userId = c.userId
left join cartitem ci on c.cartId= ci.cartId
left join product p on ci.productId = p.productId
where c.isCheckout = true
group by u.userId, u.username
*/


-- 各商品銷售總量
--select p.productId, p.productName, p.price, p.unit, coalesce(sum(ci.quantity),0) total_quantity
--from group_buy.cartitem ci
--left join group_buy.cart c on ci.cartId = c.cartId
--left join group_buy.product p on ci.productId = p.productId
--where c.isCheckout = 1  group by p.productId order by total_quantity desc