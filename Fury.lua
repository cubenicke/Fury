--[[
    Fury

    Extended By: CubeNicke
    Originally By: Bhaerau
]]--

--------------------------------------------------
--
-- Variables
--
--------------------------------------------------

local function setup(defaults)
    local configs = {

      AutoAttack = true,       -- Set to false to disable auto-attack
      BerserkHealth = 60,      -- Set this to the minimum percent of health to have when using Berserk
      BloodrageHealth = 50,    -- Set this to the minimum percent of health to have when using Bloodrage
      DeathWishHealth = 60,    -- Set this to the minimum percent of health to have when using Death Wish
      Debug = false,           -- Set to true to enable debugging feedback
      DebugChannel = nil,      -- Channel to log to
      DemoDiff = 7,            -- When level difference is greater don't do Demoralizing Shout
      Enabled = true,          -- Set to false to disable the addon
      ExecuteSwap  = false,    -- Swap weapon at execute
      ExecuteSwapped = false,  -- If execute outfit is equipped
      FlurryTriggerRage = 52,  -- Set this to the minimum rage to have to use Hamtring to trigger Flurry
      HamstringHealth = 40,    -- Set this to the maximum percent of health allowed when using Hamstring on NPCs
      InstantBuildTime = 2,    -- Set the time to spend building rage for upcoming 31 point instant attacks
      MaximumRage = 60,        -- Set this to the maximum amount of rage allowed when using abilities to increase rage
      NextAttackRage = 30,     -- Set this to the minimum rage to have to use next attack abilities (Cleave and Heroic Strike)
      StanceChangeRage = 25,   -- Set this to the amount of rage allowed to be wasted when switching stances
      PrimaryStance = false,   -- Set this to the stance to fall back to after performing an attack requiring another stance

      MODE_HEADER_AOE = false,                -- Disable auto use of aoe (Disables OP, HS, BT, Exe, Enablse Cleave, Whirlwind)
      MODE_HEADER_DEBUFF = false,             -- use when have debuff <type>

      ABILITY_BATTLE_SHOUT_FURY = true,       -- Set to false to disable use of ability
      ABILITY_BERSERKER_RAGE_FURY = true,     -- Used to counter fears
      ABILITY_BLOODRAGE_FURY = true,          -- Gives extra rage
      ABILITY_BLOODTHIRST_FURY = true,        -- Fury main attack
      ABILITY_CHARGE_FURY = true,             -- Charge when out of combat
      ABILITY_CLEAVE_FURY = false,            -- Cleave to lower threat and on used in aoe situations
      ABILITY_DEMORALIZING_SHOUT_FURY = true, -- Decreases enemy attack power
      ABILITY_DISARM_FURY = true,             -- Used in pvp agains hard hitters
      ABILITY_EXECUTE_FURY = true,            -- Execute
      ABILITY_HAMSTRING_FURY = true,          -- Hamstring
      ABILITY_PIERCING_HOWL_FURY = true,      -- Piercing Howl
      ABILITY_HEROIC_STRIKE_FURY = true,      -- HS, to dump rage and at low levels
      ABILITY_INTERCEPT_FURY = true,          -- in combat charge
      ABILITY_MORTAL_STRIKE_FURY = true,      -- Arms main attack
      ABILITY_SWEEPING_STRIKES_FURY = true,   -- Aoe for arms
      ABILITY_OVERPOWER_FURY = true,          -- Counterattack dodge
      ABILITY_PUMMEL_FURY = true,             -- Counter spellcast
      ABILITY_REND_FURY = true,               -- Counter rogues vanish
      ABILITY_SHIELD_BASH_FURY = true,        -- Prot
      ABILITY_SHIELD_SLAM_FURY = true,        -- Prot
      ABILITY_DEATH_WISH_FURY = true,         -- Deth wish on cooldown
      ABILITY_THUNDER_CLAP_FURY = true,       -- slow enemies
      ABILITY_WHIRLWIND_FURY = true,          -- Fury rotation and aoe
      ABILITY_REVENGE_FURY = false,           -- Prot

      ITEM_CONS_JUJU_CHILL = true,           -- use on cooldown for bosses with frost dmg
      ITEM_CONS_JUJU_EMBER = true,            -- use on cooldown for bosses with fire dmg
      ITEM_CONS_JUJU_FLURRY = false,          -- use on cooldown
      ITEM_CONS_JUJU_MIGHT = false,           -- use on cooldown
      ITEM_CONS_JUJU_POWER = false,           -- use on cooldown
      ITEM_CONS_OIL_OF_IMMOLATION = false,    -- use on cooldown

      ITEM_TRINKET_EARTHSTRIKE = true,        -- use on cooldown
      ITEM_TRINKET_KOTS = true,               -- use on cooldown
      ITEM_TRINKET_SLAYERS_CREST = true,      -- use on cooldown

      RACIAL_BERSERKING_FURY = true,          -- Racial
      RACIAL_BLOOD_FURY = true,               -- Racial
      RACIAL_STONEFORM_FURY = true,           -- Racial
    }

    for k, v in configs do
        if defaults or Fury_Configuration[k] == nil then
            Fury_Configuration[k] = v
        end
    end
end

local function Fury_Configuration_Init()

    FURY_VERSION = "1.17.4"

    if not Fury_Configuration then
        Fury_Configuration = { }
    end
    if not Fury_Runners then
        Fury_Runners = { }
    end
    if not Fury_ImmuneDisarm then
        Fury_ImmuneDisarm = { }
    end
    setup(false) -- Set to value if nil
end

local function Fury_Configuration_Default()
    setup(true) -- Setup to defaults
end

--------------------------------------------------
--
-- Normal Functions
--
--------------------------------------------------

local function Print(msg)
    if not DEFAULT_CHAT_FRAME then
        return
    end
    DEFAULT_CHAT_FRAME:AddMessage(BINDING_HEADER_FURY .. ": "..(msg or ""))
end

local function Debug(msg)
    if (msg or "") == "" then
        FuryRageDumped = nil
        return
    end
    if Fury_Configuration and Fury_Configuration["Debug"] then
        Print(msg)
    end
    if Fury_Configuration["DebugChannel"] and UnitLevel("player") >= 10 then
        if GetTime() > FuryLastLog + 0.1 then
            SendChatMessage(msg .. (FuryLogMsg or ""), "CHANNEL", nil, Fury_Configuration["DebugChannel"])
            FuryLastLog = GetTime()
            FuryLogMsg = nil
        else
            FuryLogMsg = (FuryLogMsg or "")..", "..msg
        end
    end
    FuryRageDumped = nil
end

local function LogToFile(enable)
    if enable then
        LoggingChat(1)
        LoggingCombat(1)
        if Fury_Configuration["DebugChannel"] == nil then
            local channel = "Fury_"..tostring(GetTime() * 1000)
            JoinChannelByName(channel, "test", nil, 1)
            local id, _ = GetChannelName(channel)
            Fury_Configuration["DebugChannel"] = id
        else
            local _, channel = GetChannelName(Fury_Configuration["DebugChannel"])
            if channel ~= nil then
                JoinChannelByName(channel, "test", nil, 1)
            else
                Fury_Configuration["DebugChannel"] = nil
                LogToFile(enable)
            end
        end
        Print(TEXT_FURY_LOGGING_CHANNEL_ON)
    else
        LoggingChat(0)
        LoggingCombat(0)
        Fury_Configuration["DebugChannel"] = nil
        Print(TEXT_FURY_LOGGING_CHANNEL_OFF)
    end
end

local function HasDebuffType(unit, type)
    local id = 1
    while UnitDebuff(unit, id) do
        local _,_,debuffType = UnitDebuff(unit, id)
        if debuffType ==  type then
            return true
        end
        id = id + 1
    end
    return nil
end

local function PrintEffects(target)
    local id = 1
    if UnitBuff(target, id) then
        Print(SLASH_BUFFS_FURY)
        while (UnitBuff(target, id)) do
            Print(UnitBuff(target, id))
            id = id + 1
        end
        id = 1
    end
    if HasDebuffType(target) then
        Print(TEXT_FURY_HAVE_DEBUFF)
    end
    if UnitDebuff(target, id) then
        Print(CHAT_DEBUFFS_FURY)
        while UnitDebuff(target, id) do
            Print(UnitDebuff(target, id))
            id = id + 1
        end
    end
end

local res = {
    ["fire"] = {
        BOSS_NAX_GRAND_WIDOW_FAERLINA_FURY,
        BOSS_NAX_THANE_KORTH_AZZ_FURY,
        BOXX_MC_RAGNAROS_FURY,
        BOSS_ONYXIA_FURY
    },
    ["frost"] = {
        BOSS_NAX_KEL_THUZAD_FURY,
        BOSS_NAX_SAPPHIRON_FURY
    },
    ["nature"] = {
        BOSS_NAX_HEIGAN_THE_UNCLEAN_FURY,
        BOSS_NAX_LOATHEB_FURY,
        BOSS_AQ40_PRINCESS_HUHURAN_FURY
    },
    ["shadow"] = {
        BOSS_NAX_LOATHEB_FURY,
        BOSS_STRAT_BARON_RIVENDERE_FURY,
        BOSS_NAX_LADY_BLAUMEUX_FURY
    },
    ["arcane"] = {
        BOSS_NAX_GOTHIK_THE_HARVESTER_FURY,
        BOSS_AQ40_THE_PROPHET_SKERAM_FURY,
        BOSS_AQ40_EMPEROR_VEK_LOR_FURY,
        BOSS_MC_SHAZZRATH_FURY
    },
    ["holy"] = {
        BOSS_NAX_SIR_ZELIEK_FURY
    }
}

local function UseRes(type)
    for _, name in pairs(res[type]) do
        if UnitName("target") == name then
            return true
        end
    end
    return false
end

--------------------------------------------------
--
-- Distance handling
--
--------------------------------------------------

local function Fury_InitDistance()
    local found = 0
    yard30 = nil
    yard25 = nil
    yard10 = nil
    yard08 = nil
    yard05 = nil
    for i = 1, 120 do
        t = GetActionTexture(i)
        if t then
            if not yard30 then
                if string.find(t, "Ability_Marksmanship") -- Shoot
                  or string.find(t, "Ability_Throw") then -- Throw
                    yard30 = i
                    Debug("30 yard: "..t)
                    found = found + 1
                end
            end
            if not yard25 then
                if string.find(t, "Ability_Warrior_Charge") -- Charge
                  or string.find(t, "Ability_Rogue_Sprint") then -- Intercept
                    yard25 = i
                    Debug("25 yard: "..t)
                    found = found + 1
                end
            end
            if not yard10 then
                if string.find(t, "Ability_GolemThunderClap")
                  or string.find(t, "Spell_Nature_ThunderClap") then -- Thunder Clap
                    yard10 = i
                    Debug("10 yard: "..t)
                    found = found + 1
                end
            end
            if not yard08 then
                if string.find(t, "Ability_Marksmanship") -- Shoot
                  or string.find(t, "Ability_Throw") then -- Throw
                    yard08 = i
                    Debug("08 yard: "..t)
                    found = found + 1
                end
            end
            if not yard05 then
                if string.find(t, "Ability_Warrior_Sunder") -- Sunder Armor
                  or string.find(t, "Ability_Warrior_DecisiveStrike") -- Slam
                  or string.find(t, "Ability_Warrior_Disarm") -- Disarm
                  or string.find(t, "INV_Gauntlets_04") -- Pummel
                  or string.find(t, "Ability_MeleeDamage") -- Overpower
                  or string.find(t, "Ability_Warrior_PunishingBlow") -- Mocking blow
                  or string.find(t, "Ability_Warrior_Revenge") -- Revenge
                  or string.find(t, "Ability_Gouge") -- Rend
                  or string.find(t, "INV_Sword_48") -- Execute
                  or string.find(t, "ability_warrior_savageblow") -- Mortal Strike
                  or string.find(t, "INV_Shield_05") -- Shield Slam
                  or string.find(t, "Spell_Nature_Bloodlust") then -- Bloodthirst
                    yard05 = i
                    Debug("5 yard: "..t)
                    found = found + 1
                end
            end
            if found == 5 then
                Debug("Found all distance check spells ("..i..")")
                return
            end
        end
    end
    -- Print if any distance check spell is missing
    if not yard30 or not yard08 then
        Print(CHAT_MISSING_SPELL_SHOOT_THROW_FURY)
    end
    if not yard25 then
        Print(CHAT_MISSING_SPELL_INTERCEPT_CHARGE_FURY)
    end
    if not yard10 then
        Print(CHAT_MISSING_SPELL_THUNDERCLAP_FURY)
    end
    if not yard05 then
        Print(CHAT_MISSING_SPELL_PUMMEL_FURY)
    end
