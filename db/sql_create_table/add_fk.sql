
SET FOREIGN_KEY_CHECKS=0;
SET GLOBAL FOREIGN_KEY_CHECKS=0;

alter TABLE fia_disease5 
add constraint fk_fia_disease5_disease_id
foreign key(`disease_id`)
references `disease2`(`disease_id`)
on delete restrict 
on update cascade ,

add constraint fk_fia_disease5_fia_id
foreign key(`fia_id`)
references `food_ingredients_and_additives4`(`fia_id`)
on delete restrict 
on update cascade ;
