# Adjust Pet Timers
# Call Wyvern set to 5 mins
UPDATE `abilities` SET `recastTime`=300 WHERE  `abilityId`=61;
# Activate set to 5 mins
UPDATE `abilities` SET `recastTime`=300 WHERE  `abilityId`=136;
# Repair set to 2 mins
UPDATE `abilities` SET `recastTime`=120 WHERE  `abilityId`=137;
# Maintenance to 1 min
UPDATE `abilities` SET `recastTime`=60 WHERE  `abilityId`=322;