end
--------------------------------------------------

local function Fury_Distance()
    if not UnitCanAttack("player", "target") then
        return 100 -- invalid target
    end
    if yard05 and IsActionInRange(yard05) == 1 then
        return 5 -- 0 - 5
    end
    if yard10 and IsActionInRange(yard10) == 1 then
        if yard08 and IsActionInRange(yard08) == 0 then
            return 7 -- 6 - 7
        end
        return 10 -- 8 - 10
    end
    if yard25 and IsActionInRange(yard25) == 1 then
        return 25 -- 11 - 25
    end
    if yard30 and IsActionInRange(yard30) == 1 then
        return 30 -- 26 - 30
    end
    return 100 -- 31 - <na>
end
--------------------------------------------------

local function SpellId(spellname)
    local id = 1
    for i = 1, GetNumSpellTabs() do
        local _, _, _, numSpells = GetSpellTabInfo(i)
        for j = 1, numSpells do
            local spellName = GetSpellName(id, BOOKTYPE_SPELL)
            if spellName == spellname then
                return id
            end
            id = id + 1
        end
    end
    return nil
end
--------------------------------------------------

local function SpellReadyIn(spellname)
    local id = SpellId(spellname)
    if id then
        local start, duration = GetSpellCooldown(id, 0)
        if start == 0 and duration == 0 and FuryLastSpellCast + 1 <= GetTime() then
            return 0
        end
        local remaining = duration - (GetTime() - start)
        if remaining >= 0 then
            return remaining
        end
    end
    return 86400
end
--------------------------------------------------

local function HasDebuff(unit, texturename, amount)
    local id = 1
    while UnitDebuff(unit, id) do
        local debuffTexture,debuffAmount = UnitDebuff(unit, id)
        if string.find(debuffTexture, texturename) then
            if (amount or 1) <= debuffAmount then
                return true
            else
                return false
            end
        end
        id = id + 1
    end
    return nil
end
--------------------------------------------------

local function HasBuff(unit, texturename)
    local id = 1
    while UnitBuff(unit, id) do
        local buffTexture = UnitBuff(unit, id)
        if string.find(buffTexture, texturename) then
            return true
        end
        id = id + 1
    end
    return nil
end
--------------------------------------------------

local function HasBuffId(target, spellId)
    for i = 1, 40 do
        if select(11, UnitBuff(target, i)) == spellid then
            return true
        end
    end
    return nil
end
--------------------------------------------------

local function UseContainerItemByNameOnPlayer(search)
    for bag = 0,4 do
        for slot = 1,GetContainerNumSlots(bag) do
            local item = GetContainerItemLink(bag,slot)
            if item then
                local _, _, itemCode = strfind(item, "(%d+):")
                local itemName = GetItemInfo(itemCode)
                if itemName == search then
                    UseContainerItem(bag,slot)
                    if SpellIsTargeting() then
                        SpellTargetUnit("player")
                    end
                end
            end
        end
    end
end
--------------------------------------------------

local function ActiveStance()
    --Detect the active stance
    for i = 1, 3 do
        local _, _, active = GetShapeshiftFormInfo(i)
        if active then
            return i
        end
    end
    return nil
end
--------------------------------------------------

local function Weapon()
    --Detect if a suitable weapon (not a skinning knife/mining pick and not broken) is present
    local item = GetInventoryItemLink("player", 16)
    if item then
        local _, _, itemCode = strfind(item, "(%d+):")
        local itemName, itemLink, _, _, itemType = GetItemInfo(itemCode)
        if itemLink ~= "item:7005:0:0:0" and itemLink ~= "item:2901:0:0:0" and not GetInventoryItemBroken("player", 16) then
            return true
        end
    end
    return nil
end
--------------------------------------------------

local function Shield()
    --Detect if a shield is present
    local item = GetInventoryItemLink("player", 17)
    if item then
        local _, _, itemCode = strfind(item, "(%d+):")
        local _, _, _, _, _, itemType = GetItemInfo(itemCode)
        if itemType == ITEM_TYPE_SHIELDS_FURY and not GetInventoryItemBroken("player", 17) then
            return true
        end
    end
    return nil
end
--------------------------------------------------

local function IsTrinketEquipped(name)
    for slot = 13, 14 do
        local item = GetInventoryItemLink("player", slot)
        if item then
            local _, _, itemCode = strfind(item, "(%d+):")
            local itemName = GetItemInfo(itemCode)
            if itemName == name and GetInventoryItemCooldown("player", slot) == 0 then
                return slot
            end
        end
    end
    return nil
end
--------------------------------------------------

local function Ranged()
    --Detect if a ranged weapon is equipped and return type
    local item = GetInventoryItemLink("player", 18)
    if item then
        local _, _, itemCode = strfind(item, "(%d+):")
        local _, _, _, _, _, itemType = GetItemInfo(itemCode)
        return itemType
    end
    return nil
end
--------------------------------------------------

local function HamstringCost()
    --Calculate the cost of Hamstring based on gear
    local i = 0
    local item = GetInventoryItemLink("player", 10)
    if item then
        local _, _, itemCode = strfind(item, "(%d+):")
        local itemName = GetItemInfo(itemCode)
        if itemName == ITEM_GAUNTLETS1_FURY or itemName == ITEM_GAUNTLETS2_FURY or itemName == ITEM_GAUNTLETS3_FURY or itemName == ITEM_GAUNTLETS4_FURY then
            i = 3
        end
    end
    return 10 - i
end
--------------------------------------------------

local function AntiStealthDebuff()
    --Detect anti-stealth debuffs
    --Rend, Deep Wounds, Serpent Sting, Immolate, Curse of Agony , Garrote, Rupture, Deadly Poison, Fireball, Ignite, Pyroblast, Corruption, Siphon Life, Faerie Fire, Moonfire, Rake, Rip, Pounce, Insect Swarm, Holy Fire, Wyvern Sting, Devouring Plague
    if HasDebuff("target", "Ability_Gouge")
      or HasDebuff("target", "Ability_Backstab")
      or HasDebuff("target", "Ability_Hunter_Quickshot")
      or HasDebuff("target", "Spell_Fire_Immolation")
      or HasDebuff("target", "Spell_Shadow_CurseOfSargeras")
      or HasDebuff("target", "Ability_Rogue_Garrote")
      or HasDebuff("target", "Ability_Rogue_Rupture")
      or HasDebuff("target", "Ability_Rogue_DualWeild")
      or HasDebuff("target", "Spell_Shadow_ShadowWordPain")
      or HasDebuff("target", "Spell_Fire_FlameBolt")
      or HasDebuff("target", "Spell_Fire_Incinerate")
      or HasDebuff("target", "Spell_Fire_Fireball02")
      or HasDebuff("target", "Spell_Shadow_AbominationExplosion")
      or HasDebuff("target", "Spell_Shadow_Requiem")
      or HasDebuff("target", "Spell_Nature_FaerieFire")
      or HasDebuff("target", "Spell_Nature_StarFall")
      or HasDebuff("target", "Ability_Druid_Disembowel")
      --or HasDebuff("target", "Ability_GhoulFrenzy") --triggered on fury warrs Flurry
      or HasDebuff("target", "Ability_Druid_SurpriseAttack")
      or HasDebuff("target", "Spell_Nature_InsectSwarm")
      or HasDebuff("target", "Spell_Holy_SearingLight")
      or HasDebuff("target", "INV_Spear_02")
      or HasDebuff("target", "Spell_Shadow_BlackPlague") then
        return true
    end
    return nil
end
--------------------------------------------------

local function ImmobilizingDebuff()
    -- Detect immobilizing buffs
    if HasDebuff("player", "Spell_Frost_FrostNova")
      or HasDebuff("player", "spell_Nature_StrangleVines") then
        return true
    end
    return nil
end
--------------------------------------------------

local function SnareDebuff(unit)
    --Detect snaring debuffs
    --Hamstring, Wing Clip, Curse of Exhaustion, Crippling Poison, Frostbolt, Cone of Cold, Frost Shock, Piercing Howl
    if HasDebuff(unit, "Ability_ShockWave")
      or HasDebuff(unit, "Ability_Rogue_Trip")
      or HasDebuff(unit, "Spell_Shadow_GrimWard")
      or HasDebuff(unit, "Ability_PoisonSting")
      or HasDebuff(unit, "Spell_Frost_FrostBolt02")
      or HasDebuff(unit, "Spell_Frost_Glacier")
      or HasDebuff(unit, "Spell_Shadow_DeathScream")
      or HasDebuff(unit, "Spell_Frost_FrostShock") then
        return true
    end
    return nil
end
--------------------------------------------------

local function Fury_RunnerDetect(arg1, arg2)
    --Thanks to HateMe
    if arg1 == CHAT_RUNNER_FURY then
        Fury_Runners[arg2] = true
    end
end
--------------------------------------------------

local function ItemExists(itemName)
    for bag = 4, 0, -1 do
        for slot = 1, GetContainerNumSlots(bag) do
            local _, itemCount = GetContainerItemInfo(bag, slot)
            if itemCount then
                local itemLink = GetContainerItemLink(bag,slot)
                local _, _, itemParse = strfind(itemLink, "(%d+):")
                local queryName, _, _, _, _, _ = GetItemInfo(itemParse)
                if queryName and queryName ~= "" then
                    if queryName == itemName then
                        return true
                    end
                end
            end
        end
    end
    return false
end
--------------------------------------------------

local function ItemReady(item)
    if ItemExists(item) == false then
        return false
    end
    local _, duration, _ = GetItemCooldown(item)
    if duration == 0 then
        return true
    end
    return false
end
--------------------------------------------------

local function EquippedAndReady(slot, name)
    local item = GetInventoryItemLink("player", slot)
    if item then
        local _, _, itemCode = strfind(item, "(%d+):")
        local itemName = GetItemInfo(itemCode)
        if itemName == name
          and GetInventoryItemCooldown("player", slot) == 0 then
            return true
        end
    end
    return nil
end
--------------------------------------------------

local function CheckCooldown(slot)
    local start, duration = GetInventoryItemCooldown("player", slot)
    if duration > 30 then
        -- Alllow duration for 30 seconds since it's when you equip the item
        local item = GetInventoryItemLink("player", slot)
        if item then
            local _, _, itemCode = strfind(item, "(%d+):")
            local itemName = GetItemInfo(itemCode)
            return itemName
        end
    end
    return nil
end
--------------------------------------------------

local function Fury_SetEnemies(count)
    for i=5,1,-1 do
        WWEnemies.Hist[i] = WWEnemies.Hist[i - 1]
    end
    WWEnemies.Hist[0] = Enemies
end
--------------------------------------------------

local function addEnemyCount(Enemies)
    Fury_SetEnemies(Enemies)
    Debug("Enemies "..Enemies)
    if Enemies < 2 and Fury_Configuration[MODE_HEADER_AOE] then
        Print(TEXT_FURY_DISABLING_AOE)
        Fury_Configuration[MODE_HEADER_AOE] = false
    end
end
--------------------------------------------------

local function Fury_GetEnemies()
    return WWEnemies.Hist[0] or 0
end
--------------------------------------------------

local function Fury_Shoot()
    local ranged_type = Ranged()
    local spell
    if ranged_type == ITEM_TYPE_BOWS_FURY then
        spell = ABILITY_SHOOT_BOW_FURY
    elseif ranged_type == ITEM_TYPE_CROSSBOWS_FURY then
        spell = ABILITY_SHOOT_CROSSBOW_FURY
    elseif ranged_type == ITEM_TYPE_GUNS_FURY then
        spell = ABILITY_SHOOT_GUN_FURY
    elseif ranged_type == ITEM_TYPE_THROWN_FURY then
        spell = ABILITY_THROW_FURY
    else
        return false
    end
    if SpellReadyIn(spell) == 0 then
        Debug(spell)
        CastSpellByName(spell)
        FuryLastSpellCast = GetTime()
    end
    return true
end
--------------------------------------------------

