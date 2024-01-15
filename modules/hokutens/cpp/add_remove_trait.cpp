/************************************************************************
* Add/Remove Trait
* 
* Add or Remove Job Traits from the player
 ************************************************************************/

#include "map/utils/moduleutils.h"

#include "map/lua/lua_baseentity.h"
#include "map/packets/char_abilities.h"
#include "map/utils/battleutils.h"
#include "map/modifier.h"
#include "map/trait.h"

class AddRemoveTraitModule : public CPPModule
{
    void OnInit() override
    {
        TracyZoneScoped;

        lua["CBaseEntity"]["addJobTrait"] = [](CLuaBaseEntity* PLuaBaseEntity, TRAITTYPE traitID, uint8 rank, uint16 modifier, uint16 value, uint16 meritId) -> void {
            TracyZoneScoped;

            CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();

            auto* const PBattleEntity = dynamic_cast<CBattleEntity*>(PEntity);
            auto* const PChar         = dynamic_cast<CCharEntity*>(PEntity);
            CTrait* PTrait            = new CTrait(traitID);

            PTrait->setJob(PBattleEntity->GetMJob());
            PTrait->setLevel(1);
            PTrait->setRank(rank);
            PTrait->setMod(static_cast<Mod>(modifier));
            PTrait->setValue(value);
            PTrait->setMeritId(meritId);

            PBattleEntity->addTrait(PTrait);
            PChar->pushPacket(new CCharAbilitiesPacket(PChar));
        };

        lua["CBaseEntity"]["removeJobTrait"] = [](CLuaBaseEntity* PLuaBaseEntity, TRAITTYPE traitID, uint8 rank, uint16 modifier, uint16 value, uint16 meritId) -> void {
            TracyZoneScoped;

            CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();

            auto* const PBattleEntity = dynamic_cast<CBattleEntity*>(PEntity);
            auto* const PChar         = dynamic_cast<CCharEntity*>(PEntity);
            CTrait* PTrait            = new CTrait(traitID);

            PTrait->setJob(PBattleEntity->GetMJob());
            PTrait->setLevel(1);
            PTrait->setRank(rank);
            PTrait->setMod(static_cast<Mod>(modifier));
            PTrait->setValue(value);
            PTrait->setMeritId(meritId);

            PBattleEntity->delTrait(PTrait);
            PChar->pushPacket(new CCharAbilitiesPacket(PChar));
        };
    }
};

REGISTER_CPP_MODULE(AddRemoveTraitModule);
