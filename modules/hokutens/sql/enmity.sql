# Update Enmity on certain abilities
# Provoke
UPDATE `xidb`.`abilities` SET `CE`='500', `VE`='3000' WHERE  `abilityId`=35;
# Sentinel
UPDATE `xidb`.`abilities` SET `CE`='300', `VE`='1500' WHERE  `abilityId`=48;
# Rampart
UPDATE `xidb`.`abilities` SET `CE`='500', `VE`='1500' WHERE  `abilityId`=92;
# Animated Flourish
UPDATE `xidb`.`abilities` SET `CE`='300', `VE`='2500' WHERE  `abilityId`=204;

# Update Enmity on certain spells
# Flash
UPDATE `xidb`.`spell_list` SET `CE`='300', `VE`='2500' WHERE  `spellid`=112;