local function Fury_TreatDebuff(unit)
    local allowCombatCooldown = true
    if UnitName("target") == BOSS_NAX_LOATHEB_FURY
      or UnitName("target") == BOSS_NAX_SAPPHIRON_FURY then
        allowCombatCooldown = false -- Save for Shadow/frost Protection Potion
    end
    -- add Restorative Potion (magic, poison curse or disease)
    if HasDebuffType(unit, ITEM_DEBUFF_TYPE_POISON) then
        if UnitName("target") == BOSS_NAX_GROBBULUS_FURY then
            return false
        end
        if IsTrinketEquipped(ITEM_TRINKET_HEART_OF_NOXXION) then
            local slot = IsTrinketEquipped(ITEM_TRINKET_HEART_OF_NOXXION)
            UseInventoryItem(slot)

        elseif UnitRace(unit) == RACE_DWARF and Fury_Configuration[RACIAL_STONEFORM_FURY] and SpellReadyIn(RACIAL_STONEFORM_FURY) == 0 then
            CastSpellByName(RACIAL_STONEFORM_FURY)

        elseif allowCombatCooldown and ItemReady(ITEM_CONS_JUNGLE_REMEDY) then
            Print(ITEM_CONS_JUNGLE_REMEDY)
            UseContainerItemByNameOnPlayer(ITEM_CONS_JUNGLE_REMEDY)

        elseif ItemReady(ITEM_CONS_POWERFUL_ANTIVENOM) then
            Print(ITEM_CONS_POWERFUL_ANTIVENOM)
            UseContainerItemByNameOnPlayer(ITEM_CONS_POWERFUL_ANTIVENOM)

        elseif ItemReady(ITEM_CONS_ELIXIR_OF_POISION_RESISTANCE) then
            Print(ITEM_CONS_ELIXIR_OF_POISION_RESISTANCE)
            UseContainerItemByNameOnPlayer(ITEM_CONS_ELIXIR_OF_POISION_RESISTANCE)

        elseif allowCombatCooldown and ItemReady(ITEM_CONS_PURIFICATION_POTION) then
            Print(ITEM_CONS_PURIFICATION_POTION)
            UseContainerItemByNameOnPlayer(ITEM_CONS_PURIFICATION_POTION)

        elseif allowCombatCooldown and ItemReady(ITEM_CONS_RESTORATIVE_POTION) then
            Print(ITEM_CONS_RESTORATIVE_POTION_POTION)
            UseContainerItemByNameOnPlayer(ITEM_CONS_RESTORATIVE_POTION_POTION)

        else
            return false

        end
        Print(ITEM_DEBUFF_TYPE_POISON)
    elseif HasDebuffType(unit, ITEM_DEBUFF_TYPE_DISEASE) then
        if UnitRace(unit) == RACE_DWARF and SpellReadyIn(ABILITY_STONEFORM_FURY) == 0 then
            CastSpellByName(ABILITY_STONEFORM_FURY)

        elseif allowCombatCooldown and ItemReady(ITEM_CONS_JUNGLE_REMEDY) then
            Print(ITEM_CONS_JUNGLE_REMEDY)
            UseContainerItemByNameOnPlayer(ITEM_CONS_JUNGLE_REMEDY)

        elseif allowCombatCooldown and ItemReady(ITEM_CONS_RESTORATIVE_POTION) then
            Print(ITEM_CONS_RESTORATIVE_POTION_POTION)
            UseContainerItemByNameOnPlayer(ITEM_CONS_RESTORATIVE_POTION_POTION)

            else
            return false
        end
        Print(ITEM_DEBUFF_TYPE_DISEASE)
    elseif HasDebuffType(unit, ITEM_DEBUFF_TYPE_CURSE) then
        if allowCombatCooldown and ItemReady(ITEM_CONS_PURIFICATION_POTION) then
            Print(ITEM_CONS_PURIFICATION_POTION)
            UseContainerItemByNameOnPlayer(ITEM_CONS_PURIFICATION_POTION)

        elseif allowCombatCooldown and ItemReady(ITEM_CONS_RESTORATIVE_POTION) then
            Print(ITEM_CONS_RESTORATIVE_POTION_POTION)
            UseContainerItemByNameOnPlayer(ITEM_CONS_RESTORATIVE_POTION_POTION)

            else
            return false
        end
        Print(ITEM_DEBUFF_TYPE_CURSE)
    elseif HasDebuffType(unit, ITEM_DEBUFF_TYPE_MAGIC) then
        
        if allowCombatCooldown and ItemReady(ITEM_CONS_RESTORATIVE_POTION) then
            Print(ITEM_CONS_RESTORATIVE_POTION_POTION)
            UseContainerItemByNameOnPlayer(ITEM_CONS_RESTORATIVE_POTION_POTION)

        else
            return false
        end
        Print(ITEM_DEBUFF_TYPE_MAGIC)
    else
        return false

    end
    return true
end

--------------------------------------------------

-- Fury - Handles the combat sequence

--------------------------------------------------

