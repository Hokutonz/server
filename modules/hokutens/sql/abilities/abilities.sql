# Adjust Pet Timers
# Call Wyvern set to 5 mins
UPDATE `abilities` SET `recastTime`=300 WHERE  `abilityId`=61;
# Activate set to 5 mins
UPDATE `abilities` SET `recastTime`=300 WHERE  `abilityId`=136;
# Repair set to 2 mins
UPDATE `abilities` SET `recastTime`=120 WHERE  `abilityId`=137;
# Maintenance to 1 min
UPDATE `abilities` SET `recastTime`=60 WHERE  `abilityId`=322;
# Update Haste Samba to lvl 37
UPDATE `abilities` SET `level`='37' WHERE  `abilityId`=189;


# Update Mana Wall to BLM75
##UPDATE `abilities` SET `level`='75' WHERE  `abilityId`=254;
# Update Restraint to WAR75
##UPDATE `abilities` SET `level`='75' WHERE  `abilityId`=252;
# Update Perfect Counter to MNK75
##UPDATE `abilities` SET `level`='75' WHERE  `abilityId`=253;
# Update Divine Caress to WHM75
##UPDATE `abilities` SET `level`='75' WHERE  `abilityId`=270;