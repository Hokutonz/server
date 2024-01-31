require("modules/module_utils")
require("scripts/globals/utils")
-----------------------------------
local m = Module:new("beastmaster_adjustments")

local bstAbilities =
{
    -- Ability Name        | Attack Type               | Damage Type
    {"dark_spore",          xi.attackType.BREATH,       xi.damageType.DARK},
    {"bubble_shower",       xi.attackType.BREATH,       xi.damageType.WATER},
    {"silence_gas",         xi.attackType.BREATH,       xi.damageType.WIND},
    {"drainkiss",           xi.attackType.MAGICAL,      xi.damageType.DARK},
    {"dust_cloud",          xi.attackType.MAGICAL,      xi.damageType.EARTH},
    {"fireball",            xi.attackType.MAGICAL,      xi.damageType.FIRE},
    {"snow_cloud",          xi.attackType.MAGICAL,      xi.damageType.ICE},
    {"acid_mist",           xi.attackType.MAGICAL,      xi.damageType.WATER},
    {"acid_spray",          xi.attackType.MAGICAL,      xi.damageType.WATER},
    {"cursed_sphere",       xi.attackType.MAGICAL,      xi.damageType.WATER},
    {"toxic_spit",          xi.attackType.MAGICAL,      xi.damageType.WATER},
    {"venom",               xi.attackType.MAGICAL,      xi.damageType.WATER},
    {"venom_spray",         xi.attackType.MAGICAL,      xi.damageType.WATER},
    {"back_heel",           xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"blockhead",           xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"brain_crush",         xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"grapple",             xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"head_butt",           xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"lamb_chop",           xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"rhino_attack",        xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"sheep_charge",        xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"somersault",          xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"suction",             xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"sudden_lunge",        xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"wing_slap",           xi.attackType.PHYSICAL,     xi.damageType.BLUNT},
    {"power_attack",        xi.attackType.PHYSICAL,     xi.damageType.H2H},
    {"power_attack_beetle", xi.attackType.PHYSICAL,     xi.damageType.H2H},
    {"power_attack_weapon", xi.attackType.PHYSICAL,     xi.damageType.H2H},
    {"beak_lunge",          xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"frogkick",            xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"leaf_dagger",         xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"mandibular_bite",     xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"numbshroom",          xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"queasyshroom",        xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"razor_fang",          xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"ripper_fang",         xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"shakeshroom",         xi.attackType.PHYSICAL,     xi.damageType.PIERCING},
    {"big_scissors",        xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"chomp_rush",          xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"claw_cyclone",        xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"cyclotail",           xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"double_claw",         xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"foot_kick",           xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"nimble_snap",         xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"pecking_flurry",      xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"recoil_dive",         xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"scythe_tail",         xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"sensilla_blades",     xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"sickle_slash",        xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"spinning_top",        xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"spiral_spin",         xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"tail_blow",           xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"tegmina_buffet",      xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"whirl_claws",         xi.attackType.PHYSICAL,     xi.damageType.SLASHING},
    {"needleshot",          xi.attackType.RANGED,       xi.damageType.PIERCING}
}

local pathWithFilename = io.popen("cd"):read'*all'

-- Checks to validate that the file exists before trying to override it
for _, entry in pairs(bstAbilities) do
    local abilityName = entry[1]
    
    local filename = pathWithFilename:sub(1, -2) .. string.format("\\scripts\\actions\\mobskills\\%s", abilityName) .. ".lua"
    local exists = io.open(filename,"r")
    if exists ~= nil then
        io.close(exists)
    else
        xi.module.ensureTable(string.format("xi.actions.mobskills.%s", abilityName))
    end
end

for i = 1, #bstAbilities do
    m:addOverride(string.format("xi.actions.mobskills.%s.onMobWeaponSkill",bstAbilities[i][1]), function(target, mob, skill)
        local master = mob:getMaster()
        if
            master and
            master:isPC()
        then
            -- Configuration
            local attackType    = bstAbilities[i][2]
            local damageType    = bstAbilities[i][3]

            -- Get Player Stats
            local bstIsMain     = master:getMainJob() == xi.job.BST
            local bstIsSub      = master:getSubJob() == xi.job.BST
            local mainJobLevel  = master:getMainLvl()
            local subJobLevel   = master:getSubLvl()
            local playerCHR     = master:getMod(xi.mod.CHR)
            local scalerValue   = 1.0
            local jobBoost      = 0.0
            local chrBoost      = playerCHR / 43.0
            
            -- Damage Calculations
            if bstIsMain then
                jobBoost = mainJobLevel / 75.0
            elseif bstIsSub then
                jobBoost = subJobLevel / 37.0
            end
            
            local dmgMultiplier = (jobBoost + chrBoost) * scalerValue
            if dmgMultiplier < 1.0 then
                dmgMultiplier = 1.0
            end
            
            local originalDmg   = super(target, mob, skill)
            local finalDmg      = math.floor(originalDmg * dmgMultiplier)
            if target:getHP() > 0 then
                -- Undo damage dealt
                target:takeDamage(-originalDmg, mob, attackType, damageType)

                -- Deal new damage
                target:takeDamage(finalDmg, mob, attackType, damageType)
            end
            
            return finalDmg
        else
            return super(target, mob, skill)
        end
    end)
end

return m