function Fury()
    if Fury_Configuration["Enabled"]
      and not UnitIsCivilian("target")
      and UnitClass("player") == CLASS_WARRIOR_FURY
      and FuryTalents then
        local debuffImmobilizing = ImmobilizingDebuff()

        -- 1, Auto attack closest target
        if Fury_Configuration["AutoAttack"] and not FuryAttack then
            AttackTarget()
        end

        -- 2, Overpower
        if FuryOverpower then
            if (GetTime() - FuryOverpower) > 4 then
                FuryOverpower = nil
            end
        end

        -- 3, Spell interrupt
        if FurySpellInterrupt then
            if (GetTime() - FurySpellInterrupt) > 2 then
                FurySpellInterrupt = nil
            end
        end

        -- 4, Add number of enemies
        if WWEnemies.CleaveCount ~= nil and (GetTime() - WWEnemies.CleaveTime ) > 1 then
            addEnemyCount(WWEnemies.CleaveCount)
            WWEnemies.CleaveCount = nil
        elseif WWEnemies.WWCount ~= nil and (GetTime() - WWEnemies.WWTime) > 1 then
            addEnemyCount(WWEnemies.WWCount)
            WWEnemies.WWCount = nil
        end

        -- 5, Dismount if mounted
        if FuryMount then
            Debug("5. Dismount")
            Dismount()
            FuryMount = nil

        -- 6, Use Berserker rage to interrupt fears and ....
        elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
          and (FuryIncapacitate
          or FuryFear)
          and ActiveStance() == 3
          and SpellReadyIn(ABILITY_BERSERKER_RAGE_FURY) == 0 then
            Debug("6. Berserker Rage")
            CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)

        -- 7, Spider Belt, remove existing immobilizing effects
        elseif debuffImmobilizing
          and EquippedAndReady(6, ITEM_BELT_SPIDER_BELT_FURY) then
            Debug("7. Spider Belt")
            UseInventoryItem(6)

        -- 8, Ornate Mithril Boots, remove existing immobilizing effects
        elseif debuffImmobilizing
          and EquippedAndReady(8, ITEM_BOOTS_ORNATE_MITHRIL_BOOTS_FURY) then
            Debug("8. Ornate Mithril Boots")
            UseInventoryItem(8)

        -- 9, PVP Trinket, Horde
        elseif (FuryFear or FuryIncapacitate or debuffImmobilizing)
          and IsTrinketEquipped(ITEM_TRINKET_INSIGNIA_OF_THE_HORDE_FURY) then
            slot = IsTrinketEquipped(ITEM_TRINKET_INSIGNIA_OF_THE_HORDE_FURY)
            Debug("9. Insignia of the Horde")
            UseInventoryItem(slot)

        -- 10, PVP Trinket, Alliance
        elseif (FuryFear or FuryIncapacitate or debuffImmobilizing)
          and IsTrinketEquipped(ITEM_TRINKET_INSIGNIA_OF_THE_ALLIANCE_FURY) then
            slot = IsTrinketEquipped(ITEM_TRINKET_INSIGNIA_OF_THE_ALLIANCE_FURY)
            Debug("10. Insignia of the Alliance")
            UseInventoryItem(slot)

        -- 11, Execute, this will stance dance in prot mode?
        elseif Fury_Configuration[ABILITY_EXECUTE_FURY]
          and Weapon()
          and not Fury_Configuration[MODE_HEADER_AOE]
          and UnitMana("player") >= FuryExecuteCost
          and (ActiveStance() ~= 2
          or (Fury_Configuration["PrimaryStance"] ~= 2
          and UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
          and Fury_Configuration["PrimaryStance"] ~= 0))
          and (UnitHealth("target") / UnitHealthMax("target") * 100) <= 20
          and SpellReadyIn(ABILITY_EXECUTE_FURY) == 0 then
            if Fury_Configuration["ExecuteSwap"]
              and not Fury_Configuration["ExecuteSwapped"]
              and Outfitter_ExecuteCommand then
                Debug("Swap to Execute Profile in Outfitter")
                Outfitter_ExecuteCommand("wear Execute")
                Fury_Configuration["ExecuteSwapped"] = true
            end
            if ActiveStance() == 2 then
                Debug("11. Berserker Stance (Execute)")
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                CastShapeshiftForm(1)
                FuryLastStanceCast = GetTime()
            else
                Debug("11. Execute")
                if FuryOldStance == ActiveStance() then
                    FuryDanceDone = true
                end
            end
            CastSpellByName(ABILITY_EXECUTE_FURY)
            FuryLastSpellCast = GetTime()

        -- 12, Overpower when available
        elseif Fury_Configuration[ABILITY_OVERPOWER_FURY]
          and FuryOverpower
          and Weapon()
          and not Fury_Configuration[MODE_HEADER_AOE]
          and UnitMana("player") >= 5
          and (ActiveStance() == 1
          or ((Fury_Configuration["PrimaryStance"] ~= 2
          or UnitIsPlayer("target"))
          and UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
          and Fury_Configuration["PrimaryStance"] ~= 0))
          and SpellReadyIn(ABILITY_OVERPOWER_FURY) == 0 then
            if ActiveStance() ~= 1 then
                Debug("12. Battle Stance (Overpower)")
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                CastShapeshiftForm(1)
                FuryLastStanceCast = GetTime()
            else
                Debug("12. Overpower")
                CastSpellByName(ABILITY_OVERPOWER_FURY)
                FuryLastSpellCast = GetTime()
            end

        -- 13, Pummel if casting
        elseif Fury_Configuration[ABILITY_PUMMEL_FURY]
          and FurySpellInterrupt
          and UnitMana("player") >= 10
          and (not UnitIsPlayer("target")
          or (UnitIsPlayer("target")
          and (UnitClass("target") ~= CLASS_ROGUE_FURY
          and UnitClass("target") ~= CLASS_WARRIOR_FURY
          and UnitClass("target") ~= CLASS_HUNTER_FURY)))
          and (ActiveStance() == 3
          or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
          and Fury_Configuration["PrimaryStance"] ~= 0))
          and SpellReadyIn(ABILITY_PUMMEL_FURY) == 0 then
            if ActiveStance() ~= 3 then
                Debug("13. Berserker Stance (Pummel)")
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                FuryLastSpellCast = GetTime()
                if UnitName("target") == BOSS_NAX_KEL_THUZAD_FURY then
                    SendChatMessage(CHAT_KICKED_FURY ,"SAY" ,"common")
                end
                CastShapeshiftForm(3)
                FuryLastStanceCast = GetTime()
            else
                Debug("13. Pummel")
            end
            CastSpellByName(ABILITY_PUMMEL_FURY)
            if UnitName("target") == BOSS_NAX_KEL_THUZAD_FURY then
                SendChatMessage(CHAT_KICKED_FURY ,"SAY" ,"common")
            end

        -- 14, Shield bash to interrupt
        elseif Fury_Configuration[ABILITY_SHIELD_BASH_FURY]
          and FurySpellInterrupt
          and not Fury_Configuration[MODE_HEADER_AOE]
          and UnitMana("player") >= 10
          and Shield()
          and (not UnitIsPlayer("target")
          or (UnitIsPlayer("target")
          and (UnitClass("target") ~= CLASS_ROGUE_FURY
          and UnitClass("target") ~= CLASS_WARRIOR_FURY
          and UnitClass("target") ~= CLASS_HUNTER_FURY)))
          and (ActiveStance() ~= 3
          or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])))
          and SpellReadyIn(ABILITY_SHIELD_BASH_FURY) == 0 then
            if ActiveStance() == 3 then
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                Debug("14. Battle Stance (Shield Bash)")
                CastShapeshiftForm(1)
                CastSpellByName(ABILITY_SHIELD_BASH_FURY)
            else
                Debug("14. Shield Bash (interrupt)")
            end
            FuryDanceDone = true
            CastSpellByName(ABILITY_SHIELD_BASH_FURY)
            FuryLastSpellCast = GetTime()
            if UnitName("target") == BOSS_NAX_KEL_THUZAD_FURY then
                SendChatMessage(CHAT_KICKED_FURY ,"SAY" ,"common")
            end

        -- 15, Cast hamstring to stop runners
        elseif Fury_Configuration[ABILITY_HAMSTRING_FURY]
          and (UnitIsPlayer("target")
          or (Fury_Runners[UnitName("target")]
          and (UnitHealth("target") / UnitHealthMax("target") * 100) <= tonumber(Fury_Configuration["HamstringHealth"])))
          and Weapon()
          and (not SnareDebuff("target") or (FuryImpHamstring and UnitMana("player") < 30))
          and FuryAttack == true
          and not HasBuff("target", "INV_Potion_04")
          and not HasBuff("target", "Spell_Holy_SealOfValor")
          and Fury_Distance() == 5
          and UnitMana("player") >= HamstringCost()
          and (ActiveStance() ~= 2
          or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
          and Fury_Configuration["PrimaryStance"] ~= 0))
          and SpellReadyIn(ABILITY_HAMSTRING_FURY) == 0 then
            if ActiveStance() ~= 2 then
                Debug("15. Hamstring")
                if FuryOldStance == 2 then
                    FuryDanceDone = true
                end
            else
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                Debug("15. Berserker Stance (Hamstring)")
                if Fury_Configuration["PrimaryStance"] == 3 then
                    CastShapeshiftForm(3);
                else
                    CastShapeshiftForm(1);
                end
                FuryLastStanceCast = GetTime()
            end
            CastSpellByName(ABILITY_HAMSTRING_FURY)
            FuryLastStanceCast = GetTime()

        -- 16, Rend to antistealth
        elseif Fury_Configuration[ABILITY_REND_FURY]
          and UnitIsPlayer("target")
          and Weapon()
          and not AntiStealthDebuff()
          and (UnitClass("target") == CLASS_ROGUE_FURY
          or UnitClass("target") == CLASS_HUNTER_FURY)
          and UnitMana("player") >= 10
          and (ActiveStance() ~= 3
          or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
          and Fury_Configuration["PrimaryStance"] ~= 0))
          and SpellReadyIn(ABILITY_REND_FURY) == 0 then
            if ActiveStance() ~= 3 then
                Debug("16. Rend")
                if FuryOldStance == 3 then
                    FuryDanceDone = true
                end
            else
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                Debug("16. Battle Stance (Rend)")
                CastShapeshiftForm(1)
            end
            CastSpellByName(ABILITY_REND_FURY)
            FuryLastStanceCast = GetTime()

        -- 17, slow target
        elseif Fury_Configuration[ABILITY_PIERCING_HOWL_FURY]
          and FuryPiercingHowl
          and (UnitIsPlayer("target")
          or (Fury_Runners[UnitName("target")]
          and (UnitHealth("target") / UnitHealthMax("target") * 100) <= tonumber(Fury_Configuration["HamstringHealth"])))
          and Fury_Distance() <= 10
          and FuryAttack == true
          and not SnareDebuff("target")
          and not HasBuff("target", "INV_Potion_04")
          and not HasBuff("target", "Spell_Holy_SealOfValor")
          and UnitMana("player") >= 10
          and SpellReadyIn(ABILITY_PIERCING_HOWL_FURY)  == 0 then
                Debug("17. Piercing Howl")
                CastSpellByName(ABILITY_PIERCING_HOWL_FURY)
                FuryLastSpellCast = GetTime()

        -- 18, Rooted
        elseif debuffImmobilizing
          and Fury_Distance() >= 8 then
            if ActiveStance() ~= 2 then
                Debug("18. Defensive Stance (Rooted)")
                CastShapeshiftForm(2)
            else
                if FuryOldStance == 2 then
                    FuryDanceDone = true
                end
            end
            local slot = IsTrinketEquipped(ITEM_TRINKET_LINKENS_BOOMERANG_FURY)
            if slot ~= nil
              and (FurySpellInterrupt
              or UnitClass("target") == CLASS_HUNTER_FURY) then
                Debug("18. Linken's Boomerang")
                UseInventoryItem(slot)
            else
                slot = IsTrinketEquipped(ITEM_TRINKET_TIDAL_CHARM)
                if slot ~= nil
                  and FurySpellInterrupt then
                    Debug("18. Tidal Charm")
                    UseInventoryItem(slot)
                else
                    Fury_Shoot()
                end
            end

        -- 19, Berserker rage
        elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
          and FuryBerserkerRage
          and not UnitIsPlayer("target")
          and UnitName("target") ~= BOSS_MC_MAGMADAR_FURY
          and UnitMana("player") <= Fury_Configuration["MaximumRage"]
          and (ActiveStance() == 3
          or (Fury_Configuration["PrimaryStance"] ~= 2
          and UnitMana("player") <= FuryTacticalMastery
          and Fury_Configuration["PrimaryStance"] ~= 0))
          and SpellReadyIn(ABILITY_BERSERKER_RAGE_FURY) == 0 then
            if ActiveStance() ~= 3 then
                Debug("19. Berserker Stance (Berserker Rage)")
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                CastShapeshiftForm(3)
            else
                Debug("19. Berserker Rage")
                if FuryOldStance ~= 3 then
                    FuryDanceDone = true
                end
            end
            CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)

        -- 20, Stance dance
    elseif Fury_Configuration["PrimaryStance"]
          and Fury_Configuration["PrimaryStance"] ~= false
          and not FuryOldStance
          and not FuryDanceDone
          and (Fury_Configuration["PrimaryStance"] ~= 3
          or FuryBerserkerStance)
          and FuryLastStanceCast
          and FuryLastStanceCast + 1 <= GetTime()
          and Fury_Configuration["PrimaryStance"] ~= ActiveStance()
          and UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
          and Fury_Configuration["PrimaryStance"] ~= 0 then
            --Initiate stance dance
            Debug("20. Primary Stance (" .. Fury_Configuration["PrimaryStance"] .. ")")
            CastShapeshiftForm(Fury_Configuration["PrimaryStance"])
            FuryLastStanceCast = GetTime()

        -- 21, Disarm (PVP only)
        elseif Fury_Configuration[ABILITY_DISARM_FURY]
          and Weapon()
          and UnitIsPlayer("target")
          and (UnitClass("target") == CLASS_HUNTER_FURY
          or UnitClass("target") == CLASS_PALADIN_FURY
          or UnitClass("target") == CLASS_ROGUE_FURY
          or UnitClass("target") == CLASS_SHAMAN_FURY
          or UnitClass("target") == CLASS_WARRIOR_FURY)
          and UnitMana("player") >= 20
          and Fury_ImmuneDisarm[UnitName("target")] == nil
          and (ActiveStance() == 2
          or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
          and Fury_Configuration["PrimaryStance"] ~= 0))
          and SpellReadyIn(ABILITY_DISARM_FURY) == 0 then
            if ActiveStance() ~= 2 then
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                Debug("21. Defensive Stance (Disarm)")
                CastShapeshiftForm(2)
                FuryLastStanceCast = GetTime()
            else
                Debug("21. Disarm")
                if FuryOldStance ~= 2 then
                    FuryDanceDone = true
                end
            end
            CastSpellByName(ABILITY_DISARM_FURY)
            FuryLastSpellCast = GetTime()

        -- 22, Sweeping Strikes
        elseif FurySweepingStrikes
          and Fury_Configuration[ABILITY_SWEEPING_STRIKES_FURY]
          and Fury_GetEnemies() > 1
          and UnitMana("player") >= 30
          and SpellReadyIn(ABILITY_SWEEPING_STRIKES_FURY) == 0 then
            Debug("22. Sweeping Strikes")
            CastSpellByName(ABILITY_SWEEPING_STRIKES_FURY)

        -- 23, Bloodthirst
        elseif FuryBloodthirst
          and Fury_Configuration[ABILITY_BLOODTHIRST_FURY]
          and not Fury_Configuration[MODE_HEADER_AOE]
          and UnitMana("player") >= 30
          and SpellReadyIn(ABILITY_BLOODTHIRST_FURY) == 0 then
            Debug("23. Bloodthirst")
            CastSpellByName(ABILITY_BLOODTHIRST_FURY)
            FuryLastSpellCast = GetTime()

        -- 24, Mortal Strike
        elseif FuryMortalStrike
          and Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY]
          and Weapon()
          and not Fury_Configuration[MODE_HEADER_AOE]
          and UnitMana("player") >= 30
          and SpellReadyIn(ABILITY_MORTAL_STRIKE_FURY) == 0 then
            Debug("24. Mortal Strike")
            CastSpellByName(ABILITY_MORTAL_STRIKE_FURY)
            FuryLastSpellCast = GetTime()

        -- 25, Whirlwind
        elseif (Fury_Configuration[ABILITY_WHIRLWIND_FURY]
          or Fury_Configuration[MODE_HEADER_AOE])
          and Fury_Distance() <= 10
          and Weapon()
          and UnitMana("player") >= 25
          and (ActiveStance() == 3
          or (Fury_Configuration["PrimaryStance"] ~= 2
          and UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
          and Fury_Configuration["PrimaryStance"] ~= 0))
          and SpellReadyIn(ABILITY_WHIRLWIND_FURY) == 0 then
            if ActiveStance() ~= 3 then
                if not FuryOldStance then
                    FuryOldStance = ActiveStance()
                end
                Debug("25. Berserker Stance (Whirlwind)")
                CastShapeshiftForm(3)
                FuryLastStanceCast = GetTime()
            else
                Debug("25. Whirlwind")
                if FuryOldStance ~= 3 then
                    FuryDanceDone = true
                end
            end
            CastSpellByName(ABILITY_WHIRLWIND_FURY)
            WWEnemies.WWCount = 0
            FuryLastSpellCast = GetTime()
            WWEnemies.WWTime = GetTime()

        -- 26, Shield Slam
        elseif Fury_Configuration[ABILITY_SHIELD_SLAM_FURY]
          and FuryShieldSlam
          and Shield()
          and UnitMana("player") >= 20
          and SpellReadyIn(ABILITY_SHIELD_SLAM_FURY) == 0 then
            Debug("26. Shield Slam")
            CastSpellByName(ABILITY_SHIELD_SLAM_FURY)
            FuryLastSpellCast = GetTime()

        -- 27, Battle Shout
        elseif Fury_Configuration[ABILITY_BATTLE_SHOUT_FURY]
          and not HasBuff("player", "Ability_Warrior_BattleShout")
          and UnitMana("player") >= 10
          and SpellReadyIn(ABILITY_BATTLE_SHOUT_FURY) == 0 then
            Debug("27. Battle Shout")
            CastSpellByName(ABILITY_BATTLE_SHOUT_FURY)
            FuryLastSpellCast = GetTime()

        -- 28, Demoralizing Shout (PVE only)
        elseif Fury_Configuration[ABILITY_DEMORALIZING_SHOUT_FURY]
          and not HasDebuff("target", "Ability_Warrior_WarCry")
          and not HasDebuff("target", "Ability_Druid_DemoralizingRoar")
          and UnitMana("player") >= 10
          and not UnitIsPlayer("target")
          and (UnitClass("target") == CLASS_WARRIOR_FURY
          or UnitClass("target") == CLASS_ROGUE_FURY)
          and UnitLevel("Player") - UnitLevel("Target") < Fury_Configuration["DemoDiff"]
          and FuryAttack == true
          and SpellReadyIn(ABILITY_DEMORALIZING_SHOUT_FURY) == 0 then
            Debug("28. Demoralizing Shout")
            CastSpellByName(ABILITY_DEMORALIZING_SHOUT_FURY)
            FuryLastSpellCast = GetTime()

        --29, Revenge
        elseif Fury_Configuration[ABILITY_REVENGE_FURY]
          and FuryCombat
          and UnitMana("player") >= 5
          and FuryRevengeReadyUntil > GetTime()
          and SpellReadyIn(ABILITY_REVENGE_FURY) == 0 then
            Debug("29. Revenge")
            CastSpellByName(ABILITY_REVENGE_FURY)

        -- 30, Shield Block
        elseif Fury_Configuration[ABILITY_SHIELD_BLOCK_FURY]
          and Shield()
          and FuryCombat
          and ActiveStance() == 2
          and UnitName("targettarget") == UnitName("player")
          and UnitLevel("Target") > UnitLevel("Player") - Fury_Configuration["DemoDiff"]
          and UnitMana("player") >= 10
          and SpellReadyIn(ABILITY_SHIELD_BLOCK_FURY) == 0 then
            Debug("30. Shield Block")
            CastSpellByName(ABILITY_SHIELD_BLOCK_FURY)

        -- 31, Stance dance (part 2)
        elseif FuryDanceDone
          and FuryOldStance
          and FuryLastStanceCast + 1.5 <= GetTime()
          and UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"]) then
            --Initiate stance dance
            if not Fury_Configuration["PrimaryStance"] then
                Debug("31. Old Stance (" .. FuryOldStance .. ")")
                CastShapeshiftForm(FuryOldStance)
            else
                Debug("31. Primary Stance (" .. Fury_Configuration["PrimaryStance"] .. ")")
                CastShapeshiftForm(Fury_Configuration["PrimaryStance"])
            end
            FuryLastStanceCast = GetTime()
            if FuryOldStance == ActiveStance()
              or Fury_Configuration["PrimaryStance"] == ActiveStance() then
                Debug("31. Variables cleared (Dance done)")
                FuryOldStance = nil
                FuryDanceDone = nil
            end

        -- 32, Juju Flurry
        elseif FuryCombat
          and Fury_Configuration[ITEM_CONS_JUJU_FLURRY]
          and not HasBuff("player", "INV_Misc_MonsterScales_17")
          and FuryAttack == true
          and ItemReady(ITEM_CONS_JUJU_FLURRY) then
            Debug("32. "..ITEM_CONS_JUJU_FLURRY)
            UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_FLURRY)

        -- 33, Juju Chill
        elseif FuryCombat
          and FuryAttack == true
          and Fury_Configuration[ITEM_CONS_JUJU_CHILL]
          and not HasBuff("player", "INV_Misc_MonsterScales_09")
          and UseRes("frost")
          and ItemReady(ITEM_CONS_JUJU_CHILL) then
            Debug("33. "..ITEM_CONS_JUJU_CHILL)
            UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_CHILL)

        -- 34, Juju Ember
        elseif FuryCombat
          and Fury_Configuration[ITEM_CONS_JUJU_EMBER]
          and not HasBuff("player", "INV_Misc_MonsterScales_15")
          and UseRes("fire")
          and ItemReady(ITEM_CONS_JUJU_EMBER) then
            Debug("34. "..ITEM_CONS_JUJU_EMBER)
            UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_EMBER)

        -- 35, Juju Might
        elseif FuryCombat
          and FuryAttack == true
          and Fury_Configuration[ITEM_CONS_JUJU_MIGHT]
          and not HasBuff("player", "INV_Misc_MonsterScales_07")
          and not HasBuff("player", "INV_Potion_92") -- Winterfall Firewater
          and ItemReady(ITEM_CONS_JUJU_MIGHT) then
            Debug("35. "..ITEM_CONS_JUJU_MIGHT)
            UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_MIGHT)

        -- 36, Juju Power
        elseif FuryCombat
          and FuryAttack == true
          and Fury_Configuration[ITEM_CONS_JUJU_POWER]
          and not HasBuff("player", "INV_Misc_MonsterScales_11")
          and not HasBuff("player", "INV_Potion_61") -- Elixir of Giants
          and ItemReady(ITEM_CONS_JUJU_POWER) then
            Debug("36. "..ITEM_CONS_JUJU_POWER)
            UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_POWER)

        -- 37, Immolation potion
        elseif FuryCombat
          and Fury_Configuration[ITEM_CONS_OIL_OF_IMMOLATION]
          and not HasBuff("player", "Spell_Fire_Immolation")
          and ItemReady(ITEM_CONS_OIL_OF_IMMOLATION) then
            Debug("37. "..ITEM_CONS_OIL_OF_IMMOLATION)
            UseContainerItemByNameOnPlayer(ITEM_CONS_OIL_OF_IMMOLATION)

        -- 38, Racial berserking
        elseif FuryRacialBerserking
          and Fury_Configuration[RACIAL_BERSERKING_FURY]
          and UnitMana("player") >= 5
          and (UnitHealth("player") / UnitHealthMax("player") * 100) <= tonumber(Fury_Configuration["BerserkHealth"])
          and not HasBuff("player", "Racial_Berserk")
          and SpellReadyIn(RACIAL_BERSERKING_FURY) == 0 then
            Debug("38. Berserking")
            CastSpellByName(RACIAL_BERSERKING_FURY)
            FuryLastSpellCast = GetTime()

        -- 39, Blood Fury (Orc racial ability)
        elseif FuryRacialBloodFury
          and Fury_Configuration[RACIAL_BLOOD_FURY]
          and FuryAttack == true
          and ActiveStance() ~= 2
          and FuryCombat
          and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["DeathWishHealth"])
          and SpellReadyIn(RACIAL_BLOOD_FURY) == 0 then
            Debug("39. Blood Fury")
            CastSpellByName(RACIAL_BLOOD_FURY)

        -- 40, Death Wish
        elseif FuryDeathWish
          and Fury_Configuration[ABILITY_DEATH_WISH_FURY]
          and UnitMana("player") >= 10
          and FuryAttack == true
          and ActiveStance() ~= 2
          and FuryCombat
          and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["DeathWishHealth"])
          and SpellReadyIn(ABILITY_DEATH_WISH_FURY) == 0 then
            Debug("40. Death Wish")
            CastSpellByName(ABILITY_DEATH_WISH_FURY)

        -- 41 Earthstrike
        elseif Fury_Configuration[ITEM_TRINKET_EARTHSTRIKE]
          and FuryCombat
          and FuryAttack == true
          and IsTrinketEquipped(ITEM_TRINKET_EARTHSTRIKE) then
            Debug("41. Earthstrike")
            UseInventoryItem(IsTrinketEquipped(ITEM_TRINKET_EARTHSTRIKE))

        -- 42 Slayer's Crest
        elseif Fury_Configuration[ITEM_TRINKET_SLAYERS_CREST]
          and FuryCombat
          and FuryAttack == true
          and IsTrinketEquipped(ITEM_TRINKET_SLAYERS_CREST) then
            Debug("42. Slayer's Crest")
            UseInventoryItem(IsTrinketEquipped(ITEM_TRINKET_SLAYERS_CREST))

        -- 43 Kiss of the Spider
        elseif Fury_Configuration[ITEM_TRINKET_KOTS]
          and FuryCombat
          and FuryAttack == true
          and IsTrinketEquipped(ITEM_TRINKET_KOTS) then
            Debug("43. Kiss of the Spider")
            UseInventoryItem(IsTrinketEquipped(ITEM_TRINKET_KOTS))

        -- 44, Bloodrage
        elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
          and UnitMana("player") <= tonumber(Fury_Configuration["MaximumRage"])
          and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["BloodrageHealth"])
          and SpellReadyIn(ABILITY_BLOODRAGE_FURY) == 0 then
            Debug("44. Bloodrage")
            CastSpellByName(ABILITY_BLOODRAGE_FURY)

        -- 45, Treat debuffs (poisons)
        elseif Fury_Configuration[MODE_HEADER_DEBUFF]
          and Fury_TreatDebuff("player") then
            Debug("45. Treated debuff")

        -- 46, Swap back to normal weapons
        elseif Fury_Configuration["ExecuteSwapped"]
          and Outfitter_ExecuteCommand then
            Debug("46. unwear Execute weapon")
            Outfitter_ExecuteCommand("unwear Execute")
            Fury_Configuration["ExecuteSwapped"] = false

        -- 47, Dump rage with Heroic Strike or Cleave
        elseif (Fury_Configuration[MODE_HEADER_AOE]
          or Fury_Configuration["PrimaryStance"] == 2
          or ((Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY]
          and FuryMortalStrike
          and SpellReadyIn(ABILITY_MORTAL_STRIKE_FURY) ~= 0)
          or not Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY]
          or not FuryMortalStrike)
          and ((Fury_Configuration[ABILITY_BLOODTHIRST_FURY]
          and FuryBloodthirst
          and SpellReadyIn(ABILITY_BLOODTHIRST_FURY) ~= 0)
          or not Fury_Configuration[ABILITY_BLOODTHIRST_FURY]
          or not FuryBloodthirst)
          and ((Fury_Configuration[ABILITY_WHIRLWIND_FURY]
          and not SpellReadyIn(ABILITY_WHIRLWIND_FURY) ~= 0)
          or not Fury_Configuration[ABILITY_WHIRLWIND_FURY]
          or not FuryWhirlwind))  then

            -- 48, Will try to lessen the amounts of Heroic Strike, when instanct attacks (MS, BT, WW) are enabled
            -- Hamstring
            if Fury_Configuration[ABILITY_HAMSTRING_FURY]
              and Weapon()
              and UnitMana("player") >= HamstringCost()
              and UnitMana("player") >= tonumber(Fury_Configuration["FlurryTriggerRage"])
              and ((FuryFlurry
              and not HasBuff("player", "Ability_GhoulFrenzy"))
              or FuryImpHamstring
              or FurySwordSpec
              or FuryMaceSpec)
              and SpellReadyIn(ABILITY_HAMSTRING_FURY) == 0 then
                -- Try trigger...
                -- stun,imp attack speed, extra swing
                Debug("48. Hamstring (Trigger ...)")
                CastSpellByName(ABILITY_HAMSTRING_FURY)
                FuryLastSpellCast = GetTime()

            -- 49, Heroic Strike
            elseif Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY]
              and Weapon()
              and not Fury_Configuration[MODE_HEADER_AOE]
              and UnitMana("player") >= FuryHeroicStrikeCost
              and (UnitMana("player") >= tonumber(Fury_Configuration["NextAttackRage"])
              or (not FuryMortalStrike
              and not FuryBloodthirst)
              or Fury_Configuration["PrimaryStance"] == 2)
              and SpellReadyIn(ABILITY_HEROIC_STRIKE_FURY) == 0 then
                Debug("49. Heroic Strike")
                CastSpellByName(ABILITY_HEROIC_STRIKE_FURY)
                FuryLastSpellCast = GetTime()
                --No global cooldown, added anyway to prevent Heroic Strike from being spammed over other abilities

            -- 50, Cleave
            elseif (Fury_Configuration[ABILITY_CLEAVE_FURY]
              or Fury_Configuration[MODE_HEADER_AOE])
              and Weapon()
              and UnitMana("player") >= 20
              and ((UnitMana("player") >= tonumber(Fury_Configuration["NextAttackRage"]))
              or (Fury_Configuration[MODE_HEADER_AOE] and UnitMana("player") >= 25)
              or Fury_Configuration["PrimaryStance"] == 2)
              and SpellReadyIn(ABILITY_CLEAVE_FURY) == 0 then
                Debug("50. Cleave")
                CastSpellByName(ABILITY_CLEAVE_FURY)
                FuryLastSpellCast = GetTime()
                --No global cooldown, added anyway to prevent Cleave from being spammed over other abilities
            elseif not FuryRageDumped then
                Debug("51. Rage: "..tostring(UnitMana("player")))
                FuryRageDumped = true
            end
        elseif not FuryRageDumped then
            Debug("52. Rage: "..tostring(UnitMana("player")))
            FuryRageDumped = true
        end
    end
