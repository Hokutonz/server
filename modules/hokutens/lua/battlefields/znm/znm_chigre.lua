-----------------------------------
-- Area: Aydeewa Subterrane
--  ZNM: Chigre
-----------------------------------
require("modules/module_utils")
require("scripts/mixins/rage")
-----------------------------------
local m = Module:new("znm_chigre")

xi.module.ensureTable("xi.zones.Aydeewa_Subterrane.mobs.Chigre")

m:addOverride("xi.zones.Aydeewa_Subterrane.mobs.Chigre.onMobInitialize", function(mob)
    g_mixins.rage(mob)
end)

m:addOverride("xi.zones.Aydeewa_Subterrane.mobs.Chigre.onAdditionalEffect", function(mob, target, damage)
    -- Blind, Poison, Paralyze, Slow, Petrification, Silence, Drain, Curse, and Plague.
    local effects = {}

    if not target:hasStatusEffect(xi.effect.BLIND) then
        table.insert(effects, xi.effect.BLIND)
    end

    if not target:hasStatusEffect(xi.effect.POISON) then
        table.insert(effects, xi.effect.POISON)
    end

    if not target:hasStatusEffect(xi.effect.PARALYZE) then
        table.insert(effects, xi.effect.PARALYZE)
    end

    if not target:hasStatusEffect(xi.effect.SLOW) then
        table.insert(effects, xi.effect.SLOW)
    end

    if not target:hasStatusEffect(xi.effect.PETRIFICATION) then
        table.insert(effects, xi.effect.PETRIFICATION)
    end

    if not target:hasStatusEffect(xi.effect.SILENCE) then
        table.insert(effects, xi.effect.SILENCE)
    end

    if not target:hasStatusEffect(xi.effect.CURSE) then
        table.insert(effects, xi.effect.CURSE)
    end

    if not target:hasStatusEffect(xi.effect.PLAGUE) then
        table.insert(effects, xi.effect.PLAGUE)
    end

    if #effects == 0 then
        local params = { }
        params.chance = 100
        params.power = 80
        return xi.mob.onAddEffect(mob, target, damage, xi.mob.ae.HP_DRAIN, params)
    end

    local params = { }
    params.duration = 120
    return xi.mob.onAddEffect(mob, target, damage, effects[math.random(#effects)], params)
end)


return m
