/*
-- Query: SELECT * FROM example.disease2
LIMIT 0, 2000

-- Date: 2022-03-25 17:30
*/
CREATE TABLE `disease2` (
`disease_id` int not null auto_increment comment '疾病編號' primary key,
`disease` varchar(10) comment '疾病'
)DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

INSERT INTO `disease2` (`disease_id`,`disease`) VALUES (2001,'新陳代謝症候群');
INSERT INTO `disease2` (`disease_id`,`disease`) VALUES (2002,'糖尿病');
INSERT INTO `disease2` (`disease_id`,`disease`) VALUES (2003,'高血脂');
INSERT INTO `disease2` (`disease_id`,`disease`) VALUES (2004,'腎臟病');
INSERT INTO `disease2` (`disease_id`,`disease`) VALUES (2005,'癌症');