end

--------------------------------------------------
--
-- Handle Block command
--
--------------------------------------------------


local function Fury_Block()

    -- Shield Block
    if ActiveStance() ~= 2 then
        if FuryLastStanceCast + 1.5 <= GetTime() then
            if not FuryOldStance then
                FuryOldStance = ActiveStance()
            end
            Debug("B1. Defensive Stance (Block")
            CastShapeshiftForm(2)
            FuryLastStanceCast = GetTime()
        end
    end
    if Fury_Configuration[ABILITY_SHIELD_BLOCK_FURY]
      and Shield()
      and UnitMana("player") >= 10
      and SpellReadyIn(ABILITY_SHIELD_BLOCK_FURY) == 0 then
        CastSpellByName(ABILITY_SHIELD_BLOCK_FURY)
        Debug("B2. Shield Block")
        FuryDanceDone = true
        FuryLastSpellCast = GetTime()
    elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
      and UnitMana("player") < 10
      and SpellReadyIn(ABILITY_BLOODRAGE_FURY) == 0 then
        Debug("B3. Bloodrage")
        CastSpellByName(ABILITY_BLOODRAGE_FURY)
    end
end

--------------------------------------------------
--
-- Handle charge command
--
--------------------------------------------------

local function Fury_Charge()
    local dist = Fury_Distance()
    if not UnitExists("target") and not FuryCombat then
        if ActiveStance() ~= Fury_Configuration["PrimaryStance"] then
            CastShapeshiftForm(Fury_Configuration["PrimaryStance"])
            FuryLastStanceCast = GetTime()
        end
        Debug("No target")
        return
    end
    if FuryMount
      and dist <= 25 then
        -- Dismount as a first step
        Debug("Dismounting")
        Dismount()
        FuryMount = nil
    end
    if FuryCombat then
        if Fury_Configuration["AutoAttack"] and not FuryAttack then
            -- Auto attack closest target
            AttackTarget()
        end
        if Fury_Configuration[ABILITY_THUNDER_CLAP_FURY]
          and FuryLastChargeCast + 0.6 <= GetTime()
          and dist <= 7
          and not SnareDebuff("target")
          and UnitMana("player") >= FuryThunderClapCost
          and SpellReadyIn(ABILITY_THUNDER_CLAP_FURY) == 0 then
            if ActiveStance() ~= 1 then
                if FuryOldStance == nil then
                    FuryOldStance = ActiveStance()
                end
                Debug("C1.Arms Stance, Thunder Clap")
                CastShapeshiftForm(1)
                FuryLastStanceCast = GetTime()
            else
                Debug("C1.Thunder Clap")
                if FuryOldStance == 1 then
                    FuryDanceDone = true
                end
                CastSpellByName(ABILITY_THUNDER_CLAP_FURY)
                FuryLastSpellCast = GetTime()
            end

        elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
          and ActiveStance() == 3
          and dist <= 25
          and dist > 7
          and UnitMana("player") >= 10
          and FuryLastChargeCast + 1 < GetTime()
          and SpellReadyIn(ABILITY_INTERCEPT_FURY) == 0 then
            Debug("C2. Intercept")
            CastSpellByName(ABILITY_INTERCEPT_FURY)
            FuryLastChargeCast = GetTime()

        elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
          and ActiveStance() == 3
          and UnitMana("player") < 10
          and dist <= 25
          and SpellReadyIn(ABILITY_INTERCEPT_FURY) == 0
          and SpellReadyIn(ABILITY_BLOODRAGE_FURY) == 0 then
            Debug("C3. Bloodrage")
            CastSpellByName(ABILITY_BLOODRAGE_FURY)

        elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
          and FuryBerserkerRage
          and ActiveStance() == 3
          and UnitMana("player") < 10
          and SpellReadyIn(ABILITY_BLOODRAGE_FURY) ~= 0
          and SpellReadyIn(ABILITY_INTERCEPT_FURY) == 0
          and SpellReadyIn(ABILITY_BERSERKER_RAGE_FURY) == 0 then
            Debug("C4. Berserker Rage")
            CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)

        elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
          and ActiveStance() ~= 3
          and UnitMana("player") >= 10
          and FuryLastChargeCast + 1 < GetTime()
          and SpellReadyIn(ABILITY_INTERCEPT_FURY) <= 3 then
            Debug("C5. Berserker Stance (Intercept)")
            if FuryOldStance == nil then
                FuryOldStance = ActiveStance()
            elseif FuryOldStance == 3 then
                FuryDanceDone = true
            end
            CastShapeshiftForm(3)
            FuryLastStanceCast = GetTime()

        end
    else
        if Fury_Configuration[ABILITY_CHARGE_FURY]
          and ActiveStance() == 1
          and dist <= 25
          and dist > 7
          and FuryLastChargeCast + 0.5 < GetTime()
          and SpellReadyIn(ABILITY_CHARGE_FURY) == 0 then
            Debug("O1. Charge")
            CastSpellByName(ABILITY_CHARGE_FURY)
            FuryLastChargeCast = GetTime()

        elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
          and ActiveStance() == 3
          and dist <= 25
          and dist > 7
          and UnitMana("player") >= 10
          and FuryLastChargeCast + 2 < GetTime()
          and SpellReadyIn(ABILITY_INTERCEPT_FURY) == 0 then
            Debug("O2. Intercept")
            CastSpellByName(ABILITY_INTERCEPT_FURY)
            FuryLastChargeCast = GetTime()
            FuryLastSpellCast = GetTime()

        elseif Fury_Configuration[ABILITY_THUNDER_CLAP_FURY]
          and ActiveStance() == 1
          and dist <= 5
          and not SnareDebuff("target")
          and UnitMana("player") >= FuryThunderClapCost
          and SpellReadyIn(ABILITY_THUNDER_CLAP_FURY) == 0 then
            Debug("O3. Thunder Clap")
            CastSpellByName(ABILITY_THUNDER_CLAP_FURY)
            FuryLastSpellCast = GetTime()

        elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
          and SpellReadyIn(ABILITY_CHARGE_FURY) ~= 0
          and UnitMana("player") >= 10
          and FuryBerserkerStance
          and FuryLastChargeCast + 1 < GetTime()
          and SpellReadyIn(ABILITY_INTERCEPT_FURY) == 0 then
            if ActiveStance() ~= 3 then
                Debug("Berserker Stance (Intercept)")
                if FuryOldStance == nil then
                    FuryOldStance = ActiveStance()
                    FuryLastStanceCast = GetTime()
                end
                CastShapeshiftForm(3)

            else
                if FuryOldStance == 3 then
                    FuryDanceDone = true
                end
                CastSpellByName(ABILITY_INTERCEPT_FURY)
                FuryLastChargeCast = GetTime()
                FuryLastSpellCast = GetTime()
            end

        elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
          and FuryBerserkerRage
          and ActiveStance() == 3
          and SpellReadyIn(ABILITY_INTERCEPT_FURY) == 0
          and SpellReadyIn(ABILITY_CHARGE_FURY) ~= 0
          and dist <= 25
          and UnitMana("player") < 10
          and SpellReadyIn(ABILITY_BLOODRAGE_FURY) ~= 0
          and SpellReadyIn(ABILITY_BERSERKER_RAGE_FURY) == 0 then
            Debug("O5. Berserker Rage")
            CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)

        elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
          and ActiveStance() == 3
          and dist <= 25
          and SpellReadyIn(ABILITY_INTERCEPT_FURY) == 0
          and SpellReadyIn(ABILITY_CHARGE_FURY) ~= 0
          and UnitMana("player") < 10
          and SpellReadyIn(ABILITY_BLOODRAGE_FURY) == 0 then
            Debug("O6. Bloodrage")
            CastSpellByName(ABILITY_BLOODRAGE_FURY)

        elseif Fury_Configuration[ABILITY_CHARGE_FURY]
          and ActiveStance() ~= 1
          and dist > 7
          and SpellReadyIn(ABILITY_CHARGE_FURY) <= 5 then
            Debug("O7. Arm Stance (Charge)")
            if Fury_Configuration["PrimaryStance"] ~= 1
              and FuryOldStance == nil then
                FuryOldStance = ActiveStance()
                FuryLastStanceCast = GetTime()
            elseif FuryOldstance == 1 then
                FuryOldStance = nil
                FuryDanceDone = true
            end
            CastShapeshiftForm(1)
            FuryLastStanceCast = GetTime()
        end
    end
