# Kill zoneline for Server Base
DELETE FROM `xidb`.`zonelines` WHERE  `zoneline`=812922746;

# Set zone settings for Mog House access
UPDATE `xidb`.`zone_settings` SET `zonetype`='1' WHERE  `zoneid`=281;
UPDATE `xidb`.`zone_settings` SET `misc`='616' WHERE  `zoneid`=281;

# Remove all original NPCs
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928208;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928209;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928210;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928211;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928212;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928213;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928214;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928215;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928216;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928217;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928218;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928219;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928224;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928225;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928245;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928252;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928254;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928255;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928256;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928264;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928265;
UPDATE `xidb`.`npc_list` SET `pos_rot`='0', `pos_x`='-126.000', `pos_y`='0.000', `pos_z`='0.000' WHERE  `npcid`=17928275;