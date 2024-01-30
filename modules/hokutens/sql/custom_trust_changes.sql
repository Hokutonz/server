-- Change Elviras default jobs
UPDATE mob_pools SET mJob = 17 WHERE poolid = "1198" AND `name` = 'Elivira';
UPDATE mob_pools SET mJob = 17 WHERE poolid = "5941" AND `name` = 'Elivira';

-- Mob Skill List Elivira
DELETE FROM mob_skill_lists WHERE skill_list_id = "1056";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Elivira',1056,1201);  -- Coronach (Elivira)
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Elivira',1056,212);   -- Slug Shot (Elivira)
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Elivira',1056,214);   -- Heavy Shot (Elivira)
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Elivira',1056,209);   -- Split Shot (Elivira)
update mob_skills set primary_sc = 14 where mob_skill_id = 1201; -- made where Coronach can WS
update mob_skills set secondary_sc = 12 where mob_skill_id = 1201; -- made where Coronach can WS

-- Mob Skill List Halver
DELETE FROM mob_skill_lists WHERE skill_list_id = "1087";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Halver',1087,114);  -- Raiden Thrust
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Halver',1087,116);  -- Penta Thrust
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Halver',1087,120);  -- Impulse Drive

-- Maximilian job change
UPDATE mob_pools SET sJob = "13" WHERE poolid = "5975" AND `name` = 'maximilian';

-- Mob Skill List for Maximilian
DELETE FROM mob_skill_lists WHERE skill_list_id = "1090";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Maximilian',1090,32);  -- Fast Blade
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Maximilian',1090,40);  -- Vorpal Blade
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Maximilian',1090,41);  -- Swift Blade

-- Mob Spell List for Maximilian
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "388";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Maximilian',388,338,12,255);       -- Utsusemi: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Maximilian',388,339,37,255);       -- Utsusemi: Ni

-- Mob Skills Mayakov
DELETE FROM mob_skill_lists WHERE skill_list_id = "1081";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mayakov',1081,41); -- Swift Blade
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mayakov',1081,40);  -- Vorpal Blade
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mayakov',1081,42);  -- Savage Blade

-- Mob Skills Leonoyne
DELETE FROM mob_skill_lists WHERE skill_list_id = "1089";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Leonoyne',1089,60); -- Resolution
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Leonoyne',1089,56); -- Ground Strike
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Leonoyne',1089,55); -- Spinning Slash
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Leonoyne',1089,58); -- Herculean Strike

-- Mob Skills Gilgamesh
DELETE FROM mob_skill_lists WHERE skill_list_id = "1053";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Gilgamesh',1053,3434); -- Tachi Kamai
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Gilgamesh',1053,3435); -- Iainuki
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Gilgamesh',1053,3436); -- Tachi Gotem
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Gilgamesh',1053,3437); -- Tachi Kasha

-- Mob Spells Leonoyne
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "387";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,149,20,255); -- Blizzard
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,150,46,255); -- Blizzard II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,151,66,255); -- Blizzard III
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,164,21,255); -- Thunder
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,165,46,255); -- Thunder II
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Leonoyne',387,166,66,255); -- Thunder III

-- Mob Skills Matsui-P
DELETE FROM mob_skill_lists WHERE skill_list_id = "1148";
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,128); -- Blade: Rin
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,129); -- Blade: Retsu
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,133); -- Blade: Ei
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,134); -- Blade: Jin
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,135); -- Blade: Ten
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,136); -- Blade: Ku
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,141); -- Blade: Shun
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Matsui-P',1148,138); -- Blade: Kamu

-- Mob Spell List Matsui-P
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "435";
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,144,26,255); -- Fire
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,149,34,255); -- Blizzard
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,154,18,255); -- Aero
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,159,1,255);  -- Stone
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,164,42,255); -- Thunder
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,169,10,255); -- Water
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,245,24,255); -- Drain
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,247,50,255); -- Aspir
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,252,90,255); -- Stun
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,320,15,255); -- Katon: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,321,40,255); -- Katon: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,322,75,255); -- Katon: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,323,15,255); -- Hyoton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,324,40,255); -- Hyoton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,325,75,255); -- Hyoton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,326,15,255); -- Huton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,327,40,255); -- Huton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,328,75,255); -- Huton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,329,15,255); -- Doton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,330,40,255); -- Doton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,331,75,255); -- Doton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,332,15,255); -- Raiton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,333,40,255); -- Raiton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,334,75,255); -- Raiton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,335,15,255); -- Suiton: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,336,40,255); -- Suiton: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,337,75,255); -- Suiton: San
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,338,12,255); -- Utsusemi: Ichi
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,339,37,255); -- Utsusemi: Ni
INSERT INTO `mob_spell_lists` VALUES ('TRUST_Matsui-P',435,340,99,255); -- Utsusemi: San

-- Override Lhu Mhakaracca and replace with Matsui-p
UPDATE mob_pools SET sJob = "4" WHERE poolid = "5943" AND name = 'lhu_mhakaracca';
UPDATE mob_pools SET mJob = "13" WHERE poolid = "5943" AND name = 'lhu_mhakaracca';
UPDATE mob_pools SET skill_list_id = "1148" WHERE poolid = "5943" AND name = 'lhu_mhakaracca';
UPDATE mob_pools SET spellList = "455" WHERE poolid = "5943" AND name = 'lhu_mhakaracca';

-- Mob Skills Lady Lilith
DELETE FROM mob_skill_lists WHERE skill_list_id = "5019";
DELETE FROM `mob_spell_lists` WHERE spell_list_id = "422";
DELETE FROM `mob_skills` WHERE mob_skill_id = "4205";
DELETE FROM `mob_skills` WHERE mob_skill_id = "4206";
DELETE FROM `mob_skills` WHERE mob_skill_id = "4207";

-- Update August skills
UPDATE `mob_skills` SET `mob_anim_id` = 2461 WHERE `mob_skill_id` = 3652; -- (Timer: 3min) daybreak
UPDATE `mob_skills` SET `mob_anim_id` = 2462 WHERE `mob_skill_id` = 3653; -- tartaric_sigil
UPDATE `mob_skills` SET `mob_skill_name` = "null_field", `mob_anim_id` = 2463 WHERE `mob_skill_id` = 3654; -- null_field
UPDATE `mob_skills` SET `mob_anim_id` = 2464 WHERE `mob_skill_id` = 3655; -- alabaster_burst
UPDATE `mob_skills` SET `mob_anim_id` = 2465 WHERE `mob_skill_id` = 3656; -- (daybreak) noble_frenzy
UPDATE `mob_skills` SET `mob_anim_id` = 2466 WHERE `mob_skill_id` = 3657; -- (daybreak) fulminous_fury
UPDATE `mob_skills` SET `mob_skill_name` = "no_quarter", `mob_anim_id` = 2467 WHERE `mob_skill_id` = 3658; -- (daybreak) no_quarter
DELETE FROM `mob_skill_lists` WHERE skill_list_id = "1099";
INSERT INTO `mob_skill_lists` VALUES ('August_Skills',1099,3653);
INSERT INTO `mob_skill_lists` VALUES ('August_Skills',1099,3654);
INSERT INTO `mob_skill_lists` VALUES ('August_Skills',1099,3655);

-- Mob Skills Mumor II
INSERT INTO `mob_skills` VALUES (2904, 450, 'final_eternal_heart', 0, 7.0, 2000, 0, 4, 0, 0, 0, 0, 0, 0);
INSERT INTO `mob_skill_lists` VALUES ('TRUST_Mumor_II', 1130, 2904);