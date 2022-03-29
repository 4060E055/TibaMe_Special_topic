#SELECT * FROM example.fia_disease5;
#UPDATE `food_ingredients_and_additives4` SET `food_ingredients_and_additives` = '羅漢果醣苷萃取物'  WHERE `fia_id` = '3071'  ;
#UPDATE `food_ingredients_and_additives4` SET `food_ingredients_and_additives` = '甜菊醣苷'  WHERE `fia_id` = '3080'  ;



select d.disease, fia.food_ingredients_and_additives
from fia_disease5 fiad 
left join disease2 d on fiad.disease_id = d.disease_id
left join food_ingredients_and_additives4 fia on fiad.fia_id = fia.fia_id
