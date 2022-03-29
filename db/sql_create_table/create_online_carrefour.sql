/*
-- Query: SELECT * FROM example.online_carrefour
LIMIT 0, 2000

-- Date: 2022-03-05 20:41
*/
CREATE TABLE `online_carrefour` (
`online_goods_id` int not null auto_increment comment '線上商品編號' primary key,
`online_category` varchar(10) comment '線上類別',
`online_subcategory` varchar(15) comment '線上子類別',
`area` int comment '區域',
`aisle` int comment '走道',
`cabinet_begining` int comment '開始櫃位',
`cabinet_end` int comment '結束櫃位'

)DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4001,'茶飲/咖啡','綠茶/烏龍茶/其他茶飲',53,1,2,7);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4002,'茶飲/咖啡','綠茶/烏龍茶/其他茶飲',53,2,1,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4003,'茶飲/咖啡','紅茶/花茶/水果茶',53,2,2,5);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4004,'茶飲/咖啡','奶茶',53,2,6,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4005,'茶飲/咖啡','咖啡',51,2,6,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4006,'茶飲/咖啡','罐裝咖啡',51,2,6,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4007,'茶飲/咖啡','機能飲料',51,2,1,5);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4008,'汽水','可樂',51,1,10,12);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4009,'汽水','碳酸汽水',51,1,3,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4010,'汽水','沙士',51,1,5,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4011,'水','礦泉水',55,2,4,11);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4012,'水','氣泡水',55,2,2,3);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4013,'果汁/養生','保健養生飲品',43,1,13,15);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4014,'果汁/養生','蔬果汁',55,1,2,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4015,'果汁/養生','蔬果汁',55,2,1,1);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4016,'果汁/養生','濃縮飲料/水果醋',51,1,2,2);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4017,'精選餅乾','鹹餅乾',57,2,1,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4018,'精選餅乾','鹹餅乾',59,1,2,10);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4019,'精選餅乾','鹹餅乾',59,2,1,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4020,'精選餅乾','鹹餅乾',61,1,1,3);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4021,'精選餅乾','甜餅乾',61,1,4,10);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4022,'精選餅乾','甜餅乾',63,1,2,10);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4023,'精選餅乾','甜餅乾',0,0,1,4);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4024,'精選餅乾','烘培糕餅',61,2,1,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4025,'休閒零食','洋芋片/薯條',57,1,2,10);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4026,'休閒零食','果乾蜜餞',67,1,2,2);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4027,'休閒零食','果乾蜜餞',67,2,1,2);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4028,'休閒零食','瓜子/花生/堅果',65,2,1,10);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4029,'休閒零食','豆乾/肉乾/海苔',65,1,2,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4030,'休閒零食','豆乾/肉乾/海苔',67,1,4,10);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4031,'糖果/巧克力/口香糖','糖果',63,2,1,7);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4032,'糖果/巧克力/口香糖','口香糖/喉糖',63,2,8,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4033,'糖果/巧克力/口香糖','巧克力',67,2,3,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4034,'奶粉/麥片/穀粉','成人奶粉',0,0,5,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4035,'奶粉/麥片/穀粉','沖泡飲品',69,2,1,1);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4036,'奶粉/麥片/穀粉','沖泡飲品',0,0,18,23);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4037,'奶粉/麥片/穀粉','早餐食品',0,0,10,12);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4038,'奶粉/麥片/穀粉','早餐食品',0,0,15,17);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4039,'泡麵/麵條','速食麵',71,2,1,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4040,'泡麵/麵條','速食麵',73,1,2,6);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4041,'泡麵/麵條','速食麵',73,2,1,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4042,'泡麵/麵條','米粉/麵條',71,1,3,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4043,'調味品/罐頭/湯品','調理食品',73,1,9,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4044,'調味品/罐頭/湯品','康寶濃湯/粥',73,1,7,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4045,'調味品/罐頭/湯品','甜粥/水果罐頭',75,2,4,7);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4046,'調味品/罐頭/湯品','玉米罐頭',75,2,2,3);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4047,'調味品/罐頭/湯品','醬菜罐頭',75,1,7,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4048,'調味品/罐頭/湯品','海產罐頭',75,1,3,6);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4049,'調味品/罐頭/湯品','肉類罐頭',75,1,2,2);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4050,'調味品/罐頭/湯品','肉類罐頭',75,2,1,1);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4051,'調味品/罐頭/湯品','麵筋罐頭',75,1,9,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4052,'調味品/罐頭/湯品','調味粉/醬',76,1,2,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4053,'調味品/罐頭/湯品','調味粉/醬',76,2,1,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4054,'調味品/罐頭/湯品','調味粉/醬',77,1,1,1);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4055,'調味品/罐頭/湯品','調味粉/醬',77,1,3,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4056,'抹醬/蜂蜜/奶油','水果抹醬',0,0,14,14);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4057,'抹醬/蜂蜜/奶油','花生/巧克力醬',0,0,14,15);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4058,'米/食用油','食用油',77,1,2,2);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4059,'米/食用油','食用油',77,2,1,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4060,'米/食用油','食用油',76,2,9,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4061,'咖啡/茶包','奶精',69,2,2,2);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4062,'咖啡/茶包','茶包',69,1,2,10);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4063,'咖啡/茶包','咖啡',69,2,2,11);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4064,'咖啡/茶包','即溶咖啡',69,2,2,11);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4065,'咖啡/茶包','隨身包咖啡',69,2,2,11);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4066,'女性衛生','衛生棉',43,1,2,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4067,'女性衛生','衛生棉',43,2,1,7);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4068,'女性衛生','棉條',43,1,9,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4069,'女性衛生','保養洗護',43,1,9,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4070,'美妝保養','染髮劑/用品',46,2,5,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4071,'美妝保養','染髮劑/用品',47,1,9,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4072,'美妝保養','染髮劑/用品',46,1,2,3);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4073,'美妝保養','彩妝/護唇膏',46,1,2,2);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4074,'美妝保養','彩妝/護唇膏',48,2,2,6);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4075,'美妝保養','乳液/防曬/保養',48,2,2,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4076,'居家護理','足部保健',43,1,1,1);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4077,'居家護理','口罩',49,1,1,1);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4078,'居家護理','防蚊/特殊照護',48,1,8,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4079,'居家護理','成人紙尿褲/家庭護理',48,2,1,1);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4080,'居家護理','成人紙尿褲/家庭護理',44,1,2,4);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4081,'個人清潔','卸妝洗顏',48,1,2,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4082,'個人清潔','卸妝洗顏',48,1,10,10);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4083,'個人清潔','卸妝洗顏',49,2,1,3);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4084,'個人清潔','口腔清潔用品',44,1,2,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4085,'個人清潔','口腔清潔用品',44,2,1,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4086,'個人清潔','沐浴用品',45,1,2,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4087,'個人清潔','沐浴用品',46,1,2,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4088,'個人清潔','沐浴用品',45,2,1,7);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4089,'個人清潔','刮鬍用品',49,2,4,5);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4090,'個人清潔','刮鬍用品',48,2,5,5);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4091,'個人清潔','洗髮保養',47,1,2,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4092,'個人清潔','洗髮保養',47,2,1,8);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4093,'個人清潔','洗髮保養',46,2,1,9);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4094,'衛生紙','面紙/濕紙巾',47,1,1,1);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4095,'營養保健食品','保健食品/維他命/營養補充食品',43,1,10,12);
INSERT INTO `online_carrefour` (`online_goods_id`,`online_category`,`online_subcategory`,`area`,`aisle`,`cabinet_begining`,`cabinet_end`) VALUES (4096,'營養保健食品','保健食品/維他命/營養補充食品',0,0,13,13);
