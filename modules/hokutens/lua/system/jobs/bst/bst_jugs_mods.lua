-------------------------------------------
-- Fixes null error coming from onAttachmentUnequip for Regen/Refresh attachments
-------------------------------------------
require("modules/module_utils")
require("scripts/globals/utils")
-------------------------------------------

local m = Module:new("bst_jugs_mods")

local modTable =
{
  -- Subskill, mod, value
    {21,  xi.mod.ACC, 30}, -- Sheep Familiar
    {21,  xi.mod.DEF, 45},
    {21,  xi.mod.ATT, 88},
    {21,  xi.mod.DEFP, 10},
    {22,  xi.mod.ACC, 30}, -- Hare Familiar
    {22,  xi.mod.DEF, 45},
    {22,  xi.mod.ATT, 88},
    {22,  xi.mod.DEFP, 10},
    {23,  xi.mod.ACC, 30}, -- Crab Familiar
    {23,  xi.mod.ATT, 35},
    {23,  xi.mod.DEF, 105},
    {23,  xi.mod.ENMITY, 10},
    {23,  xi.mod.DEFP, 10},
    {24,  xi.mod.ACC, 30}, -- Courier Carrie
    {24,  xi.mod.ATT, 35},
    {24,  xi.mod.DEF, 105},
    {24,  xi.mod.ENMITY, 15},
    {24,  xi.mod.DEFP, 10},
    {25,  xi.mod.ACC, 30}, -- Homunculus
    {25,  xi.mod.EVA, 45},
    {25,  xi.mod.ATT, 88},
    {25,  xi.mod.DEFP, 10},
    {26,  xi.mod.ACC, 30}, -- Flytrap Familiar
    {26,  xi.mod.DEF, 45},
    {26,  xi.mod.ATT, 88},
    {26,  xi.mod.DEFP, 10},
    {27,  xi.mod.ACC, 30}, -- Tiger Familiar
    {27,  xi.mod.DEF, 45},
    {27,  xi.mod.ATT, 88},
    {27,  xi.mod.DEFP, 10},
    {28,  xi.mod.ACC, 30}, -- Flowerpot Bill
    {28,  xi.mod.EVA, 45},
    {28,  xi.mod.ATT, 88},
    {28,  xi.mod.DEFP, 10},
    {29,  xi.mod.ACC, 30}, -- Eft Familiar
    {29,  xi.mod.DEF, 45},
    {29,  xi.mod.ATT, 88},
    {29,  xi.mod.DEFP, 10},
    {30,  xi.mod.ACC, 30}, -- Lizard Familiar
    {30,  xi.mod.DEF, 45},
    {30,  xi.mod.ATT, 88},
    {30,  xi.mod.DEFP, 10},
    {31,  xi.mod.ACC, 30}, -- Mayfly Familiar
    {31,  xi.mod.DEF, 45},
    {31,  xi.mod.ATT, 88},
    {31,  xi.mod.DEFP, 10},
    {32,  xi.mod.ACC, 30}, -- Funguar Familiar
    {32,  xi.mod.DEF, 45},
    {32,  xi.mod.ATT, 88},
    {32,  xi.mod.DEFP, 10},
    {33,  xi.mod.ACC, 30}, -- Beetle Familiar
    {33,  xi.mod.ATT, 35},
    {33,  xi.mod.DEF, 105},
    {33,  xi.mod.ENMITY, 10},
    {33,  xi.mod.DEFP, 10},
    {34,  xi.mod.ACC, 30}, -- Antlion Familiar
    {34,  xi.mod.DEF, 45},
    {34,  xi.mod.ATT, 88},
    {24,  xi.mod.DEFP, 10},
    {35,  xi.mod.ACC, 30}, -- Mite Familiar
    {35,  xi.mod.ATT, 113},
    {35,  xi.mod.DEFP, 10},
    {36,  xi.mod.ACC, 30}, -- Lullaby Melodia
    {36,  xi.mod.DEF, 45},
    {36,  xi.mod.ATT, 88},
    {36,  xi.mod.DEFP, 10},
    {37,  xi.mod.ACC, 30}, -- Keeneared Steffi
    {37,  xi.mod.DEF, 45},
    {37,  xi.mod.ATT, 88},
    {37,  xi.mod.DEFP, 10},
    {38,  xi.mod.ACC, 30}, -- Flowerpot Ben
    {38,  xi.mod.EVA, 45},
    {38,  xi.mod.ATT, 88},
    {38,  xi.mod.DEFP, 10},
    {39,  xi.mod.ACC, 30}, -- Saber Siravarde
    {39,  xi.mod.DEF, 45},
    {39,  xi.mod.ATT, 88},
    {39,  xi.mod.DEFP, 10},
    {40,  xi.mod.ACC, 30}, -- Coldblood Como
    {40,  xi.mod.DEF, 45},
    {40,  xi.mod.ATT, 88},
    {40,  xi.mod.DEFP, 10},
    {41,  xi.mod.ACC, 30}, -- Shellbuster Orob
    {41,  xi.mod.DEF, 45},
    {41,  xi.mod.ATT, 88},
    {41,  xi.mod.DEFP, 10},
    {42,  xi.mod.ACC, 30}, -- Voracious Audrey
    {42,  xi.mod.DEF, 45},
    {42,  xi.mod.ATT, 88},
    {42,  xi.mod.DEFP, 10},
    {43,  xi.mod.ACC, 30}, -- Ambusher Allie
    {43,  xi.mod.DEF, 45},
    {43,  xi.mod.ATT, 88},
    {43,  xi.mod.DEFP, 10},
    {44,  xi.mod.ACC, 30}, -- Lifedrinker Lars
    {44,  xi.mod.ATT, 113},
    {44,  xi.mod.DEFP, 10},
    {45,  xi.mod.ACC, 30}, -- Panzer Galahad
    {45,  xi.mod.ATT, 35},
    {45,  xi.mod.DEF, 105},
    {45,  xi.mod.ENMITY, 15},
    {45,  xi.mod.DEFP, 10},
    {46,  xi.mod.ACC, 30}, -- Chopsuey Chucky
    {46,  xi.mod.DEF, 45},
    {46,  xi.mod.ATT, 88},
    {46,  xi.mod.DEFP, 10},
    {47,  xi.mod.ACC, 30}, -- Amigo Sabotender
    {47,  xi.mod.DEF, 45},
    {47,  xi.mod.ATT, 88},
    {47,  xi.mod.DEFP, 10},
    {68,  xi.mod.ACC, 30}, -- Turbid Toloi
    {68,  xi.mod.DEF, 45},
    {68,  xi.mod.ATT, 88},
    {68,  xi.mod.DEFP, 10},
    {100, xi.mod.ACC, 30}, -- Dirty Sanchez
    {100, xi.mod.DEF, 45},
    {100, xi.mod.ATT, 88},
    {100,  xi.mod.DEFP, 10},
}

m:addOverride("xi.actions.abilities.call_beast.onUseAbility", function(player, target, ability)
    local petSubSkill = player:getWeaponSubSkillType(xi.slot.AMMO)
    xi.pet.spawnPet(player, petSubSkill)
    player:removeAmmo()
    player:addRecast(xi.recast.ABILITY, 102, 1)
    
    -- Add mod overrides to pet
    local petEntity = player:getPet()
    for i = 1, #modTable do
        if petSubSkill == modTable[i][1] then
            petEntity:addMod(modTable[i][2],modTable[i][3])
        end
    end
end)

m:addOverride("xi.actions.abilities.bestial_loyalty.onUseAbility", function(player, target, ability)
    local petSubSkill = player:getWeaponSubSkillType(xi.slot.AMMO)
    xi.pet.spawnPet(player, petSubSkill)
    
    -- Add mod overrides to pet
    local petEntity = player:getPet()
    for i = 1, #modTable do
        if petSubSkill == modTable[i][1] then
            petEntity:addMod(modTable[i][2],modTable[i][3])
        end
    end
end)

return m