end

--------------------------------------------------

local function Fury_ScanTalents()
    local i = 1
    Debug("Scanning Spell Book")
    while true do
        local spellName, spellRank = GetSpellName(i, BOOKTYPE_SPELL)
        if not spellName then
            break
        end
        if spellName == ABILITY_BERSERKER_STANCE_FURY then
            FuryBerserkerStance = true
            Debug(ABILITY_BERSERKER_STANCE_FURY)
        elseif spellName == ABILITY_DEFENSIVE_STANCE_FURY then
            FuryDefensiveStance = true
            Debug(ABILITY_DEFENSIVE_STANCE_FURY)
        end
        i = i + 1
    end
    Debug("Scanning Talent Tree")
    --Calculate the cost of Heroic Strike based on talents
    local _, _, _, _, currRank = GetTalentInfo(1, 1)
    FuryHeroicStrikeCost = (15 - tonumber(currRank))
    if FuryHeroicStrikeCost < 15 then
        Debug("Heroic Cost")
    end
    --Calculate the rage retainment of Tactical Mastery
    local _, _, _, _, currRank = GetTalentInfo(1, 5)
    FuryTacticalMastery = (tonumber(currRank) * 5)
    if FuryTacticalMastery > 0 then
        Debug("Tactical Mastery")
    end
    local _, _, _, _, currRank = GetTalentInfo(1, 6)
    FuryThunderClapCost = (20 - tonumber(currRank))
    if FuryThunderClapCost < 20 then
        Debug("Improved Thunder Clap")
    end
    -- Check for Sweeping Strikes
    local _, _, _, _, currRank = GetTalentInfo(1, 13)
    if currRank > 0 then
        Debug("Sweeping Strikes")
        FurySweepingStrikes = true
    else
        FurySweepingStrikes = false
    end
    -- Check for Mace Specializaton
    local _, _, _, _, currRank = GetTalentInfo(1, 14)
    if currRank > 0 then
        Debug("Mace Specializaton")
        FuryMaceSpec = true
    else
        FuryMaceSpec = false
    end
    -- Check for Sword Specializaton
    local _, _, _, _, currRank = GetTalentInfo(1, 15)
    if currRank > 0 then
        Debug("Sword Specializaton")
        FurySwordSpec = true
    else
        FurySwordSpec = false
    end
    -- Check for Improved Hamstring
    local _, _, _, _, currRank = GetTalentInfo(1, 17)
    if currRank > 0 then
        Debug("Improved Hamstring")
        FuryImpHamstring = true
    else
        FuryImpHamstring = false
    end
    --Check for Mortal Strike
    local _, _, _, _, currRank = GetTalentInfo(1, 18)
    if currRank > 0 then
        Debug("Mortal Strike")
        FuryMortalStrike = true
    else
        FuryMortalStrike = false
    end
    --Check for Piercing Howl
    local _, _, _, _, currRank = GetTalentInfo(2, 6)
    if currRank > 0 then
        Debug("Piercing Howl")
        FuryPiercingHowl = true
    else
        FuryPiercingHowl = false
    end
    --Calculate the cost of Execute based on talents
    local _, _, _, _, currRank = GetTalentInfo(2, 10)
    FuryExecuteCost = (15 - strsub(tonumber(currRank) * 2.5, 1, 2))
    if FuryExecuteCost < 15 then
        Debug("Execute Cost")
    end
    --Check for Death Wish
    local _, _, _, _, currRank = GetTalentInfo(2, 13)
    if currRank > 0 then
        Debug("Death Wish")
        FuryDeathWish = true
    else
        FuryDeathWish = false
    end
    -- Check for Improved Berserker Rage
    local _, _, _, _, currRank = GetTalentInfo(2, 15)
    if currRank > 0 then
        Debug("Improved Berserker Rage")
        FuryBerserkerRage = true
    else
        FuryBerserkerRage = false
    end
    --Check for Flurry
    local _, _, _, _, currRank = GetTalentInfo(2, 16)
    if currRank > 0 then
        Debug("Flurry")
        FuryFlurry = true
    else
        FuryFlurry = false
    end

    --Check for Bloodthirst
    local _, _, _, _, currRank = GetTalentInfo(2, 17)
    if currRank > 0 then
        Debug("Bloodthirst")
        FuryBloodthirst =  true
    else
        FuryBloodthirst = false
    end
    --Check for Shield Slam
    local _, _, _, _, currRank = GetTalentInfo(3, 17)
    if currRank > 0 then
        Debug("Shield Slam")
        FuryShieldSlam =  true
    else
        FuryShieldSlam = false
    end
    if UnitRace("player") == RACE_ORC then
        Debug("Blood Fury")
        FuryRacialBloodFury = true
    else
        FuryRacialBloodFury = false
    end
    if UnitRace("player") == RACE_TROLL then
        Debug("Berserking")
        FuryRacialBerserking = true
    else
        FuryRacialBerserking = false
    end
    if SpellId("Whirlwind") then
        Debug("Whirlwind")
        FuryWhirlwind = true
    else
        FuryWhirlwind = false
    end
    FuryTalents = true
end

--------------------------------------------------

