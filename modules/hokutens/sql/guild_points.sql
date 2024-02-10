# Update all Guild Points to be based off rank
UPDATE `xidb`.`guild_item_points` SET `max_points`='2500' WHERE  `rank`=0;
UPDATE `xidb`.`guild_item_points` SET `max_points`='5000' WHERE  `rank`=1;
UPDATE `xidb`.`guild_item_points` SET `max_points`='7500' WHERE  `rank`=2;
UPDATE `xidb`.`guild_item_points` SET `max_points`='10000' WHERE  `rank`=3;
UPDATE `xidb`.`guild_item_points` SET `max_points`='12500' WHERE  `rank`=4;
UPDATE `xidb`.`guild_item_points` SET `max_points`='15000' WHERE  `rank`=5;
UPDATE `xidb`.`guild_item_points` SET `max_points`='17500' WHERE  `rank`=6;
UPDATE `xidb`.`guild_item_points` SET `max_points`='20000' WHERE  `rank`=7;
UPDATE `xidb`.`guild_item_points` SET `max_points`='22500' WHERE  `rank`=8;
UPDATE `xidb`.`guild_item_points` SET `max_points`='25000' WHERE  `rank`=9;