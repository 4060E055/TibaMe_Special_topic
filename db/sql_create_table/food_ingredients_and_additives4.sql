/*
-- Query: SELECT * FROM example.food_ingredients_and_additives4
LIMIT 0, 2000

-- Date: 2022-03-25 17:32
*/
CREATE TABLE `food_ingredients_and_additives4` (
`fia_id` int not null auto_increment comment '食品成分添加物編號' primary key,
`food_ingredients_and_additives` varchar(20) comment '食品成分添加物中文品名',
`food_additives_and_ingredients_eng` varchar(50) comment '食品成分添加物英文品名',
`Description` varchar(80) comment '詳細說明'

)DEFAULT CHARSET utf8mb4 COLLATE utf8mb4_0900_ai_ci;


INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3001,'葡萄糖漿','Dextrose Syrup','因為高GI易使血糖快速上升引起血糖調節問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3002,'高果玉米糖漿','High Fructose Corn Syrup','因為富含果糖消化較快易囤積在肝中引起血糖調節出現問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3003,'蔗糖','Cane Sugar','因為高GI易使血糖快速上升引起血糖調節問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3004,'轉化糖漿','Invert Syrup','因為高GI易使血糖快速上升引起血糖調節問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3005,'完全氫化椰子油','Hydrogenated Coconut Oil','人工合成的飽和脂肪酸會產生反式脂肪，而其會造成糖尿病、心血管疾病的上升、容易發胖、降低記憶力等多重健康問題。');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3006,'玉米糖膠','Xanthan Gum','因為高GI易使血糖快速上升引起血糖調節問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3007,'酒精','Alcohol','造成肝負擔及長期會引起脂肪肝引起血糖及血脂調節的問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3008,'砂糖','Sugar','易引起血糖快速升高引起血糖調節問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3009,'棕櫚油','Palm Oil','因飽和脂肪易引起血脂升高');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3010,'脂肪酸甘油酯','Glycerin Fatty Acid Ester (Mono-and Diglycerides)','因脂肪酸甘油酯過多會引起血脂上升(VLDL及TG脂蛋白上升)使超過血脂標準(脂肪酸甘油酯>=150)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3011,'植物油','Vegetable Oil','因精煉油脂過程的高溫易引起2A及2B致癌物使體內細胞受損繼而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3012,'完全氫化棕櫚仁油','Fully Hydrogenated Palm Oil','人工合成的飽和脂肪酸會產生反式脂肪，而其會造成糖尿病、心血管疾病的上升、容易發胖、降低記憶力等多重健康問題。');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3013,'人造奶油','Oleo Oil','因為反式脂肪會降低HDL的標準使血中膽固醇升高引起血脂問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3014,'奶油','Butter ','因飽和脂肪含量高使血中TG過高的血脂問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3015,'鮮奶油','Cream','因反式脂肪及飽和脂肪含量高而引起血脂問題');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3016,'脂肪酸蔗糖酯','Sucrose Fatty Acid Ester','內含脂肪酸單甘油脂、蔗糖酯等，前者屬於脂肪類，反式脂肪酸較高，長期或大量使用，引起血脂上升，繼而引起新陳代謝症候群、心血管疾病引發風險');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3017,'脂肪酸山梨醇酐酯','Sorbitan Fatty Acid Ester','脂肪酸單甘油脂屬脂肪類，且反式脂肪酸高，易引起血脂升高，引起新陳代謝症候群，心血管疾病、高血壓患者，應該避免攝食。');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3018,'脂肪酸丙二醇酯','Propylene Glycol Fatty Acid Ester','為飽和脂肪會引起血脂上升因而引起新陳代謝症候群');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3019,'脂肪酸聚合甘油酯','Polyglycerol Esters ofFatty Acids','脂肪酸甘油酯內反式脂肪酸較高，長期或大量使用，可能對引發心血管疾病 、高血壓等疾病發作');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3020,'甘油二十二酸酯','Glyceryl Behenate','為飽和脂肪酸類引起血脂上升使造成新陳代謝症候群');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3021,'磷酸','Phosphoric Acid','易攝取過多血中鈣磷比失衡造成腎臟負擔(用量為0.6g/kg 以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3022,'磷酸二氫鉀','Potassium Phosphate','過多易引起腎功能負擔(Phosphate計為3g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3023,'磷酸二氫鈉','Sodium Phosphate, Monobasic','過多疑致高磷血症並誘發低鈣血症繼而引起腎臟功能損害(Phosphate計為3g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3024,'磷酸鉀','Potassium Phosphate， Tribasic','長期攝取過多磷酸鹽易導致骨質疏鬆及諸多慢性疾病，並會導致腎臟疾病惡化(用量以Phosphate 計為3g/kg 以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3025,'磷酸鈉','Sodium Phosphate， Tribasic','過多疑體內的FGF-23荷爾蒙過高時，會造成鈣的恆定失調、血管鈣化、加重慢性腎臟病期程，並且會有較高的死亡率(Phosphate 計為3g/kg 以下。)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3026,'酸性焦磷酸鈉','Disodium Dihydrogen Pyrophosphate','過多疑導致血液中的鈣離子降低，恐出現抽搐、抽筋，嚴重還會引起心律不整，加速腎臟病病程(Phosphate計為3g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3027,'偏磷酸鉀','Potassium Metaphosphate','易使血清磷提高引發鈣恆定失調，促使血管及微血管鈣化，易造成慢性腎臟病(Phosphate計為3g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3028,'偏磷酸鈉','Sodium Metaphosphate','易使血清磷提高引發鈣恆定失調，促使血管及微血管鈣化，易造成慢性腎臟病(Phosphate計為3g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3029,'多磷酸鉀','Potassium Polyphosphate','易使血清磷提高引發鈣恆定失調，促使血管及微血管鈣化，易造成慢性腎臟病(Phosphate計為3g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3030,'多磷酸鈉','Sodium Polyphosphate','易使血清磷提高引發鈣恆定失調，促使血管及微血管鈣化，易造成慢性腎臟病(Phosphate計為3g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3031,'己二烯酸','Sorbic Acid','高劑量的己二烯酸可能會細胞受損，甚至導致癌症(Sorbic Acid計為1.0g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3032,'己二烯酸鉀','Potassium Sorbate','高劑量易引起身體過敏反應，細胞生成受損引起致癌(Sorbic Acid計為1.0g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3033,'己二烯酸鈉','Sodium Sorbate','長期進行食用，實驗具有引發基因損害危險，繼而引起致癌(Sorbic Acid計為1.0g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3034,'丙酸鈣','Calcium Propionate','人體體內無法吸收，極易引起兒童注意力不集中及癌症的危險(Propionic Acid計為2.5g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3035,'丙酸鈉','Sodium Propionate','長期高劑量食用易有危險(Propionic Acid計為2.5g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3036,'去水醋酸','Dehydroacetic Acid','長期高劑量食用易引起腎損傷，引起癌症(Dehydroacetic Acid計為0.5g/kg以下。)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3037,'去水醋酸鈉','Sodium Dehydroacetate','長期動物實驗引起肝疾腎損傷，易引起肝腎癌症(Dehydroacetic Acid計為0.5g/kg以下。)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3038,'對羥苯甲酸乙酯','Ethylp-Hydroxybenzoate','為仿雌激素化合物，造成身體內賀爾蒙異常分泌，長期食用恐造成乳癌(p-Hydroxybenzoic Acid計為0.10g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3039,'對羥苯甲酸丙酯','Propyl p-Hydroxybenzoate','為仿雌激素化合物，造成身體內賀爾蒙異常分泌，長期食用恐造成乳癌(p-Hydroxybenzoic Acid計為0.10g/kg以下。 )');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3040,'對羥苯甲酸丁酯','Butylp-Hydroxybenzoate','為仿雌激素化合物，造成身體內賀爾蒙異常分泌，長期食用恐造成乳癌(p-Hydroxybenzoic Acid計為0.10g/kg以下。 )');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3041,'對羥苯甲酸異丙酯','Isopropylp-Hydroxybenzoate','為仿雌激素化合物，造成身體內賀爾蒙異常分泌，長期食用恐造成乳癌(p-Hydroxybenzoic Acid計為0.10g/kg以下。 )');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3042,'對羥苯甲酸異丁酯','Isobutylp-Hydroxybenzoate','為仿雌激素化合物，造成身體內賀爾蒙異常分泌，長期食用恐造成乳癌(p-Hydroxybenzoic Acid計為0.10g/kg以下。 )');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3043,'聯苯','Biphenyl','長期過量食用會引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3044,'二醋酸鈉','Sodium Diacetate（Sodium HydrogenDiacetate）','長期過量食用會引起癌症(計量0.05％以下。)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3045,'己二烯酸鈣','Calcium Sorbate','長期食用過量易引起癌症(Sorbic Acid計為1.0g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3046,'丙酸','Propionic Acid','長期食用防腐劑，將造成肝腎負擔與病變引起致癌Propionic Acid計為2.5g/kg以下');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3047,'對羥苯甲酸甲酯','Methyl Paraben','為仿雌激素化合物，造成身體內賀爾蒙異常分泌，長期食用恐造成乳癌(p-Hydroxybenzoic Acid計為0.10g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3048,'亞硫酸鉀','Potassium Sulfite','攝入超量的亞硫酸鹽，無法排出體外，可能會產生不同程度之過敏反應長期易引起(SO2殘留量計為0.03 g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3049,'亞硫酸鈉','Sodium Sulfite','攝入超量的亞硫酸鹽，無法排出體外，可能會產生不同程度之過敏反應長期易引起癌症(SO2殘留量計為0.03 g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3050,'亞硫酸氫鈉','Sodium Bisulfite','攝入超量的亞硫酸鹽，無法排出體外，可能會產生不同程度之過敏反應長期易引起癌症(SO2殘留量計為0.03 g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3051,'低亞硫酸鈉','Sodium Hydrosulfite','攝入超量的亞硫酸鹽，無法排出體外，可能會產生不同程度之過敏反應長期易引起癌症(SO2殘留量計為0.03 g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3052,'偏亞硫酸氫鉀','Potassium Metabisulfite','攝入超量的亞硫酸鹽，無法排出體外，可能會產生不同程度之過敏反應長期易引起癌症(SO2殘留量計為0.03 g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3053,'亞硫酸氫鉀','Potassium Bisulfite','攝入超量的亞硫酸鹽，無法排出體外，可能會產生不同程度之過敏反應長期易引起癌症(SO2殘留量計為0.03 g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3054,'偏亞硫酸氫鈉','Sodium Metabisulfite','攝入超量的亞硫酸鹽，無法排出體外，可能會產生不同程度之過敏反應長期易引起癌症(SO2殘留量計為0.03 g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3055,'阿斯巴甜','Aspartame','攝取過多易引起大腦腫瘤');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3056,'L-麩酸','L-Glutamic Acid','吃過多易引起肝損傷、肝細胞死亡，長期引起肝細胞突變繼而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3057,'L-麩酸鈉','Monosodium L-Glutamate','吃過多易引起肝損傷、肝細胞死亡，長期引起肝細胞突變繼而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3058,'二氧化鈦','Titanium Dioxide','研究顯示可能造成發炎誘發大腸腫瘤的形成，長期有引起癌症的風險。');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3059,'焦糖色素','Caramel Colors','研究顯示動物實驗有致癌性，長期人體食用恐引起癌症(用量為0.2 g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3060,'苯甲酸','Benzoic Acid','不宜過量食用恐引起細胞受損而引起癌症(限量Benzoic Acid計為1.0g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3061,'苯甲酸鈉','Sodium Benzoate','不宜過量食用恐引起細胞受損而引起癌症(限量Benzoic Acid計為1.0g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3062,'苯甲酸鉀','Potassium Benzoate','不宜過量食用恐引起細胞受損而引起癌症(限量Benzoic Acid計為1.0g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3063,'乳酸鏈球菌素','Nisin','不宜過量食用恐引起細胞受損而引起癌症(限量用量為0.25g/ kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3064,'鏈黴菌素','Natamycin(Pimaricin)','不宜過量食用恐引起細胞受損而引起癌症(限量用量在20 mg/kg 以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3065,'二丁基羥基甲苯','Dibutyl HydroxyToluene（BHT）','不宜過量食用恐引起細胞受損而引起癌症(限量0.010g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3066,'丁基羥基甲氧苯','Butyl HydroxyAnisole（BHA）','不宜過量食用恐引起細胞受損而引起癌症(限量用量為0.05g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3067,'沒食子酸丙酯','Propyl Gallate','不宜過量食用恐引起細胞受損而引起癌症(限量用量為0.10g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3068,'癒創樹脂','Guaiac Resin','不宜過量食用恐引起細胞受損而引起癌症(限量用量為1.0g/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3069,'乙烯二胺四醋酸二鈉或乙烯二胺四醋酸二鈉鈣','EDTA Na2 or EDTA CaNa2','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3070,'過氧化苯甲醯','Benzoyl Peroxide','不宜過量食用恐引起細胞受損而引起癌症(限量用量為20mg/kg以下)');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3071,'羅漢果醣苷萃取物','Mogroside Extract','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3072,'D-山梨醇','D-Sorbitol','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3073,'D-山梨醇液70％','D-Sorbitol Solution 70％','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3074,'D-木糖醇','D-Xylitol','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3075,'甘草素','Glycyrrhizin','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3076,'甘草酸鈉','Trisodium  Glycyrrhizinate','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3077,'D-甘露醇','D-Mannitol','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3078,'糖精','Saccharin','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3079,'糖精鈉鹽','Sodium Saccharin','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3080,'甜菊醣苷','Steviol Glycoside','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3081,'甘草萃','Licorice Extracts','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3082,'醋磺內酯鉀','Acesulfame Potassium','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3083,'甘草酸銨','Ammoniated Glycyrrhizin','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3084,'甘草酸一銨','Monoammonium Glycyrrhizinate','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3085,'麥芽糖醇','Maltitol','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3086,'乳糖醇','Lactitol','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3087,'單尿甘酸甘草酸','Monoglucuronyl Glycyrrhetic Acid','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3088,'索馬甜','Thaumatin','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3089,'赤藻糖醇','Erythritol','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3090,'蔗糖素','Sucralose','不宜過量食用恐引起細胞受損而引起癌症');
INSERT INTO `food_ingredients_and_additives4` (`fia_id`,`food_ingredients_and_additives`,`food_additives_and_ingredients_eng`,`Description`) VALUES (3091,'紐甜','Neotame','不宜過量食用恐引起細胞受損而引起癌症');
