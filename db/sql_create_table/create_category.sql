
CREATE TABLE `category` (
`area` int not null auto_increment primary key,
`category` varchar(15),
`category_english` varchar(40),
`aisle1_left` varchar(10),
`aisle1_left_english` varchar(30),
`aisle2_right` varchar(30),
`aisle2_right_english` varchar(50)
)DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (-1,'-1','','','','','');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (1,'0','','','','','');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (43,'衛生棉','Feminine Hyglene','衛生棉','Feminine Hyglene','衛生棉','Feminine Hyglene');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (44,'口腔照護','Oral Care','牙刷/口腔照護','Toothbrush/Oral Care','牙膏/漱口水','Toothpaste/Mouth Rinse');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (45,'沐浴乳','Shower Gel','沐浴乳','Shower Gel','沐浴乳','Shower Gel');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (46,'染髮/造型/香皂/洗手乳','Hair Colorant/Styling/Soap/Hand Soap','香皂/洗手乳','Soap/Hand Soap','染髮劑/造型','Hair Colorant/Styling');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (47,'洗髮乳','Shampoo','洗髮乳/潤髮乳','Shampoo/Conditioner','洗髮乳/潤髮乳','Shampoo/Conditioner');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (48,'臉部清潔','Facial Cleaning','臉部清潔','Facial Cleaning','乳液','Body Lotion');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (49,'臉部保養','Facial Care','臉部保養','Facial Care','彩妝/刮鬍用品','Make Up/Shaving');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (51,'碳酸飲料/咖啡','Carbonate Soda Drink/Coffee','碳酸飲料','Carbonate Soda Drink','健康飲品/運動飲料','Healthy Drink/Sport Drink');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (53,'茶','Tea','茶飲','Tea','茶飲','Tea');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (55,'果汁/水','Juice/Water','果汁','Juice','水','Water');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (57,'洋芋片/點心','Chips/Snacks','洋芋片','Chips','點心','Snacks');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (59,'餅乾','Cookies','點心','Snacks','米果/蘇打餅乾','Rice Cracker/Salty Cracker');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (61,'派/泡芙/糕點','Pie/Puff/Cakes','威化餅/捲心蘇','Wafer/Roll','糕餅/派/泡芙','Cake/Pie/Puff');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (63,'糖果/餅乾','Candy/Cookies','餅乾','Cookies','糖果/果凍','Candy/Jelly');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (65,'休閒食品','Confection','肉乾/豆乾','Dried Food/Bean Curd','堅果','Nuts');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (67,'海苔/巧克力/果乾','Seaweed/Chocolate/Dry Friut','海苔/果乾','Seaweed/Dry Fruit & Vegetable','巧克力/果乾','Chocolate/Dry Fruit & Vegetable');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (69,'茶/咖啡','Tea/Coffee','茶','Tea','咖啡/奶精','Coffee/Cream');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (71,'麵條/泡麵','Noodles','麵條','Cooking Noodles','泡麵(碗)','Instant Noodles(Bowl)');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (73,'泡麵/湯品','Noodles/Soup','湯品/泡麵(包)','Soup/Instant Noodles(Pack)','泡麵(包)','Instant Noodles(Pack)');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (75,'罐頭食品','Canned Food','罐頭食品','Canned Food','罐頭食品','Canned Food');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (76,'醋/醬油/醬料','Vinegar/Soya Sauce/Sauce','醬料/醋','Sauce/Vinegar','醬油','Soya Sauce');
INSERT INTO `category` (`area`,`category`,`category_english`,`aisle1_left`,`aisle1_left_english`,`aisle2_right`,`aisle2_right_english`) VALUES (77,'油/調味料','Oil/Seasoning','調味品/醋','Seasoning/Vinegar','油','Oil');

