# Update Dual Wield on THF
UPDATE `traits` SET `level`='10' WHERE  `traitid`=18 AND `job`=6 AND `level`=83 AND `rank`=1 AND `modifier`=259;
UPDATE `traits` SET `level`='50' WHERE  `traitid`=18 AND `job`=6 AND `level`=90 AND `rank`=1 AND `modifier`=259;
UPDATE `traits` SET `level`='75' WHERE  `traitid`=18 AND `job`=6 AND `level`=98 AND `rank`=1 AND `modifier`=259;

# Update Dual Wield on DNC
UPDATE `traits` SET `level`='10' WHERE  `traitid`=18 AND `job`=19 AND `level`=20 AND `rank`=1 AND `modifier`=259;
UPDATE `traits` SET `level`='25' WHERE  `traitid`=18 AND `job`=19 AND `level`=40 AND `rank`=1 AND `modifier`=259;
UPDATE `traits` SET `level`='45' WHERE  `traitid`=18 AND `job`=19 AND `level`=60 AND `rank`=1 AND `modifier`=259;
UPDATE `traits` SET `level`='65' WHERE  `traitid`=18 AND `job`=19 AND `level`=80 AND `rank`=1 AND `modifier`=259;

# Update Stout Servant to BST75
UPDATE `traits` SET `level`='75' WHERE  `traitid`=103 AND `job`=9 AND `level`=78 AND `rank`=1 AND `modifier`=0;

# Update Crit Atk Bonus to WAR75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=98 AND `job`=1 AND `level`=78 AND `rank`=1 AND `modifier`=421;

# Update Tactical Guard to MNK75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=101 AND `job`=2 AND `level`=77 AND `rank`=1 AND `modifier`=899;

# Update Auto Regen II to WHM75 and set to 5 HP
UPDATE `xidb`.`traits` SET `level`='75', `value`='5', `content_tag`=NULL WHERE  `traitid`=9 AND `job`=3 AND `level`=76 AND `rank`=2 AND `modifier`=370;

# Update Conserve MP II to BLM75 and set to 35
UPDATE `xidb`.`traits` SET `level`='75', `value`='35', `content_tag`=NULL WHERE  `traitid`=13 AND `job`=4 AND `level`=76 AND `rank`=2 AND `modifier`=296;

# Update Fast Cast IV to RDM75 and set to 30
UPDATE `traits` SET `level`='75', `value`='30', `content_tag`=NULL WHERE  `traitid`=12 AND `job`=5 AND `level`=76 AND `rank`=4 AND `modifier`=170;

# Update Evasion Bonus V to THF75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=2 AND `job`=6 AND `level`=76 AND `rank`=5 AND `modifier`=68;

# Update Defense Bonus V to PLD75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=4 AND `job`=7 AND `level`=76 AND `rank`=5 AND `modifier`=1;

# Update Attack / Ranged Attack Bonus V to DRK75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=3 AND `job`=8 AND `level`=76 AND `rank`=5 AND `modifier`=23;
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=3 AND `job`=8 AND `level`=76 AND `rank`=5 AND `modifier`=24;

# Update Resist Silence V to BRD75 and set to 50
UPDATE `traits` SET `level`='75', `value`='50', `content_tag`=NULL WHERE  `traitid`=52 AND `job`=10 AND `level`=81 AND `rank`=5 AND `modifier`=244;

# Update Dead Aim IV to RNG75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=113 AND `job`=11 AND `level`=80 AND `rank`=4 AND `modifier`=964;

# Update Skillchain Bonus I to SAM75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=106 AND `job`=12 AND `level`=78 AND `rank`=1 AND `modifier`=174;

# Update Tactical Parry I to NIN75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=100 AND `job`=13 AND `level`=77 AND `rank`=1 AND `modifier`=486;

# Update Accuracy / Ranged Accuracy Bonus III at DRG75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=1 AND `job`=14 AND `level`=78 AND `rank`=3 AND `modifier`=25;
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=1 AND `job`=14 AND `level`=78 AND `rank`=3 AND `modifier`=26;

# Update Max MP Boost V at SMN75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=8 AND `job`=15 AND `level`=76 AND `rank`=5 AND `modifier`=5;

# Update Rapid Shot II at COR75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=11 AND `job`=17 AND `level`=91 AND `rank`=2 AND `modifier`=359;

# Update Martial Arts IV at PUP75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=23 AND `job`=18 AND `level`=87 AND `rank`=4 AND `modifier`=173;

# Update Conserve TP I at DNC75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=108 AND `job`=19 AND `level`=77 AND `rank`=1 AND `modifier`=944;

# Update Occult Acumen I at SCH75
UPDATE `traits` SET `level`='75', `content_tag`=NULL WHERE  `traitid`=109 AND `job`=20 AND `level`=78 AND `rank`=1 AND `modifier`=902;