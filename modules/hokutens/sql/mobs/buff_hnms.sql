UPDATE `mob_groups` SET `minLevel` = "97", `maxLevel` = "97" WHERE `name` = "Jormungand" AND `zoneid` = "5";
UPDATE `mob_groups` SET `minLevel` = "97", `maxLevel` = "97" WHERE `name` = "Tiamat" AND `zoneid` = "7";
UPDATE `mob_groups` SET `minLevel` = "97", `maxLevel` = "97" WHERE `name` = "Vrtra" AND `zoneid` = "190";
UPDATE `mob_groups` SET `minLevel` = "92", `maxLevel` = "92" WHERE `name` = "Behemoth" AND `zoneid` = "127";
UPDATE `mob_groups` SET `minLevel` = "92", `maxLevel` = "92" WHERE `name` = "Adamantoise" AND `zoneid` = "128";
UPDATE `mob_groups` SET `minLevel` = "92", `maxLevel` = "92" WHERE `name` = "Fafnir" AND `zoneid` = "154";
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "King_Behemoth" AND `zoneid` = "127";
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "Aspidochelone" AND `zoneid` = "128";
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "Nidhogg" AND `zoneid` = "154";
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "Kirin" AND `zoneid` = "178";
UPDATE `mob_groups` SET `minLevel` = "90", `maxLevel` = "90" WHERE `name` = "Genbu" AND `zoneid` = "130";
UPDATE `mob_groups` SET `minLevel` = "90", `maxLevel` = "90" WHERE `name` = "Seiryu" AND `zoneid` = "130";
UPDATE `mob_groups` SET `minLevel` = "90", `maxLevel` = "90" WHERE `name` = "Byakko" AND `zoneid` = "130";
UPDATE `mob_groups` SET `minLevel` = "90", `maxLevel` = "90" WHERE `name` = "Suzaku" AND `zoneid` = "130";
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "King_Vinegarroon" AND `zoneid` = "125";
UPDATE `mob_groups` SET `minLevel` = "90", `maxLevel` = "90" WHERE `name` = "Cerberus" AND `zoneid` = "61";
-- Gurfurlur_the_Menacing
UPDATE `mob_family_system` SET `detects` = "2" WHERE `familyID` = "326";
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "Gurfurlur_the_Menacing" AND `zoneid` = "62";
UPDATE `mob_groups` SET `HP` = "95000" WHERE `groupid` = "47" AND `name` = "Gurfurlur_the_Menacing";
-- Medusa
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "Medusa" AND `zoneid` = "54";
UPDATE `mob_groups` SET `HP` = "95000" WHERE `groupid` = "83" AND `name` = "Medusa";
UPDATE `mob_pools` SET `familyid` = "469" WHERE `name` = "Medusa" and `poolid` = "2606";
UPDATE `mob_family_system` SET `detects` = "2" WHERE `familyID` = "469";
UPDATE `mob_family_system` SET `mobradius` = "4" WHERE `familyID` = "469";
-- Gulool_Ja_Ja
UPDATE `mob_groups` SET `minLevel` = "95", `maxLevel` = "95" WHERE `name` = "Gulool_Ja_Ja" AND `zoneid` = "65";
UPDATE `mob_groups` SET `HP` = "95000" WHERE `groupid` = "54" AND `name` = "Gulool_Ja_Ja";
-- Add Sleep Immunity to HNMs
-- Aspid and Adamantoise Immune by default
-- EDIT: This shit don't work anyways...
-- UPDATE mob_pools SET immunity = "26" WHERE name = "Behemoth";
-- UPDATE mob_pools SET immunity = "26" WHERE name = "King_Behemoth";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "Fafnir";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "Nidhogg";
-- UPDATE mob_pools SET immunity = "8" WHERE name = "Khimaira";
-- UPDATE mob_pools SET immunity = "4" WHERE name = "Cerberus";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "Hydra";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "Vrtra";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "Tiamat";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "Jormungand";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "Gurfurlur_the_Menacing";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "Gulool_Ja_Ja";
-- UPDATE mob_pools SET immunity = "1" WHERE name = "King_Vinegarroon";