local function setOptionRange(option, text, v, vmin, vmax)
    if v ~= "" then
        if tonumber(v) < vmin then
            v = vmin
        elseif tonumber(v) > vmax then
            v = vmax
        end
        Fury_Configuration[option] = tonumber(v)
    else
        v = Fury_Configuration[option]
    end
    Print(text .. v .. ".")
end

--------------------------------------------------

local function printOption(option, text)
    if Fury_Configuration[option] == true then
        Print(text .. " " .. TEXT_FURY_ENABLED .. ".")
    end
end
--------------------------------------------------

local function toggleOption(option, text)
    if Fury_Configuration[option] == true then
        Fury_Configuration[option] = false
        Print(text .. " " .. TEXT_FURY_DISABLED .. ".")
    elseif Fury_Configuration[option] == false then
        Fury_Configuration[option] = true
        Print(text .. " " .. TEXT_FURY_ENABLED .. ".")
    else
        return false
    end
    return true
end

--------------------------------------------------
--
-- Chat Handlers
--
--------------------------------------------------

function Fury_SlashCommand(msg)
    local _, _, command, options = string.find(msg, "([%w%p]+)%s*(.*)$")
    if command then
        command = string.lower(command)
    end
    if not (UnitClass("player") == CLASS_WARRIOR_FURY) then
        return
    end
    if command == nil
      or command == "" then
        Fury()

    elseif command == "charge" then
        Fury_Charge()

    elseif command == "block" then
        Fury_Block()

    elseif command == "shoot" then
        Fury_Shoot()

    elseif command == "aoe" then
        toggleOption(MODE_HEADER_AOE, MODE_HEADER_AOE)

    elseif command == "toggle" then
        toggleOption("Enabled", BINDING_HEADER_FURY)

    elseif command == "debug" then
        toggleOption("Debug", SLASH_FURY_DEBUG)

    elseif command == "attack" then
        toggleOption("AutoAttack", SLASH_FURY_AUTOATTACK)

    elseif command == "dance" then
        setOptionRange("StanceChangeRage", SLASH_FURY_DANCE, options, 0, 100)

    elseif command == "rage" then
        setOptionRange("MaximumRage", SLASH_FURY_RAGE, options, 0, 100)

    elseif command == "attackrage" then
        setOptionRange("NextAttackRage", SLASH_FURY_ATTACKRAGE, options, 0 , 100)

    elseif command == "flurrytrigger" then
        setOptionRange("FlurryTriggerRage", SLASH_FURY_FLURRYTRIGGER, options, 0, 100)

    elseif command == "bloodrage" then
        setOptionRange("BloodrageHealth", SLASH_FURY_BLOODRAGE, options, 1, 100)

    elseif command == "demodiff" then
        setOptionRange("DemoDiff", SLASH_FURY_DEMODIFF, options, -3, 60)

    elseif command == "deathwish" then
        setOptionRange("DeathWishHealth", SLASH_FURY_DEATHWISH, options, 1, 100)

    elseif command == "hamstring" then
        setOptionRange("HamstringHealth", SLASH_FURY_HAMSTRING, options, 1, 100)

    elseif command == "berserk" then
        setOptionRange("BerserkHealth", SLASH_FURY_TROLL, options, 1, 100)

    elseif command == "threat" then
        --If HS then use cleave, if cleave then use HS
        if Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] then
            Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = false
            Fury_Configuration[ABILITY_CLEAVE_FURY] = true
            Print(SLASH_FURY_LOWTHREAT)
        else
            Fury_Configuration[ABILITY_CLEAVE_FURY] = false
            Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = true
            Print(SLASH_FURY_HIGHTHREAT)
        end

    elseif command == "prot" then
        if Fury_Configuration["PrimaryStance"] == 2 then
            Fury_Configuration["PrimaryStance"] = Fury_Configuration["ProtOldStance"]
            Fury_Configuration[ABILITY_SUNDER_ARMOR_FURY] = false
            Fury_Configuration[ABILITY_REVENGE_FURY] = false
            Fury_Configuration[ABILITY_OVERPOWER_FURY] = true
            Fury_Configuration[ABILITY_DEMORALIZING_SHOUT_FURY] = false
            Print(MODE_HEADER_PROT .. " " .. TEXT_FURY_DISABLED .. ".")
        else
            if Fury_Configuration["PrimaryStance"] == 2 then
                Fury_Configuration["ProtOldStance"] = 3
            else
                Fury_Configuration["ProtOldStance"] = Fury_Configuration["PrimaryStance"]
            end
            Fury_Configuration["PrimaryStance"] = 2
            Fury_Configuration[ABILITY_SUNDER_ARMOR_FURY] = true
            Fury_Configuration[ABILITY_REVENGE_FURY] = true
            Fury_Configuration[ABILITY_OVERPOWER_FURY] = false
            Fury_Configuration[ABILITY_DEMORALIZING_SHOUT_FURY] = true
            Print(MODE_HEADER_PROT .. " " .. TEXT_FURY_ENABLED .. ".")
        end

    elseif command == "stance" then
        if options == ABILITY_BATTLE_STANCE_FURY
          or options == "1" then
            Fury_Configuration["PrimaryStance"] = 1
            Print(SLASH_FURY_STANCE .. ABILITY_BATTLE_STANCE_FURY .. ".")
        elseif options == ABILITY_DEFENSIVE_STANCE_FURY
          or options == "2" then
            Fury_Configuration["PrimaryStance"] = 2
            Print(SLASH_FURY_STANCE .. ABILITY_DEFENSIVE_STANCE_FURY .. ".")
        elseif options == ABILITY_BERSERKER_STANCE_FURY
          or options == "3" then
            Fury_Configuration["PrimaryStance"] = 3
            Print(SLASH_FURY_STANCE .. ABILITY_BERSERKER_STANCE_FURY .. ".")
        elseif options == "default" then
            Fury_Configuration["PrimaryStance"] = false
            Print(SLASH_FURY_STANCE .. TEXT_FURY_DEFAULT .. ".")
        else
            Fury_Configuration["PrimaryStance"] = 0
            Print(SLASH_FURY_NOSTANCE .. TEXT_FURY_DISABLED .. ".")
        end

    elseif command == "juju" then
        if options == "flurry" then
            toggleOption(ITEM_CONS_JUJU_FLURRY, ITEM_CONS_JUJU_FLURRY)
        elseif options == "chill" then
            toggleOption(ITEM_CONS_JUJU_CHILL, ITEM_CONS_JUJU_CHILL)
        elseif options == "might" then
            toggleOption(ITEM_CONS_JUJU_MIGHT, ITEM_CONS_JUJU_MIGHT)
        elseif options == "ember" then
            toggleOption(ITEM_CONS_JUJU_EMBER, ITEM_CONS_JUJU_EMBER)
        elseif options == "power" then
            toggleOption(ITEM_CONS_JUJU_POWER, ITEM_CONS_JUJU_POWER)
        else
            Print(HELP_JUJU)
        end

    elseif command == "ooi" then
        toggleOption(ITEM_CONS_OIL_OF_IMMOLATION, ITEM_CONS_OIL_OF_IMMOLATION)

    elseif command == "debuff" then
        toggleOption(MODE_HEADER_DEBUFF, MODE_HEADER_DEBUFF)

    elseif command == "earthstrike" then
        toggleOption(ITEM_TRINKET_EARTHSTRIKE, ITEM_TRINKET_EARTHSTRIKE)

    elseif command == "slayer" or (command == "slayer's" and options == "crest") then
        toggleOption(ITEM_TRINKET_SLAYERS_CREST, ITEM_TRINKET_SLAYERS_CREST)

    elseif command == "kots" then
        toggleOption(ITEM_TRINKET_KOTS, ITEM_TRINKET_KOTS)

    elseif command == "executeswap" then
        toggleOption("ExecuteSwap", "Execute Swap")

    elseif command == "distance" then
        if UnitCanAttack("player", "target") then
            Print(TEXT_FURY_DISTANCE.." "..Fury_Distance().." "..TEXT_FURY_YARDS)
        else
            Print(TEXT_FURY_NO_ATTACKABLE_TARGET)
        end

    elseif command == "cons" then
        printOption(ITEM_CONS_JUJU_FLURRY, ITEM_CONS_JUJU_FLURRY)
        printOption(ITEM_CONS_JUJU_CHILL, ITEM_CONS_JUJU_CHILL)
        printOption(ITEM_CONS_JUJU_MIGHT, ITEM_CONS_JUJU_MIGHT)
        printOption(ITEM_CONS_JUJU_EMBER, ITEM_CONS_JUJU_EMBER)
        printOption(ITEM_CONS_JUJU_POWER, ITEM_CONS_JUJU_POWER)
        printOption(ITEM_CONS_OIL_OF_IMMOLATION, ITEM_CONS_OIL_OF_IMMOLATION)
        printOption(MODE_HEADER_DEBUFF, MODE_HEADER_DEBUFF)

    elseif command == "talents" then
        Print(CHAT_TALENTS_RESCAN_FURY)
        Fury_InitDistance()
        Fury_ScanTalents()

    elseif command == "where" then
        Print(TEXT_FURY_MAP_ZONETEXT .. (GetMinimapZoneText() or ""))
        Print(TEXT_FURY_REAL_ZONETEXT .. (GetRealZoneText() or ""))
        Print(TEXT_FURY_SUB_ZONETEXT .. (GetSubZoneText() or ""))
        Print(TEXT_FURY_PVP_INFO .. (GetZonePVPInfo() or ""))
        Print(TEXT_FURY_ZONETEXT .. (GetZoneText() or ""))

    elseif command == "unit" then
        if options ~= nil
          and options ~= "" then
            target = options
        elseif UnitName("target") ~= nil then
            target = "target"
        else
            target = "player"
        end
        Print(TEXT_FURY_NAME .. (UnitName(target) or "")..TEXT_FURY_CLASS..(UnitClass(target) or "").. TEXT_FURY_CLASSIFICATION .. (UnitClassification(target) or ""))
        if UnitRace(target) then
            Print(TEXT_FURY_RACE .. (UnitRace(target) or ""))
        else
            Print(TEXT_FURY_TYPE .. (UnitCreatureType(target) or ""))
        end
        PrintEffects(target)

    elseif command == "ability" then
        if options == ABILITY_HEROIC_STRIKE_FURY
          and not Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] then
            Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = true
            Print(ABILITY_HEROIC_STRIKE_FURY .. " "..TEXT_FURY_ENABLED..".")
            if Fury_Configuration[ABILITY_CLEAVE_FURY] then
                Fury_Configuration[ABILITY_CLEAVE_FURY] = false
                Print(ABILITY_CLEAVE_FURY .. " "..TEXT_FURY_DISABLED..".")
            end
        elseif options == ABILITY_CLEAVE_FURY
          and not Fury_Configuration[ABILITY_CLEAVE_FURY] then
            Fury_Configuration[ABILITY_CLEAVE_FURY] = true
            Print(ABILITY_CLEAVE_FURY .. " "..TEXT_FURY_ENABLED..".")
            if Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] then
                Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = falses
                Print(ABILITY_HEROIC_STRIKE_FURY .. " "..TEXT_FURY_DISABLED..".")
            end
        elseif Fury_Configuration[options] then
            Fury_Configuration[options] = false
            Print(options .. " "..TEXT_FURY_DISABLED..".")
        elseif Fury_Configuration[options] == false then
            Fury_Configuration[options] = true
            Print(options .. " "..TEXT_FURY_ENABLED..".")
        else
            Print(options .. " "..TEXT_FURY_NOT_FOUND..".")
        end

    elseif command == "log" then
        if options == "on" then
            LogToFile(true)
        else
            LogToFile(false)
        end

    elseif command == "version" then
        Print(SLASH_FURY_VERSION.." "..FURY_VERSION)

    elseif command == "help" then
        local helps = {
          ["ability"] = HELP_ABILITY,
          ["aoe"] = HELP_AOE,
          ["attack"] = HELP_ATTACK,
          ["attackrage"] = HELP_ATTACKRAGE,
          ["berserk"] = HELP_BERSERK,
          ["block"] = HELP_BLOCK,
          ["bloodrage"] = HELP_BLOODRAGE,
          ["charge"] = HELP_CHARGE,
          ["cons"] = HELP_CONS,
          ["dance"] = HELP_DANCE,
          ["debuff"] = HELP_DEBUFF,
          ["debug"] = HELP_DEBUG,
          ["demodiff"] = HELP_DEMODIFF,
          ["distance"] = HELP_DISTANCE,
          ["earthstrike"] = HELP_EARTHSTRIKE,
          ["executeswap"] = HELP_EXECUTESWAP,
          ["flurrytrigger"] = HELP_FLURRYTRIGGER,
          ["hamstring"] = HELP_HAMSTRING,
          ["help"] = HELP_HELP,
          ["juju"] = HELP_JUJU,
          ["kots"] = HELP_KOTS,
          ["log"] = HELP_LOG,
          ["ooi"] = HELP_OOI,
          ["rage"] = HELP_RAGE,
          ["shoot"] = HELP_SHOOT,
          ["slayer's"] = HELP_SLAYERS_CREST,
          ["stance"] = HELP_STANCE,
          ["talents"] = HELP_TALENTS,
          ["threat"] = HELP_THREAT,
          ["toggle"] = HELP_TOGGLE,
          ["unit"] = HELP_UNIT,
          ["where"] = HELP_WHERE
        }
        if options == nil or options == "" then
            local cmds = ""
            cmds = SLASH_FURY_HELP
            for k,_ in pairs(helps) do
                if cmds ~= "" and cmds ~= SLASH_FURY_HELP then
                    cmds = cmds..", "
                end
                cmds = cmds..k
                if string.len(cmds) > 80 then
                    Print(cmds)
                    cmds = ""
                end
            end
            Print(cmds)
        elseif helps[options] ~= nil then
            Print(helps[options])
        else
            Print(HELP_UNKNOWN)
        end
    else
        Print(SLASH_FURY_HELP)
    end
