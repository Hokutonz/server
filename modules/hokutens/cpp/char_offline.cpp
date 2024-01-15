/************************************************************************
* Char Offline
* 
* Functions for updating offline players
 ************************************************************************/

#include "map/utils/moduleutils.h"
#include "map/lua/lua_baseentity.h"

class CharOfflineModule : public CPPModule
{
    void OnInit() override
    {
        TracyZoneScoped;

        // Set offline character's variable
        // TODO: Make this create the variable if it doesn't exist
        lua["SetOfflineVar"] = [this](std::string const& charName, std::string const& varName, uint32 value) -> bool {
            TracyZoneScoped;

            const char* fmtQuery = "UPDATE char_vars INNER JOIN chars ON chars.charid = char_vars.charid SET char_vars.value = %u WHERE chars.charname = '%s' AND char_vars.varname = '%s'";

            int32 result = sql->Query(fmtQuery, value, charName, varName);

            return result != SQL_ERROR;
        };

        // Get offline character's variable
        lua["GetOfflineVar"] = [this](std::string const& charName, std::string const& varName) -> uint32 {
            TracyZoneScoped;

            const char* fmtQuery = "SELECT value FROM char_vars INNER JOIN chars ON chars.charid = char_vars.charid WHERE chars.charname = '%s' AND char_vars.varname = '%s'";

            int32 result = sql->Query(fmtQuery, charName, varName);

            if (result != SQL_ERROR && sql->NextRow() == SQL_SUCCESS)
            {
                return sql->GetUIntData(0);
            }

            return 0;
        };

        // Get offline character's zone
        lua["GetOfflineZone"] = [this](std::string const& charName) -> uint32 {
            TracyZoneScoped;

            const char* fmtQuery = "SELECT pos_zone FROM chars WHERE charname = '%s'";

            int32 result = sql->Query(fmtQuery, charName);

            if (result != SQL_ERROR && sql->NextRow() == SQL_SUCCESS)
            {
                return sql->GetUIntData(0);
            }

            return 0;
        };

        // Check if offline player is a Crystal Warrior
        lua["IsCrystalWarriorAccount"] = [this](std::string const& charName) -> bool {
            TracyZoneScoped;

            const char* fmtQuery = "SELECT type FROM accounts INNER JOIN chars ON chars.accid = accounts.id WHERE chars.charname = '%s'";

            int32 result = sql->Query(fmtQuery, charName);

            if (result != SQL_ERROR && sql->NextRow() == SQL_SUCCESS)
            {
                if (sql->GetUIntData(0) == 1)
                {
                    return true;
                }
            }

            return false;
        };

        // Restart a Crystal Warrior at intro beginning
        lua["RestartCrystalWarrior"] = [this](std::string const& charName) -> bool {
            TracyZoneScoped;

            // Force offline before we make these changes
            const char* sessionQuery =
                "DELETE accounts_sessions FROM accounts_sessions INNER JOIN chars ON chars.charid = accounts_sessions.charid WHERE chars.charname = '%s'";
            if (sql->Query(sessionQuery, charName) == SQL_ERROR)
            {
                return false;
            }

            // Remove Onion weapons, Adventurer's Coupon, Provenance Ring
            const char* itemQuery =
                "DELETE char_inventory FROM char_inventory INNER JOIN chars ON chars.charid = char_inventory.charid \
                 WHERE chars.charname = '%s' AND char_inventory.itemId IN (536, 28470, 16534, 13184, 17068, 4608, 17104, 4607, 16482, 4606, 16483)";
            if (sql->Query(itemQuery, charName) == SQL_ERROR)
            {
                return false;
            }

            // Update look so player doesn't have Onion weapon still visually equipped
            const char* lookQuery = "UPDATE char_look INNER JOIN chars ON chars.charid = char_look.charid SET main = 0, sub = 0, ranged = 0 WHERE chars.charname = '%s'";
            if (sql->Query(lookQuery, charName) == SQL_ERROR)
            {
                return false;
            }

            // Set player's position and Homepoint
            // -246.216, -18.798, -250.407, 56, 222
            const char* positionQuery =
                "UPDATE chars INNER JOIN accounts ON accounts.id = chars.accid \
                SET chars.pos_x = -246.216, chars.pos_y = -18.798, chars.pos_z = -250.407, chars.pos_rot = 56, chars.pos_zone = 222, chars.pos_prevzone = 222, \
                chars.home_x = -246.216, chars.home_y = -18.798, chars.home_z = -250.407, chars.home_rot = 56, chars.home_zone = 222 \
                WHERE chars.charname = '%s'";
            if (sql->Query(positionQuery, charName) == SQL_ERROR)
            {
                return false;
            }

            const char* cutsceneQuery = "UPDATE char_vars INNER JOIN chars ON chars.charid = char_vars.charid SET char_vars.value = 0 WHERE chars.charname = '%s' AND char_vars.varname = '[CW]INTRO_CS'";
            const char* introQuery    = "UPDATE char_vars INNER JOIN chars ON chars.charid = char_vars.charid SET char_vars.value = 0 WHERE chars.charname = '%s' AND char_vars.varname = '[CW]INTRO'";
            if (sql->Query(cutsceneQuery, charName) == SQL_ERROR)
            {
                return false;
            }

            if (sql->Query(introQuery, charName) == SQL_ERROR)
            {
                return false;
            }

            return true;
        };

        // Delete characters session (force offline)
        lua["DelCharSession"] = [this](std::string const& charName) -> bool {
            TracyZoneScoped;

            const char* fmtQuery = "DELETE accounts_sessions FROM accounts_sessions INNER JOIN chars ON chars.charid = accounts_sessions.charid WHERE chars.charname = '%s'";

            int32 result = sql->Query(fmtQuery, charName);

            return result != SQL_ERROR;
        };

        // Check if offline character has item name
        lua["HasCharItem"] = [this](std::string const& charName, std::string const& itemName) -> bool {
            TracyZoneScoped;

            const char* fmtQuery = "SELECT chars.charid FROM char_inventory INNER JOIN chars ON chars.charid = char_inventory.charid WHERE chars.charname = '%s' AND char_inventory.itemId = (SELECT itemid FROM item_basic WHERE name LIKE '%s' OR sortname LIKE '%s')";

            int32 result = sql->Query(fmtQuery, charName, to_lower(itemName), to_lower(itemName));

            if (result != SQL_ERROR && sql->NextRow() == SQL_SUCCESS)
            {
                return true;
            }

            return false;
        };

        // Delete offline character item by ID
        lua["DelCharItem"] = [this](std::string const& charName, uint16 itemID) -> bool {
            TracyZoneScoped;

            const char* fmtQuery = "DELETE char_inventory FROM char_inventory INNER JOIN chars ON chars.charid = char_inventory.charid WHERE chars.charname = '%s' AND char_inventory.itemId = %u";

            int32 result = sql->Query(fmtQuery, charName, itemID);

            return result != SQL_ERROR;
        };

        lua["DelCharInventory"] = [this](std::string const& charName, uint8 invType) -> bool {
            TracyZoneScoped;

            const char* fmtQuery = "DELETE char_inventory FROM char_inventory INNER JOIN chars ON chars.charid = char_inventory.charid WHERE chars.charname = '%s' AND char_inventory.location = %u";

            int32 result = sql->Query(fmtQuery, charName, invType);

            return result != SQL_ERROR;
        };

        // Clear the target character's inventory type
        lua["CBaseEntity"]["delCharInventory"] = [this](CLuaBaseEntity* PLuaBaseEntity, uint8 invType) -> bool {
            TracyZoneScoped;

            CBaseEntity* PEntity = PLuaBaseEntity->GetBaseEntity();

            XI_DEBUG_BREAK_IF(PEntity->objtype != TYPE_PC)

            if (PEntity->objtype == TYPE_PC)
            {
                auto* const PChar    = dynamic_cast<CCharEntity*>(PEntity);
                const char* fmtQuery = "DELETE FROM char_inventory WHERE charid = '%u' AND location = %u";

                int32 result = sql->Query(fmtQuery, PChar->id, invType);

                return result != SQL_ERROR;
            }

            return false;
        };

        // Reset character look to 0,0,0,0,0,0,0,0
        lua["ResetCharLook"] = [this](CLuaBaseEntity* PLuaBaseEntity, std::string const& charName) -> bool {
            TracyZoneScoped;

            const char* fmtQuery = "UPDATE char_look INNER JOIN chars ON chars.charid = char_look.charid SET head = 0, body = 0, hands = 0, legs = 0, feet = 0, main = 0, sub = 0, ranged = 0 WHERE chars.charname = '%s'";

            int32 result = sql->Query(fmtQuery, charName);

            return result != SQL_ERROR;
        };
    }
};

REGISTER_CPP_MODULE(CharOfflineModule);
