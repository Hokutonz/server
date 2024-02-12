-- Octave club setup
DELETE FROM item_latents WHERE itemId = "18852"; -- remove job divisor latent from octave club
DELETE FROM item_weapon WHERE itemID = "18852"; -- remove stats from octave club
INSERT INTO item_weapon VALUES (18852,'octave_club',11,0,0,0,0,3,8,264,11,0); -- add kraken club stats to octave club