end

--------------------------------------------------
--
-- Event Handlers
--
--------------------------------------------------

function Fury_OnLoad()
    local evs = {
        "CHARACTER_POINTS_CHANGED",
        "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES",
        "CHAT_MSG_COMBAT_SELF_MISSES",
        "CHAT_MSG_MONSTER_EMOTE",
        "CHAT_MSG_SPELL_AURA_GONE_SELF",
        "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS",
        "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF",
        "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE",
        "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF",
        "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF",
        "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE",
        "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE",
        "CHAT_MSG_SPELL_SELF_DAMAGE",
        "PLAYER_AURAS_CHANGED",
        "PLAYER_ENTER_COMBAT",
        "PLAYER_LEAVE_COMBAT",
        "PLAYER_REGEN_DISABLED",
        "PLAYER_REGEN_ENABLED",
        "PLAYER_TARGET_CHANGED",
        "VARIABLES_LOADED",
    }
    for _, ev in pairs(evs) do
        this:RegisterEvent(ev)
    end

    WWEnemies = { Hist = {}, WWTime = 0, WWCount = nil, CleaveTime = 0, CleaveCount = nil }
    for i = 0,5 do
        WWEnemies.Hist[i] = 0
    end

    FuryLastSpellCast = GetTime()
    FuryLastStanceCast = GetTime()
    FuryLastLog = GetTime()
    FuryRevengeTime = 0
    FuryLastChargeCast = 0
    FuryRevengeReadyUntil = 0
    FlurryCombatTotal = 0
    FuryCombatTotal = 0
    SlashCmdList["FURY"] = Fury_SlashCommand
    SLASH_FURY1 = "/fury"
end

--------------------------------------------------

function Fury_OnEvent(event)

    if event == "VARIABLES_LOADED" then
        --Check for settings
        Fury_Configuration_Init()

    elseif (event == "CHAT_MSG_COMBAT_SELF_MISSES"
      or event == "CHAT_MSG_SPELL_SELF_DAMAGE"
      or event == "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF")
      and (string.find(arg1, CHAT_OVERPOWER1_FURY)
      or string.find(arg1, CHAT_OVERPOWER2_FURY)) then
        --Check to see if enemy dodges
        FuryOverpower = GetTime()

    elseif event == "CHAT_MSG_SPELL_SELF_DAMAGE"
      and (string.find(arg1, CHAT_OVERPOWER3_FURY)
      or string.find(arg1, CHAT_OVERPOWER4_FURY)
      or string.find(arg1, CHAT_OVERPOWER5_FURY)) then
        --Check to see if Overpower is used
        FuryOverpower = nil

    elseif event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE"
      or event == "CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF"
      or event == "CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF"
      or event == "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE"  then
        --Check to see if enemy casts spell
        for mob, spell in string.gfind(arg1, CHAT_CAST_FURY) do
            if mob == UnitName("target")
              and UnitCanAttack("player", "target")
              and mob ~= spell then
                FurySpellInterrupt = GetTime()
                return
            end
        end

    elseif event == "CHAT_MSG_SPELL_SELF_DAMAGE"
      and string.find(arg1, CHAT_INTERRUPT1_FURY)
      or event == "CHAT_MSG_COMBAT_SELF_MISSES"
      and string.find(arg1, CHAT_INTERRUPT2_FURY)
      or event == "CHAT_MSG_COMBAT_SELF_MISSES"
      and string.find(arg1, CHAT_INTERRUPT3_FURY)
      or event == "CHAT_MSG_COMBAT_SELF_MISSES"
      and string.find(arg1, CHAT_INTERRUPT4_FURY)
      or event == "CHAT_MSG_COMBAT_SELF_MISSES"
      and string.find(arg1, CHAT_INTERRUPT5_FURY) then
        --Check to see if Pummel/Shield Bash is used
        FurySpellInterrupt = nil

    elseif (event == "CHAT_MSG_SPELL_SELF_DAMAGE"
      or event == "CHAT_MSG_COMBAT_SELF_MISSES")
      and string.find(arg1, CHAT_WHIRLWIND_FURY) then
        if WWEnemies.WWCount == nil then
            WWEnemies.WWCount = 1
        else
            WWEnemies.WWCount = WWEnemies.WWCount + 1
        end

    elseif (event == "CHAT_MSG_SPELL_SELF_DAMAGE"
      or event == "CHAT_MSG_COMBAT_SELF_MISSES")
      and string.find(arg1, CHAT_CLEAVE_FURY) then
        if WWEnemies.CleaveCount == nil then
            WWEnemies.CleaveCount = 1
            WWEnemies.CleaveTime = GetTime()
        else
            WWEnemies.CleaveCount = WWEnemies.CleaveCount + 1
        end

    elseif event == "CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE" then
        --Check to see if getting affected by breakable effects
        if arg1 == CHAT_SAP_FURY
          or arg1 == CHAT_GOUGE_FURY
          or arg1 == CHAT_REPENTANCE_FURY
          or arg1 == CHAT_ROCKET_HELM_FURY then
            FuryIncapacitate = true

        elseif arg1 == CHAT_FEAR_FURY
          or arg1 == CHAT_INTIMIDATING_SHOUT_FURY
          or arg1 == CHAT_PSYCHIC_SCREAM_FURY
          or arg1 == CHAT_PANIC_FURY
          or arg1 == CHAT_BELLOWING_ROAR_FURY
          or arg1 == CHAT_ANCIENT_DESPAIR_FURY
          or arg1 == CHAT_TERRIFYING_SCREECH_FURY
          or arg1 == CHAT_HOWL_OF_TERROR_FURY then
            FuryFear = true
        end

    elseif event == "CHAT_MSG_SPELL_AURA_GONE_SELF" then
        --Check to see if breakable effects fades
        if arg1 == CHAT_SAP2_FURY
          or arg1 == CHAT_GOUGE2_FURY
          or arg1 == CHAT_REPENTANCE2_FURY
          or arg1 == CHAT_ROCKET_HELM2_FURY then
            FuryIncapacitate = nil

        elseif arg1 == CHAT_FEAR2_FURY
          or arg1 == CHAT_INTIMIDATING_SHOUT2_FURY
          or arg1 == CHAT_PSYCHIC_SCREAM2_FURY
          or arg1 == CHAT_PANIC2_FURY
          or arg1 == CHAT_BELLOWING_ROAR2_FURY
          or arg1 == CHAT_ANCIENT_DESPAIR2_FURY
          or arg1 == CHAT_TERRIFYING_SCREECH2_FURY
          or arg1 == CHAT_HOWL_OF_TERROR2_FURY then
            FuryFear = nil
        elseif arg1 == CHAT_LOST_FLURRY_FURY then
            if FuryFlurryStart then
                FlurryCombatTotal = FlurryCombatTotal + (GetTime() - FuryFlurryStart)
                FuryFlurryStart = nil
            end
            if FuryAttackEnd and FuryFlurry and (FlurryCombatTotal > 0) and (FlurryCombatTotal > 0) then
                local p = math.floor(FlurryCombatTotal / FuryCombatTotal * 100)
                Debug(TEXT_FURY_FLURRY .. p .. "%")
                FlurryCombatTotal = 0
                FuryCombatTotal = 0
            end
        end

    elseif event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES" then
        -- set up time for revenge
        if string.find(arg1, CHAT_BLOCK_FURY)
          or string.find(arg1, CHAT_PARRY_FURY)
          or string.find(arg1, CHAT_DODGE_FURY) then
            FuryRevengeReadyUntil = GetTime() + 4
        end

    elseif event == "CHAT_MSG_MONSTER_EMOTE" then
        --Check to see if enemy flees
        Fury_RunnerDetect(arg1, arg2)

    elseif event == "PLAYER_AURAS_CHANGED" then
        --Check to see if mounted
        if UnitIsMounted("player") then
            FuryMount = true
        else
            FuryMount = false
        end

    elseif event == "CHAT_MSG_SPELL_PERIODIC_SELF_BUFFS" then
        if arg1 == CHAT_GAINED_FLURRY_FURY then
            FuryFlurryStart = GetTime()
        end

    elseif event == "PLAYER_TARGET_CHANGED"
      or (event == "CHARACTER_POINTS_CHANGED"
      and arg1 == -1) then
        --Reset Overpower and interrupts, check to see if talents are being calculated
        if event == "PLAYER_TARGET_CHANGED" then
            Fury_SetEnemies(1)
            FuryOverpower = nil
            FurySpellInterrupt = nil
        end
        if not FuryTalents
          and UnitClass("player") == CLASS_WARRIOR_FURY then
            if Fury_Configuration["DebugChannel"] then
                LogToFile(true)
            end
            Fury_InitDistance()
            Fury_ScanTalents()
        end

    elseif event == "PLAYER_REGEN_DISABLED" then
        FuryCombat = true
        FuryCombatStart = GetTime()
        FlurryCombatTotal = 0
        FuryCombatTotal = 0
        if not FuryAttackStart then
            FuryAttackEnd = nil
            FuryAttackStart = FuryCombatStart
         end

    elseif event == "PLAYER_REGEN_ENABLED" then
        FuryCombatEnd = GetTime()
        FuryCombat = nil
        FuryDanceDone = nil
        FuryOldStance = nil
        FuryFlurryStart = nil
        if FuryFlurry and (FlurryCombatTotal > 0) then
            local p = math.floor(FlurryCombatTotal / FuryCombatTotal * 100)
            Debug(TEXT_FURY_FLURRY .. p .. "%")
            FlurryCombatTotal = 0
            FuryCombatTotal = 0
        end
        for slot = 1, 18 do
            local name = CheckCooldown(slot)
            if name then
                Print(name.." "..CHAT_IS_ON_CD_FURY)
            end
        end

    elseif event == "PLAYER_ENTER_COMBAT" then
        FuryAttack = true
        FuryAttackEnd = nil
        FuryAttackStart = GetTime()
        if HasBuff("player", "Ability_GhoulFrenzy") then
            FuryFlurryStart = GetTime()
        end

    elseif event == "PLAYER_LEAVE_COMBAT" then
        FuryAttack = nil
        if FuryAttackStart then
            FuryAttackEnd = GetTime()
            FuryCombatTotal = FuryCombatTotal + (FuryAttackEnd - FuryAttackStart)
            if FuryFlurryStart then
                FlurryCombatTotal = FlurryCombatTotal + (FuryAttackEnd - FuryFlurryStart)
                FuryFlurryStart = nil
            end
        end

    elseif event == "CHAT_MSG_SPELL_DAMAGESHIELDS_ON_SELF" then
        local _,_,name = string.find(arg1, CHAT_DISARM_IMMUNE_FURY)
        if name ~= nil then
            Fury_ImmuneDisarm[name] = true
            Print(TEXT_FURY_IMMUNE_TO_DISARM1 .. name .. TEXT_FURY_IMMUNE_TO_DISARM2)
        end
    end
end

--------------------------------------------------
