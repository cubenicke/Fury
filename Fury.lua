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

local function Fury_Configuration_Init()

	FURY_VERSION = "1.16.3"

	if not Fury_Configuration then
		Fury_Configuration = { }
	end
	if not Fury_Runners then
		Fury_Runners = { }
	end

	if Fury_Configuration["Enabled"] == nil then
		Fury_Configuration["Enabled"] = true --Set to false to disable the addon
	end
	if Fury_Configuration["Debug"] == nil then
		Fury_Configuration["Debug"] = false --Set to true to enable debugging feedback
	end
	if Fury_Configuration["StanceChangeRage"] == nil then
		Fury_Configuration["StanceChangeRage"] = 25 --Set this to the amount of rage allowed to be wasted when switching stances
	end
	if Fury_Configuration["MaximumRage"] == nil then
		Fury_Configuration["MaximumRage"] = 60 --Set this to the maximum amount of rage allowed when using abilities to increase rage
	end
	if Fury_Configuration["BloodrageHealth"] == nil then
		Fury_Configuration["BloodrageHealth"] = 50 --Set this to the minimum percent of health to have when using Bloodrage
	end
	if Fury_Configuration["DeathWishHealth"] == nil then
		Fury_Configuration["DeathWishHealth"] = 60 --Set this to the minimum percent of health to have when using Death Wish
	end
	if Fury_Configuration["NextAttackRage"] == nil then
		Fury_Configuration["NextAttackRage"] = 30 --Set this to the minimum rage to have to use next attack abilities (Cleave and Heroic Strike)
	end
	if Fury_Configuration["BerserkHealth"] == nil then
		Fury_Configuration["BerserkHealth"] = 60 --Set this to the minimum percent of health to have when using Berserk
	end
	if Fury_Configuration["HamstringHealth"] == nil then
		Fury_Configuration["HamstringHealth"] = 40 --Set this to the maximum percent of health allowed when using Hamstring on NPCs
	end
	if Fury_Configuration["AutoAttack"] == nil then
		Fury_Configuration["AutoAttack"] = true --Set to false to disable auto-attack
	end
	if Fury_Configuration["PrimaryStance"] == nil then
		Fury_Configuration["PrimaryStance"] = false --Set this to the stance to fall back to after performing an attack requiring another stance
	end
	if Fury_Configuration["DemoDiff"] == nil then
		Fury_Configuration["DemoDiff"] = 7 -- When level difference is greater don't do Demoralizing Shout
	end
	if Fury_Configuration[MODE_HEADER_AOE] == nil then
		Fury_Configuration[MODE_HEADER_AOE] = false -- Disable auto use of aoe (Disables OP, HS, BT, Exe, Enablse Cleave, Whirlwind)
	end
	--[[
	if WarriorButtonStandard_Configuration["InstantBuildTime"] == nil then
		WarriorButtonStandard_Configuration["InstantBuildTime"] = 2 --Set the time to spend building rage for upcoming 31 point instant attacks
	end
	if WarriorButtonStandard_Configuration["RageBuffer"] == nil then
		WarriorButtonStandard_Configuration["RageBuffer"] = 10 --Set the minimum amount of rage to protect for emergency abilities
	end
	if WarriorButtonStandard_Configuration["InterruptTimer"] == nil then
		WarriorButtonStandard_Configuration["InterruptTimer"] = 2 --Set the time to attempt to interrupt spells after they begin casting
	end
	if WarriorButtonStandard_Configuration["InstantBuildTime"] == nil then
		WarriorButtonStandard_Configuration["InstantBuildTime"] = 2 --Set the time to spend building rage for upcoming 31 point instant attacks
	end
	if WarriorButtonStandard_Configuration["AoETime"] == nil then
		WarriorButtonStandard_Configuration["AoETime"] = 1 --Set the frequency of multiple target checks in seconds
	end
	if WarriorButtonStandard_Configuration["StanceTime"] == nil then
		WarriorButtonStandard_Configuration["StanceTime"] = 2 --Set the minimum delay between stance changes
	end
	if WarriorButtonStandard_Configuration["MaxCycles"] == nil then
		WarriorButtonStandard_Configuration["MaxCycles"] = 10 --Set the maximum number of function calls per second
	end
	]]--
	if Fury_Configuration[ABILITY_BATTLE_SHOUT_FURY] == nil then
		Fury_Configuration[ABILITY_BATTLE_SHOUT_FURY] = true --Set to false to disable use of ability
	end
	if Fury_Configuration[RACIAL_BERSERKING_FURY] == nil then
		Fury_Configuration[RACIAL_BERSERKING_FURY] = true -- Racial
	end
	if Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY] == nil then
		Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY] = true -- Used to counter fears
	end
	if Fury_Configuration[ABILITY_BLOOD_FURY] == nil then
		Fury_Configuration[ABILITY_BLOOD_FURY] = true
	end
	if Fury_Configuration[ABILITY_BLOODRAGE_FURY] == nil then
		Fury_Configuration[ABILITY_BLOODRAGE_FURY] = true -- Gives extra rage
	end
	if Fury_Configuration[ABILITY_BLOODTHIRST_FURY] == nil then
		Fury_Configuration[ABILITY_BLOODTHIRST_FURY] = true -- Fury main attack
	end
	if Fury_Configuration[ABILITY_CHARGE_FURY] == nil then
		Fury_Configuration[ABILITY_CHARGE_FURY] = true -- Charge when out of combat
	end
	if Fury_Configuration[ABILITY_CLEAVE_FURY] == nil then
		Fury_Configuration[ABILITY_CLEAVE_FURY] = false -- Cleave to lower threat and on used in aoe situations
	end
	if Fury_Configuration[ABILITY_DEMORALIZING_SHOUT_FURY] == nil then
		Fury_Configuration[ABILITY_DEMORALIZING_SHOUT_FURY] = true -- Decreases enemy attack power
	end
	if Fury_Configuration[ABILITY_DISARM_FURY] == nil then
		Fury_Configuration[ABILITY_DISARM_FURY] = true -- Used in pvp agains hard hitters
	end
	if Fury_Configuration[ABILITY_EXECUTE_FURY] == nil then
		Fury_Configuration[ABILITY_EXECUTE_FURY] = true -- Execute
	end
	if Fury_Configuration[ABILITY_HAMSTRING_FURY] == nil then
		Fury_Configuration[ABILITY_HAMSTRING_FURY] = true -- Hamstring
	end
	if Fury_Configuration[ABILITY_PIERCING_HOWL_FURY] == nil then
		Fury_Configuration[ABILITY_PIERCING_HOWL_FURY] = true -- Piercing Howl
	end
	if Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] == nil then
		Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = true -- HS, to dump rage and at low levels
	end
	if Fury_Configuration[ABILITY_INTERCEPT_FURY] == nil then
		Fury_Configuration[ABILITY_INTERCEPT_FURY] = true -- in combat charge
	end
	if Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY] == nil then
		Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY] = true -- Arms main attack
	end
	if Fury_Configuration[ABILITY_SWEEPING_STRIKES_FURY] == nil then
		Fury_Configuration[ABILITY_SWEEPING_STRIKES_FURY] = true -- Sweeping Strikes
	end
	if Fury_Configuration[ABILITY_OVERPOWER_FURY] == nil then
		Fury_Configuration[ABILITY_OVERPOWER_FURY] = true -- Counterattack dodge
	end
	if Fury_Configuration[ABILITY_PUMMEL_FURY] == nil then
		Fury_Configuration[ABILITY_PUMMEL_FURY] = true -- Counter spellcast
	end
	if Fury_Configuration[ABILITY_REND_FURY] == nil then
		Fury_Configuration[ABILITY_REND_FURY] = true -- Counter rogues vanish
	end
	if Fury_Configuration[ABILITY_SHIELD_BASH_FURY] == nil then
		Fury_Configuration[ABILITY_SHIELD_BASH_FURY] = true -- Prot
	end
	if Fury_Configuration[ABILITY_SHIELD_SLAM_FURY] == nil then
		Fury_Configuration[ABILITY_SHIELD_SLAM_FURY] = true -- Prot
	end
	if Fury_Configuration[ABILITY_DEATH_WISH_FURY] == nil then
		Fury_Configuration[ABILITY_DEATH_WISH_FURY] = true -- Deth wish on cooldown
	end
	if Fury_Configuration[ABILITY_SWEEPING_STRIKES_FURY] == nil then
		Fury_Configuration[ABILITY_SWEEPING_STRIKES_FURY] = true -- Aoe for arms
	end
	if Fury_Configuration[ABILITY_THUNDER_CLAP_FURY] == nil then
		Fury_Configuration[ABILITY_THUNDER_CLAP_FURY] = true -- slow enemies
	end
	if Fury_Configuration[ABILITY_WHIRLWIND_FURY] == nil then
		Fury_Configuration[ABILITY_WHIRLWIND_FURY] = true -- Fury rotation and aoe
	end
	if Fury_Configuration[ITEM_CONS_JUJU_FLURRY] == nil then
		Fury_Configuration[ITEM_CONS_JUJU_FLURRY] = false -- use on cooldown
	end
	if Fury_Configuration[ITEM_CONS_JUJU_POWER] == nil then
		Fury_Configuration[ITEM_CONS_JUJU_POWER] = false -- use on cooldown
	end
	if Fury_Configuration[ITEM_CONS_JUJU_MIGHT] == nil then
		Fury_Configuration[ITEM_CONS_JUJU_MIGHT] = false -- use on cooldown
	end
	if Fury_Configuration[ITEM_CONS_JUJU_CHILL] == nil then
		Fury_Configuration[ITEM_CONS_JUJU_CHILL] = true -- use on cooldown for bosses with frost dmg
	end
	if Fury_Configuration[ITEM_CONS_JUJU_EMBER] == nil then
		Fury_Configuration[ITEM_CONS_JUJU_EMBER] = false -- use on cooldown for bosses with fire dmg
	end
	if Fury_Configuration[ITEM_CONS_OIL_OF_IMMOLATION] == nil then
		Fury_Configuration[ITEM_CONS_OIL_OF_IMMOLATION] = false -- use on cooldown
	end
end

local function Fury_Configuration_Default()
	Fury_Configuration["Enabled"] = true
	Fury_Configuration["Debug"] = false
	Fury_Configuration["StanceChangeRage"] = 10
	Fury_Configuration["MaximumRage"] = 60
	Fury_Configuration["BloodrageHealth"] = 50
	Fury_Configuration["DeathwishHealth"] = 60
	Fury_Configuration["NextAttackRage"] = 40
	Fury_Configuration["BerserkHealth"] = 60
	Fury_Configuration["HamstringHealth"] = 40
	Fury_Configuration["DemoDiff"] = 7
	Fury_Configuration["AutoAttack"] = true
	Fury_Configuration["PrimaryStance"] = false
	Fury_Configuration[MODE_HEADER_AOE] = false
	Fury_Configuration[ABILITY_BATTLE_SHOUT_FURY] = true
	Fury_Configuration[RACIAL_BERSERKING_FURY] = true
	Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY] = true
	Fury_Configuration[ABILITY_BLOODRAGE_FURY] = true
	Fury_Configuration[ABILITY_BLOODTHIRST_FURY] = true
	Fury_Configuration[ABILITY_CHARGE_FURY] = true
	Fury_Configuration[ABILITY_CLEAVE_FURY] = false
	Fury_Configuration[ABILITY_DEATH_WISH_FURY] = true
	Fury_Configuration[ABILITY_DEMORALIZING_SHOUT_FURY] = true
	Fury_Configuration[ABILITY_DISARM_FURY] = true
	Fury_Configuration[ABILITY_EXECUTE_FURY] = true
	Fury_Configuration[ABILITY_HAMSTRING_FURY] = true
	Fury_Configuration[ABILITY_PIERCING_HOWL_FURY] = true
	Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = true
	Fury_Configuration[ABILITY_INTERCEPT_FURY] = true
	Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY] = true
	Fury_Configuration[ABILITY_SWEEPING_STRIKES_FURY] = true
	Fury_Configuration[ABILITY_OVERPOWER_FURY] = true
	Fury_Configuration[ABILITY_PUMMEL_FURY] = true
	Fury_Configuration[ABILITY_REND_FURY] = true
	Fury_Configuration[ABILITY_SHIELD_BASH_FURY] = true
	Fury_Configuration[ABILITY_SHIELD_SLAM_FURY] = true
	Fury_Configuration[ABILITY_WHIRLWIND_FURY] = true
	Fury_Configuration[ITEM_CONS_JUJU_FLURRY] = false
	Fury_Configuration[ITEM_CONS_JUJU_MIGHT] = false
	Fury_Configuration[ITEM_CONS_JUJU_POWER] = false
	Fury_Configuration[ITEM_CONS_JUJU_CHILL] = true
	Fury_Configuration[ITEM_CONS_JUJU_EMBER] = false
	Fury_Configuration[ITEM_CONS_OIL_OF_IMMOLATION] = false
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
	if Fury_Configuration and Fury_Configuration["Debug"] then
		Print(msg)
	end
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
		--Naxxramas
		BOSS_NAXXRAMAS_GRAND_WIDOW_FAERLINA_FURY,
		BOSS_NAXXRAMAS_THANE_KORTH_AZZ_FURY,
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
				if string.find(t, "Ability_GolemThunderClap") then -- Thunder Clap
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
				  or string.find(t, "Ability_Warrior_Cleave") -- Cleave
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

local function SpellReady(spellname)
	local id = SpellId(spellname)
	if id then
		local start, duration = GetSpellCooldown(id, 0)
		if start == 0 and duration == 0 and FuryLastSpellCast + 1 <= GetTime() then
			return true
		end
		return false
	end
	Debug("SR: "..spellname.." unknown")
	return false
end

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

local function HasBuffId(target, spellId)
	for i=1,40 do
		if select(11,UnitBuff(target,i)) == spellid then
			return true
		end
	end
	return nil
end

local function UseContainerItemByNameOnPlayer(search)
	for bag = 0,4 do
		for slot = 1,GetContainerNumSlots(bag) do
			local item = GetContainerItemLink(bag,slot)
			if item and string.find(item, search) then
				UseContainerItem(bag,slot)
				if SpellIsTargeting() then
					SpellTargetUnit("player")
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
	  or HasDebuff("target", "Spell_Fire_FlmaeBolt")
	  or HasDebuff("target", "Spell_Fire_Incinerate")
	  or HasDebuff("target", "Spell_Fire_Fireball02")
	  or HasDebuff("target", "Spell_Shadow_AbominationExplosion")
	  or HasDebuff("target", "Spell_Shadow_Requiem")
	  or HasDebuff("target", "Spell_Nature_FaerieFire")
	  or HasDebuff("target", "Spell_Nature_StarFall")
	  or HasDebuff("target", "Ability_Druid_Disembowel")
	  or HasDebuff("target", "Ability_GhoulFrenzy")
	  or HasDebuff("target", "Ability_Druid_SurpriseAttack")
	  or HasDebuff("target", "Spell_Nature_InsectSwarm")
	  or HasDebuff("target", "Spell_Holy_SearingLight")
	  or HasDebuff("target", "INV_Spear_02")
	  or HasDebuff("target", "Spell_Shadow_BlackPlague") then
		return true
	end
	return nil
end

local function ImmobilizingDebuff()
	-- Detect immobilizing buffs
	if HasDebuff("player", "Spell_Frost_FrostNova")
	  or HasDebuff("player", "spell_Nature_StrangleVines") then
		return true
	end
	return nil
end

local function SnareDebuff(unit)
	--Detect snaring debuffs
	--Hamstring, Wing Clip, Curse of Exhaustion, Crippling Poison, Frostbolt, Cone of Cold, Frost Shock
	if HasDebuff(unit, "Ability_ShockWave")
	  or HasDebuff(unit, "Ability_Rogue_Trip")
	  or HasDebuff(unit, "Spell_Shadow_GrimWard")
	  or HasDebuff(unit, "Ability_PoisonSting")
	  or HasDebuff(unit, "Spell_Frost_FrostBolt02")
	  or HasDebuff(unit, "Spell_Frost_Glacier")
	  or HasDebuff(unit, "Spell_Frost_FrostShock") then
		return true
	end
	return nil
end

local function Fury_RunnerDetect(arg1, arg2)
	--Thanks to HateMe
	if arg1 == CHAT_RUNNER_FURY then
		Fury_Runners[arg2] = true
	end
end

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

local function Fury_SetEnemies(count)
	for i=5,1,-1 do
		WWEnemies.Hist[i] = WWEnemies.Hist[i - 1]
	end
	WWEnemies.Hist[0] = Enemies
end

local function addEnemyCount(Enemies)
	Fury_SetEnemies(Enemies)
	Debug("Enemies "..Enemies)
	if Enemies < 2 and Fury_Configuration[MODE_HEADER_AOE] then
		Print(SLASH_DISABLING_AOE_FURY)
		Fury_Configuration[MODE_HEADER_AOE] = false
	end
end

local function Fury_GetEnemies()
	return WWEnemies.Hist[0] or 0;
end

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
	if SpellReady(spell) then
		Debug(spell)
		CastSpellByName(spell)
		FuryLastSpellCast = GetTime()
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
			Debug("Dismount")
			Dismount()
			FuryMount = nil

		-- 6, Use Berserker rage to interrupt fears and ....
		elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
		  and (FuryIncapacitate
		  or FuryFear)
		  and ActiveStance() == 3
		  and SpellReady(ABILITY_BERSERKER_RAGE_FURY) then
			Debug("Berserker Rage")
			CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)

		-- 7, Spider Belt, remove existing immobilizing effects
		elseif debuffImmobilizing
		  and EquippedAndReady(6, ITEM_BELT_SPIDER_BELT_FURY) then
			Debug("Spider Belt")
			UseInventoryItem(6)

		-- 8, Ornate Mithril Boots, remove existing immobilizing effects
		elseif debuffImmobilizing
		  and EquippedAndReady(8, ITEM_BOOTS_ORNATE_MITHRIL_BOOTS_FURY) then
			Debug("Ornate Mithril Boots")
			UseInventoryItem(8)

		-- 9, PVP Trinket, Horde
		elseif (FuryFear or FuryIncapacitate or debuffImmobilizing)
		  and IsTrinketEquipped(ITEM_TRINKET_INSIGNIA_OF_THE_HORDE_FURY) then
			slot = IsTrinketEquipped(ITEM_TRINKET_INSIGNIA_OF_THE_HORDE_FURY)
			Debug("Insignia of the Horde")
			UseInventoryItem(slot)

		-- 10, PVP Trinket, Alliance
		elseif (FuryFear or FuryIncapacitate or debuffImmobilizing)
		  and IsTrinketEquipped(ITEM_TRINKET_INSIGNIA_OF_THE_ALLIANCE_FURY) then
			slot = IsTrinketEquipped(ITEM_TRINKET_INSIGNIA_OF_THE_ALLIANCE_FURY)
			Debug("Insignia of the Alliance")
			UseInventoryItem(slot)

		-- 11, Execute, this will stance dance in prot mode?
		elseif Fury_Configuration[ABILITY_EXECUTE_FURY]
		  and Weapon()
		  and not Fury_Configuration[MODE_HEADER_AOE]
		  and UnitMana("player") >= FuryExecuteCost
		  and (ActiveStance() ~= 2
		  or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
		  and Fury_Configuration["PrimaryStance"] ~= 0))
		  and (UnitHealth("target") / UnitHealthMax("target") * 100) < 20
		  and SpellReady(ABILITY_EXECUTE_FURY) then
			if ActiveStance() ~= 2 then
				Debug("Execute")
				if FuryOldStance == 2 then
					FuryDanceDone = true
				end
				CastSpellByName(ABILITY_EXECUTE_FURY)
				FuryLastSpellCast = GetTime()
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Berserker Stance (Execute)")
					CastShapeshiftForm(3)
					FuryLastStanceCast = GetTime()
				end
			end

		-- 12, Overpower when available
		elseif Fury_Configuration[ABILITY_OVERPOWER_FURY]
		  and FuryOverpower
		  and Weapon()
		  and not Fury_Configuration[MODE_HEADER_AOE]
		  and UnitMana("player") >= 5
		  and (ActiveStance() == 1
		  or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
		  and Fury_Configuration["PrimaryStance"] ~= 0))
		  and SpellReady(ABILITY_OVERPOWER_FURY) then
			if ActiveStance() == 1 then
				Debug("Overpower")
				if ActiveStance() ~= 1 then
					FuryDanceDone = true
				end
				CastSpellByName(ABILITY_OVERPOWER_FURY)
				FuryLastSpellCast = GetTime()
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Battle Stance (Overpower)")
					CastShapeshiftForm(1)
					FuryLastStanceCast = GetTime()
				end
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
		  and SpellReady(ABILITY_PUMMEL_FURY) then
			if ActiveStance() == 3 then
				Debug("Pummel")
				if ActiveStance() ~= 3 then
					FuryDanceDone = true
				end
				CastSpellByName(ABILITY_PUMMEL_FURY)
				FuryLastSpellCast = GetTime()
				if UnitName("target") == BOSS_NAX_KEL_THUZAD_FURY then
					SendChatMessage(CHAT_KICKED_FURY ,"SAY" ,"common")
				end
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Berserker Stance (Pummel)")
					CastShapeshiftForm(3)
					FuryLastStanceCast = GetTime()
				end
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
		  or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
		  and Fury_Configuration["PrimaryStance"] ~= 0))
		  and SpellReady(ABILITY_SHIELD_BASH_FURY) then
			if ActiveStance() ~= 3 then
				Debug("Shield Bash (interrupt)")
				FuryDanceDone = true
				CastSpellByName(ABILITY_SHIELD_BASH_FURY)
				FuryLastSpellCast = GetTime()
				if UnitName("target") == BOSS_NAX_KEL_THUZAD_FURY then
					SendChatMessage(CHAT_KICKED_FURY ,"SAY" ,"common")
				end
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Battle Stance (Shield Bash)")
					CastShapeshiftForm(1)
					FuryLastStanceCast = GetTime()
				end
			end

		-- 15, Cast hamstring to stop runners
		elseif Fury_Configuration[ABILITY_HAMSTRING_FURY]
		  and (UnitIsPlayer("target")
		  or (Fury_Runners[UnitName("target")]
		  and (UnitHealth("target") / UnitHealthMax("target") * 100) <= tonumber(Fury_Configuration["HamstringHealth"])))
		  and Weapon()
		  and (not SnareDebuff("target") or (FuryImpHamstring and UnitMana("player") < 30))
		  and FuryAttack == true
		  and Fury_Distance() == 5
		  and UnitMana("player") >= HamstringCost()
		  and (ActiveStance() ~= 2
		  or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
		  and Fury_Configuration["PrimaryStance"] ~= 0))
		  and SpellReady(ABILITY_HAMSTRING_FURY) then
			if ActiveStance() ~= 2 then
				Debug("Hamstring")
				if FuryOldStance == 2 then
					FuryDanceDone = true
				end
				CastSpellByName(ABILITY_HAMSTRING_FURY)
				FuryLastSpellCast = GetTime()
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Berserker Stance (Hamstring)")
					CastShapeshiftForm(3)
					FuryLastStanceCast = GetTime()
				end
			end

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
		  and SpellReady(ABILITY_REND_FURY) then
			if ActiveStance() ~= 3 then
				Debug("Rend")
				if FuryOldStance == 3 then
					FuryDanceDone = true
				end
				CastSpellByName(ABILITY_REND_FURY)
				FuryLastSpellCast = GetTime()
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Battle Stance (Rend)")
					CastShapeshiftForm(1)
					FuryLastStanceCast = GetTime()
				end
			end
			
		-- 17, slow target
		elseif Fury_Configuration[ABILITY_PIERCING_HOWL_FURY]
		  and FuryPiercingHowl
		  and (UnitIsPlayer("target")
		  or (Fury_Runners[UnitName("target")]
		  and (UnitHealth("target") / UnitHealthMax("target") * 100) <= tonumber(Fury_Configuration["HamstringHealth"])))
		  and Fury_Distance() <= 10
		  and FuryAttack == true
		  and not SnareDebuff("target")
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_PIERCING_HOWL_FURY) then
				Debug("Piercing Howl")
				CastSpellByName(ABILITY_PIERCING_HOWL_FURY)
				FuryLastSpellCast = GetTime()

		-- 18, Rooted
		elseif debuffImmobilizing
		  and Fury_Distance() >= 8 then
			if ActiveStance() == 2 then
				FuryDanceDone = true
				local slot = IsTrinketEquipped(ITEM_TRINKET_LINKENS_BOOMERANG_FURY)
				if slot ~= nil
				  and (FurySpellInterrupt
				  or UnitClass("target") == CLASS_HUNTER_FURY) then
					Debug("Linken's Boomerang")
					UseInventoryItem(slot)
				else
					slot = IsTrinketEquipped(ITEM_TRINKET_TIDAL_CHARM)
					if slot ~= nil
					  and FurySpellInterrupt then
						Debug("Tidal Charm")
						UseInventoryItem(slot)
					else
						Fury_Shoot()
					end
				end
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					FuryOldStance = 2
					Debug("Defensive Stance (Rooted)")
					CastShapeshiftForm(2)
					FuryLastStanceCast = GetTime()
				end
			end

		-- 19, Berserker rage
		elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
		  and FuryBerserkerRage
		  and not UnitIsPlayer("target")
		  and UnitName("target") ~= BOSS_MC_MAGMADAR_FURY
		  and UnitMana("player") <= Fury_Configuration["MaximumRage"]
		  and (ActiveStance() == 3
		  or (UnitMana("player") <= FuryTacticalMastery
		  and Fury_Configuration["PrimaryStance"] ~= 0))
		  and SpellReady(ABILITY_BERSERKER_RAGE_FURY) then
			if ActiveStance() == 3 then
				Debug("Berserker Rage")
				if FuryOldStance ~= 3 then
					FuryDanceDone = true
				end
				CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)

			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Berserker Stance (Berserker Rage)")
					CastShapeshiftForm(3)
					FuryLastStanceCast = GetTime()
				end
			end

		-- 20, Stance dance
		elseif Fury_Configuration["PrimaryStance"]
		  and not FuryOldStance
		  and not FuryDanceDone
		  and FuryLastStanceCast + 1.5 <= GetTime()
		  and Fury_Configuration["PrimaryStance"] ~= ActiveStance()
		  and UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
		  and Fury_Configuration["PrimaryStance"] ~= 0 then
			--Initiate stance dance
			Debug("Primary Stance (" .. Fury_Configuration["PrimaryStance"] .. ")")
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
		  and (ActiveStance() == 2
		  or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
		  and Fury_Configuration["PrimaryStance"] ~= 0))
		  and SpellReady(ABILITY_DISARM_FURY) then
			if ActiveStance() == 2 then
				Debug("Disarm")
				if FuryOldStance ~= 2 then
					FuryDanceDone = true
				end
				CastSpellByName(ABILITY_DISARM_FURY)
				FuryLastSpellCast = GetTime()
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Defensive Stance (Disarm)")
					CastShapeshiftForm(2)
					FuryLastStanceCast = GetTime()
				end
			end

		-- 22, Sweeping Strikes
		elseif Fury_Configuration[ABILITY_SWEEPING_STRIKES_FURY]
		  and FurySweepingStrikes
		  and Fury_GetEnemies() > 1
		  and UnitMana("player") >= 30
		  and SpellReady(ABILITY_SWEEPING_STRIKES_FURY) then
			Debug("Sweeping Strikes")
			CastSpellByName(ABILITY_SWEEPING_STRIKES_FURY)
			
		-- 23, Bloodthirst
		elseif FuryBloodthirst
		  and Fury_Configuration[ABILITY_BLOODTHIRST_FURY]
		  and not Fury_Configuration[MODE_HEADER_AOE]
		  and UnitMana("player") >= 30
		  and SpellReady(ABILITY_BLOODTHIRST_FURY) then
			Debug("Bloodthirst")
			CastSpellByName(ABILITY_BLOODTHIRST_FURY)
			FuryLastSpellCast = GetTime()

		-- 24, Mortal Strike
		elseif FuryMortalStrike
		  and Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY]
		  and Weapon()
		  and not Fury_Configuration[MODE_HEADER_AOE]
		  and UnitMana("player") >= 30
		  and SpellReady(ABILITY_MORTAL_STRIKE_FURY) then
			Debug("Mortal Strike")
			CastSpellByName(ABILITY_MORTAL_STRIKE_FURY)
			FuryLastSpellCast = GetTime()
			
		-- 25, Whirlwind
		elseif (Fury_Configuration[ABILITY_WHIRLWIND_FURY]
		  or Fury_Configuration[MODE_HEADER_AOE])
		  and Fury_Distance() <= 10
		  and Weapon()
		  and UnitMana("player") >= 25
		  and (ActiveStance() == 3
		  or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
		  and Fury_Configuration["PrimaryStance"] ~= 0))
		  and SpellReady(ABILITY_WHIRLWIND_FURY) then
			if ActiveStance() == 3 then
				Debug("Whirlwind")
				if FuryOldStance ~= 3 then
					FuryDanceDone = true
				end
				CastSpellByName(ABILITY_WHIRLWIND_FURY)
				WWEnemies.WWCount = 0
				FuryLastSpellCast = GetTime()
				WWEnemies.WWTime = GetTime()
			else
				if FuryLastStanceCast + 1.5 <= GetTime() then
					if not FuryOldStance then
						FuryOldStance = ActiveStance()
					end
					Debug("Berserker Stance (Whirlwind)")
					CastShapeshiftForm(3)
					FuryLastStanceCast = GetTime()
				end
			end

		-- 26, Shield Slam
		elseif Fury_Configuration[ABILITY_SHIELD_SLAM_FURY]
		  and FuryShieldSlam
		  and Shield()
		  and UnitMana("player") >= 20
		  and SpellReady(ABILITY_SHIELD_SLAM_FURY) then
			Debug("Shield Slam")
			CastSpellByName(ABILITY_SHIELD_SLAM_FURY)
			FuryLastSpellCast = GetTime()

		-- 27, Battle Shout
		elseif Fury_Configuration[ABILITY_BATTLE_SHOUT_FURY]
		  and not HasBuff("player", "Ability_Warrior_BattleShout")
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_BATTLE_SHOUT_FURY) then
			Debug("Battle Shout")
			CastSpellByName(ABILITY_BATTLE_SHOUT_FURY)
			FuryLastSpellCast = GetTime()

		-- 28, Demoralizing Shout (PVE only)
		elseif Fury_Configuration[ABILITY_DEMORALIZING_SHOUT_FURY]
		  and not HasDebuff("target", "Ability_Warrior_WarCry")
		  and not HasDebuff("target", "Ability_Druid_DemoralizingRoar")
		  and UnitMana("player") >= 10
		  and not UnitIsPlayer("target")
		  and UnitLevel("Player") - UnitLevel("Target") < Fury_Configuration["DemoDiff"]
		  and FuryAttack == true
		  and SpellReady(ABILITY_DEMORALIZING_SHOUT_FURY) then
			Debug("Demoralizing Shout")
			CastSpellByName(ABILITY_DEMORALIZING_SHOUT_FURY)
			FuryLastSpellCast = GetTime()

		-- 29, Shield Block
		elseif Fury_Configuration[ABILITY_SHIELD_BLOCK_FURY]
		  and Shield()
		  and FuryCombat
		  and UnitMana("player") >= 15
		  and SpellReady(ABILITY_SHIELD_BLOCK_FURY) then
			Debug("Shield Block")
			CastSpellByName(ABILITY_SHIELD_BLOCK_FURY)

		-- 30, Stance dance (part 2)
		elseif FuryDanceDone
		  and FuryOldStance
		  and FuryLastStanceCast + 1.5 <= GetTime()
		  and UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"]) then
			--Initiate stance dance
			if not Fury_Configuration["PrimaryStance"] then
				Debug("Old Stance (" .. FuryOldStance .. ")")
				CastShapeshiftForm(FuryOldStance)
			else
				Debug("Primary Stance (" .. Fury_Configuration["PrimaryStance"] .. ")")
				CastShapeshiftForm(Fury_Configuration["PrimaryStance"])
			end
			FuryLastStanceCast = GetTime()
			if FuryOldStance == ActiveStance()
			  or Fury_Configuration["PrimaryStance"] == ActiveStance() then
				Debug("Variables cleared (Dance done)")
				FuryOldStance = nil
				FuryDanceDone = nil
			end

		-- 31, Juju Flurry
		elseif FuryCombat
		  and not HasBuff("player", "INV_Misc_MonsterScales_17")
		  and FuryAttack == true
		  and Fury_Configuration[ITEM_CONS_JUJU_FLURRY]
		  and ItemReady(ITEM_CONS_JUJU_FLURRY) then
			Debug(ITEM_CONS_JUJU_FLURRY)
			UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_FLURRY)

		-- 32, Juju Chill
		elseif FuryCombat
		  and FuryAttack == true
		  and Fury_Configuration[ITEM_CONS_JUJU_CHILL]
		  and not HasBuff("player", "INV_Misc_MonsterScales_09")
		  and UseRes("frost")
		  and ItemReady(ITEM_CONS_JUJU_CHILL) then
			Debug(ITEM_CONS_JUJU_CHILL)
			UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_CHILL)

		-- 33, Juju Ember
		elseif FuryCombat
		  and Fury_Configuration[ITEM_CONS_JUJU_EMBER]
		  and not HasBuff("player", "INV_Misc_MonsterScales_15")
		  and UseRes("fire")
		  and ItemReady(ITEM_CONS_JUJU_EMBER) then
			Debug(ITEM_CONS_JUJU_EMBER)
			UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_EMBER)

		-- 34, Juju Might
		elseif FuryCombat
		  and FuryAttack == true
		  and Fury_Configuration[ITEM_CONS_JUJU_MIGHT]
		  and not HasBuff("player", "INV_Misc_MonsterScales_07")
		  and not HasBuff("player", "INV_Potion_92") -- Winterfall Firewater
		  and ItemReady(ITEM_CONS_JUJU_MIGHT) then
			Debug(ITEM_CONS_JUJU_MIGHT)
			UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_MIGHT)

		-- 35, Juju Power
		elseif FuryCombat
		  and FuryAttack == true
		  and Fury_Configuration[ITEM_CONS_JUJU_POWER]
		  and not HasBuff("player", "INV_Misc_MonsterScales_11")
		  and not HasBuff("player", "INV_Potion_61") -- Elixir of Giants
		  and ItemReady(ITEM_CONS_JUJU_POWER) then
			Debug(ITEM_CONS_JUJU_POWER)
			UseContainerItemByNameOnPlayer(ITEM_CONS_JUJU_POWER)

		-- 36, Immolation potion
		elseif FuryCombat
		  and Fury_Configuration[ITEM_CONS_OIL_OF_IMMOLATION]
		  and not HasBuff("player", "Spell_Fire_Immolation")
		  and ItemReady(ITEM_CONS_OIL_OF_IMMOLATION) then
			Debug(ITEM_CONS_OIL_OF_IMMOLATION)
			UseContainerItemByNameOnPlayer(ITEM_CONS_OIL_OF_IMMOLATION)

		-- 37, Racial berserking
		elseif Fury_Configuration[RACIAL_BERSERKING_FURY]
		  and UnitMana("player") >= 5
		  and (UnitHealth("player") / UnitHealthMax("player") * 100) <= tonumber(Fury_Configuration["BerserkHealth"])
		  and not HasBuff("player", "Racial_Berserk")
		  and SpellReady(RACIAL_BERSERKING_FURY) then
			Debug("Berserking")
			CastSpellByName(RACIAL_BERSERKING_FURY)
			FuryLastSpellCast = GetTime()
			
		-- 38, Blood Fury (Orc racial ability)
		elseif FuryRacialBloodFury
		  and Fury_Configuration[ABILITY_BLOOD_FURY]
		  and FuryAttack == true
		  and ActiveStance() ~= 2
		  and FuryCombat
		  and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["DeathWishHealth"])
		  and SpellReady(ABILITY_BLOOD_FURY) then
			Debug("Blood Fury")
			CastSpellByName(ABILITY_BLOOD_FURY)

		-- 39, Death Wish
		elseif FuryDeathWish
		  and Fury_Configuration[ABILITY_DEATH_WISH_FURY]
		  and UnitMana("player") >= 10
		  and FuryAttack == true
		  and ActiveStance() ~= 2
		  and FuryCombat
		  and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["DeathWishHealth"])
		  and SpellReady(ABILITY_DEATH_WISH_FURY) then
			Debug("Death Wish")
			CastSpellByName(ABILITY_DEATH_WISH_FURY)

		-- 40, Bloodrage
		elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
		  and UnitMana("player") <= tonumber(Fury_Configuration["MaximumRage"])
		  and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["BloodrageHealth"])
		  and SpellReady(ABILITY_BLOODRAGE_FURY) then
			Debug("Bloodrage")
			CastSpellByName(ABILITY_BLOODRAGE_FURY)

		-- 41, Dump rage with Heroic Strike or Cleave
		elseif (Fury_Configuration[MODE_HEADER_AOE]
		  or ((Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY]
		  and FuryMortalStrike
		  and not SpellReady(ABILITY_MORTAL_STRIKE_FURY))
		  or not Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY]
		  or not FuryMortalStrike)
		  and ((Fury_Configuration[ABILITY_BLOODTHIRST_FURY]
		  and FuryBloodthirst
		  and not SpellReady(ABILITY_BLOODTHIRST_FURY))
		  or not Fury_Configuration[ABILITY_BLOODTHIRST_FURY]
		  or not FuryBloodthirst))
		  and ((Fury_Configuration[ABILITY_WHIRLWIND_FURY]
		  and not SpellReady(ABILITY_WHIRLWIND_FURY))
		  or not Fury_Configuration[ABILITY_WHIRLWIND_FURY]) then

			-- 42, Will try to lessen the amounts of Heroic Strike, when instanct attacks (MS, BT, WW) are enabled
			-- Hamstring
			if Fury_Configuration[ABILITY_HAMSTRING_FURY]
			  and Weapon()
			  and UnitMana("player") >= HamstringCost()
			  and ((FuryFlurry
			  and not HasBuff("player", "Ability_GhoulFrenzy"))
			  or FuryImpHamstring
			  or FurySwordSpec
			  or FuryMaceSpec)
			  and SpellReady(ABILITY_HAMSTRING_FURY) then
				-- Try trigger...
				-- stun,imp attack speed, extra swing
				Debug("Hamstring (Trigger ...)")
				CastSpellByName(ABILITY_HAMSTRING_FURY)
				FuryLastSpellCast = GetTime()

			-- 43, Heroic Strike
			elseif Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY]
			  and Weapon()
			  and not Fury_Configuration[MODE_HEADER_AOE]
			  and UnitMana("player") >= FuryHeroicStrikeCost
			  and UnitMana("player") >= tonumber(Fury_Configuration["NextAttackRage"])
			  and SpellReady(ABILITY_HEROIC_STRIKE_FURY) then
				Debug("Heroic Strike")
				CastSpellByName(ABILITY_HEROIC_STRIKE_FURY)
				FuryLastSpellCast = GetTime()
				--No global cooldown, added anyway to prevent Heroic Strike from being spammed over other abilities

			-- 44, Cleave
			elseif (Fury_Configuration[ABILITY_CLEAVE_FURY]
			  or Fury_Configuration[MODE_HEADER_AOE])
			  and Weapon()
			  and UnitMana("player") >= 20
			  and ((UnitMana("player") >= tonumber(Fury_Configuration["NextAttackRage"]))
			  or (Fury_Configuration[MODE_HEADER_AOE] and UnitMana("player") >= 25))
			  and SpellReady(ABILITY_CLEAVE_FURY) then
				Debug("Cleave")
				CastSpellByName(ABILITY_CLEAVE_FURY)
				FuryLastSpellCast = GetTime()
				--No global cooldown, added anyway to prevent Cleave from being spammed over other abilities
			end
		end
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
		end
		Debug("No target")
		return
	end
	Debug("Distance: "..dist)
	if FuryMount
	  and dist <= 25 then
		-- Dismount as a first step
		Debug("Dismounting")
		Dismount()
		FuryMount = nil
	end
	if FuryCombat then
		Debug("In combat")
		if Fury_Configuration["AutoAttack"] and not FuryAttack then
			-- Auto attack closest target
			AttackTarget()
		end
		if Fury_Configuration[ABILITY_THUNDER_CLAP_FURY]
		  and ActiveStance() == 1
		  and dist <= 7
		  and not SnareDebuff("target")
		  and UnitMana("player") >= 20
		  and SpellReady(ABILITY_THUNDER_CLAP_FURY) then
			Debug("Thunder Clap")
			CastSpellByName(ABILITY_THUNDER_CLAP_FURY)
			FuryLastSpellCast = GetTime()

		elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
		  and ActiveStance() == 3
		  and dist <= 25
		  and dist > 7
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_INTERCEPT_FURY) then
			Debug("Intercept")
			CastSpellByName(ABILITY_INTERCEPT_FURY)

		elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
		  and ActiveStance() == 3
		  and UnitMana("player") < 10
		  and dist <= 25
		  and SpellReady(ABILITY_INTERCEPT_FURY)
		  and SpellReady(ABILITY_BLOODRAGE_FURY) then
			Debug("Bloodrage")
			CastSpellByName(ABILITY_BLOODRAGE_FURY)

		elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
		  and FuryBerserkerRage
		  and ActiveStance() == 3
		  and UnitMana("player") < 10
		  and SpellReady(ABILITY_INTERCEPT_FURY)
		  and SpellReady(ABILITY_BERSERKER_RAGE_FURY) then
			Debug("Berserker Rage")
			CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)

		elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
		  and ActiveStance() ~= 3
		  and UnitMana("player") > 20
		  --and UnitMana("player") >= 10
		  and SpellReady(ABILITY_INTERCEPT_FURY) then
			if FuryLastStanceCast + 1.5 <= GetTime() then
				Debug("Berserker Stance (Intercept)");
				if FuryOldStance == nil then
					FuryOldStance = ActiveStance();
					FuryLastStanceCast = GetTime();

				end
				CastShapeshiftForm(3);
				FuryLastStanceCast = GetTime()

			end
		end
	else
		Debug("Out of combat")
		if Fury_Configuration[ABILITY_CHARGE_FURY]
		  and ActiveStance() == 1
		  and dist <= 25
		  and dist > 7
		  and SpellReady(ABILITY_CHARGE_FURY) then
			Debug("Charge")
			CastSpellByName(ABILITY_CHARGE_FURY);
			--FuryLastSpellCast = GetTime()

		elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
		  and ActiveStance() == 3
		  and dist <= 25
		  and dist > 7
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_INTERCEPT_FURY) then
			Debug("Intercept")
			CastSpellByName(ABILITY_INTERCEPT_FURY);
			FuryLastSpellCast = GetTime()

		elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
		  and ActiveStance() ~= 3
		  and not SpellReady(ABILITY_CHARGE_FURY)
		  and SpellReady(ABILITY_INTERCEPT_FURY) then
			Debug("Berserker Stance (Intercept)")
			if (FuryLastStanceCast + 1.5 <= GetTime()) then
				Debug("Berserker Stance (Intercept)");
				if FuryOldStance == nil then
					FuryOldStance = ActiveStance();
					FuryLastStanceCast = GetTime();

				end
				CastShapeshiftForm(3);
				FuryLastStanceCast = GetTime()

			end

		elseif Fury_Configuration[ABILITY_CHARGE_FURY]
		  and ActiveStance() ~= 1
		  and dist <= 25
		  and dist > 7
		  and SpellReady(ABILITY_CHARGE_FURY)
		  and not SpellReady(ABILITY_INTERCEPT_FURY) then
			Debug("Arm Stance (Charge)")
			if Fury_Configuration["PrimaryStance"] ~= 1
			  and FuryOldStance == nil then
				FuryOldStance = ActiveStance()
				FuryLastStanceCast = GetTime()

			end
			CastShapeshiftForm(1)
			FuryLastStanceCast = GetTime()

		elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
		  and FuryBerserkerRage
		  and ActiveStance() == 3
		  and SpellReady(ABILITY_INTERCEPT_FURY)
		  and not SpellReady(ABILITY_CHARGE_FURY)
		  and dist <= 25
		  and UnitMana("player") < 10
		  and SpellReady(ABILITY_BERSERKER_RAGE_FURY) then
			Debug("Berserker Rage")
			CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)

		elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
		  and ActiveStance() == 3
		  and dist <= 25
		  and SpellReady(ABILITY_INTERCEPT_FURY)
		  and not SpellReady(ABILITY_CHARGE_FURY)
		  and UnitMana("player") < 10
		  and SpellReady(ABILITY_BLOODRAGE_FURY) then
			Debug("Bloodrage")
			CastSpellByName(ABILITY_BLOODRAGE_FURY);

		end
	end
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

	elseif command == "talents" then
		Print(SLASH_TALENTS_RESCAN_FURY)
		Fury_InitDistance()
		Fury_ScanTalents()

	elseif command == "aoe" then
		if Fury_Configuration[MODE_HEADER_AOE] then
			Fury_Configuration[MODE_HEADER_AOE] = false
			Print(MODE_HEADER_AOE .. " " .. SLASH_FURY_DISABLED .. ".")
		else
			Fury_Configuration[MODE_HEADER_AOE] = true
			Print(MODE_HEADER_AOE .. " " .. SLASH_FURY_ENABLED .. ".")
		end

	elseif command == "toggle" then
		if Fury_Configuration["Enabled"] then
			Fury_Configuration["Enabled"] = false
			Print(BINDING_HEADER_FURY .. " " .. SLASH_FURY_DISABLED .. ".")
		else
			Fury_Configuration["Enabled"] = true
			Print(BINDING_HEADER_FURY .. " " .. SLASH_FURY_ENABLED .. ".")
		end

	elseif command == "debug" then
		if Fury_Configuration["Debug"] then
			Fury_Configuration["Debug"] = false
			Print(SLASH_FURY_DEBUG .. " " .. SLASH_FURY_DISABLED .. ".")
		else
			Fury_Configuration["Debug"] = true
			Print(SLASH_FURY_DEBUG .. " " .. SLASH_FURY_ENABLED .. ".")
		end

	elseif command == "dance" then
		if options ~= "" then
			if tonumber(options) < 0 then
				options = 0
			elseif tonumber(options) > 100 then
				options = 100
			end
			Fury_Configuration["StanceChangeRage"] = options
		else
			options = Fury_Configuration["StanceChangeRage"]
		end
		Print(SLASH_FURY_DANCE .. options .. ".")

	elseif command == "attack" then
		if Fury_Configuration["AutoAttack"] then
			Fury_Configuration["AutoAttack"] = false
			Print(SLASH_FURY_AUTOATTACK .. " " .. SLASH_FURY_DISABLED .. ".")
		else
			Fury_Configuration["AutoAttack"] = true
			Print(SLASH_FURY_AUTOATTACK .. " " .. SLASH_FURY_ENABLED .. ".")
		end

	elseif command == "rage" then
		if options ~= "" then
			if tonumber(options) < 0 then
				options = 0
			elseif tonumber(options) > 100 then
				options = 100
			end
			Fury_Configuration["MaximumRage"] = options
		else
			options = Fury_Configuration["MaximumRage"]
		end
		Print(SLASH_FURY_RAGE .. options .. ".")

	elseif command == "attackrage" then
		if options ~= "" then
			if tonumber(options) < 0 then
				options = 0
			elseif tonumber(options) > 100 then
				options = 100
			end
			Fury_Configuration["NextAttackRage"] = options
		else
			options = Fury_Configuration["NextAttackRage"]
		end
		Print(SLASH_FURY_ATTACKRAGE .. options .. ".")

	elseif command == "bloodrage" then
		if options ~= "" then
			if tonumber(options) < 1 then
				options = 1
			elseif tonumber(options) > 100 then
				options = 100
			end
			Fury_Configuration["BloodrageHealth"] = options
		else
			options = Fury_Configuration["BloodrageHealth"]
		end
		Print(SLASH_FURY_BLOODRAGE .. options .. ".")

	elseif command == "demodiff" then
		if options ~="" then 
			if tonumber(options) < -3 then
				options = -3
			elseif tonumber(options) > 60 then
				options = 60
			end
			Fury_Configuration["DemoDiff"] = options
		else
			options = Fury_Configuration["DemoDiff"]
		end
		Print(SLASH_FURY_DEMODIFF .. options.. ".")

	elseif command == "deathwish" then
		if options ~= "" then
			if tonumber(options) < 1 then
				options = 1
			elseif tonumber(options) > 100 then
				options = 100
			end
			Fury_Configuration["DeathWishHealth"] = options
		else
			options = Fury_Configuration["DeathWishHealth"]
		end
		Print(SLASH_FURY_DEATHWISH .. options .. ".")

	elseif command == "hamstring" then
		if options ~= "" then
			if tonumber(options) < 1 then
				options = 1
			elseif tonumber(options) > 100 then
				options = 100
			end
			Fury_Configuration["HamstringHealth"] = options
		else
			options = Fury_Configuration["HamstringHealth"]
		end
		Print(SLASH_FURY_HAMSTRING .. options .. ".")

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

	elseif command == "shoot" then
		Fury_Shoot()

	elseif command == "berserk" then
		if options ~= "" then
			if tonumber(options) < 1 then
				options = 1
			elseif tonumber(options) > 100 then
				options = 100
			end
			Fury_Configuration["BerserkHealth"] = options
		else
			options = Fury_Configuration["BerserkHealth"]
		end
		Print(SLASH_FURY_TROLL .. options .. ".")

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
			Print(SLASH_FURY_STANCE .. SLASH_FURY_DEFAULT .. ".")
		else
			Fury_Configuration["PrimaryStance"] = 0
			Print(SLASH_FURY_NOSTANCE .. SLASH_FURY_DISABLED .. ".")
		end

	elseif command == "juju" then
		if options == "flurry" then
			if Fury_Configuration[ITEM_CONS_JUJU_FLURRY] then
				Print(ITEM_CONS_JUJU_FLURRY .. " "..SLASH_FURY_DISABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_FLURRY] = false
			else
				Print(ITEM_CONS_JUJU_FLURRY .. " "..SLASH_FURY_ENABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_FLURRY] = true
			end
		elseif options == "chill" then
			if Fury_Configuration[ITEM_CONS_JUJU_CHILL] then
				Print(ITEM_CONS_JUJU_CHILL .. " "..SLASH_FURY_DISABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_CHILL] = false
			else
				Print(ITEM_CONS_JUJU_CHILL .. " "..SLASH_FURY_ENABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_CHILL] = true
			end
		elseif options == "might" then
			if Fury_Configuration[ITEM_CONS_JUJU_MIGHT] then
				Print(ITEM_CONS_JUJU_MIGHT .. " "..SLASH_FURY_DISABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_MIGHT] = false
			else
				Print(ITEM_CONS_JUJU_MIGHT .. " "..SLASH_FURY_ENABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_MIGHT] = true
			end
		elseif options == "ember" then
			if Fury_Configuration[ITEM_CONS_JUJU_EMBER] then
				Print(ITEM_CONS_JUJU_EMBER .. " "..SLASH_FURY_DISABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_EMBER] = false
			else
				Print(ITEM_CONS_JUJU_EMBER .. " "..SLASH_FURY_ENABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_EMBER] = true
			end
		elseif options == "power" then
			if Fury_Configuration[ITEM_CONS_JUJU_POWER] then
				Print(ITEM_CONS_JUJU_POWER .. " "..SLASH_FURY_DISABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_POWER] = false
			else
				Print(ITEM_CONS_JUJU_POWER .. " "..SLASH_FURY_ENABLED..".")
				Fury_Configuration[ITEM_CONS_JUJU_POWER] = true
			end
		else
			Print(HELP_JUJU)
		end

	elseif command == "ooi" then
		if Fury_Configuration[ITEM_CONS_OIL_OF_IMMOLATION] then
			Print(ITEM_CONS_OIL_OF_IMMOLATION .. " "..SLASH_FURY_DISABLED..".")
			Fury_Configuration[ITEM_CONS_OIL_OF_IMMOLATION] = false
		else
			Print(ITEM_CONS_OIL_OF_IMMOLATION .. " "..SLASH_FURY_ENABLED..".")
			Fury_Configuration[ITEM_CONS_OIL_OF_IMMOLATION] = true
		end

	elseif command == "distance" then
		if UnitCanAttack("player", "target") then
			Print(SLASH_FURY_DISTANCE.." "..Fury_Distance().." "..SLASH_FURY_YARDS)
		else
			Print(SLASH_FURY_NO_ATTACKABLE_TARGET)
		end

	elseif command == "where" then
		Print("GetMinimapZoneText "..(GetMinimapZoneText() or ""))
		Print("GetRealZoneText "..(GetRealZoneText() or ""))
		Print("GetSubZoneText "..(GetSubZoneText() or ""))
		Print("GetZonePVPInfo "..(GetZonePVPInfo() or ""))
		Print("GetZoneText "..(GetZoneText() or ""))

	elseif command == "unit" then
		if options ~= nil
		  and options ~= "" then
			target = options
		elseif UnitName("target") ~= nil then
			target = "target"
		else
			target = "player"
		end
		Print("Name: "..(UnitName(target) or "").." Class: "..(UnitClass(target) or "").." Classification: "..(UnitClassification(target) or ""))
		if UnitRace(target) then
			Print("Race: "..(UnitRace(target) or ""))
		else
			Print("Type: "..(UnitCreatureType(target) or ""))
		end
		PrintEffects(target)

	elseif command == "ability" then
		if options == ABILITY_HEROIC_STRIKE_FURY
		  and not Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] then
			Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = true
			Print(ABILITY_HEROIC_STRIKE_FURY .. " "..SLASH_FURY_ENABLED..".")
			if Fury_Configuration[ABILITY_CLEAVE_FURY] then
				Fury_Configuration[ABILITY_CLEAVE_FURY] = false
				Print(ABILITY_CLEAVE_FURY .. " "..SLASH_FURY_DISABLED..".")
			end
		elseif options == ABILITY_CLEAVE_FURY
		  and not Fury_Configuration[ABILITY_CLEAVE_FURY] then
			Fury_Configuration[ABILITY_CLEAVE_FURY] = true
			Print(ABILITY_CLEAVE_FURY .. " "..SLASH_FURY_ENABLED..".")
			if Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] then
				Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = falses
				Print(ABILITY_HEROIC_STRIKE_FURY .. " "..SLASH_FURY_DISABLED..".")
			end
		elseif Fury_Configuration[options] then
			Fury_Configuration[options] = false
			Print(options .. " "..SLASH_FURY_DISABLED..".")
		elseif Fury_Configuration[options] == false then
			Fury_Configuration[options] = true
			Print(options .. " "..SLASH_FURY_ENABLED..".")
		else
			Print(options .. " "..SLASH_FURY_NOT_FOUND..".")
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
		  ["bloodrage"] = HELP_BLOODRAGE,
		  ["charge"] = HELP_CHARGE,
		  ["dance"] = HELP_DANCE,
		  ["debug"] = HELP_DEBUG,
		  ["demodiff"] = HELP_DEMODIFF,
		  ["distance"] = HELP_DISTANCE,
		  ["hamstring"] = HELP_HAMSTRING,
		  ["help"] = HELP_HELP,
		  ["juju"] = HELP_JUJU,
		  ["ooi"] = HELP_OOI,
		  ["rage"] = HELP_RAGE,
		  ["shoot"] = HELP_SHOOT,
		  ["stance"] = HELP_STANCE,
		  ["talents"] = HELP_TALENTS,
		  ["threat"] = HELP_THREAT,
		  ["toggle"] = HELP_TOGGLE,
		  ["unit"] = HELP_UNIT,
		  ["where"] = HELP_WHERE
		}
		if options == nil or options == "" then
			local cmds = ""
			for k,_ in pairs(helps) do
				if cmds ~= "" then
					cmds = cmds..", "
				end
				cmds = cmds..k
			end
			Print(SLASH_FURY_HELP ..cmds)

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
	this:RegisterEvent("PLAYER_REGEN_ENABLED")
	this:RegisterEvent("PLAYER_REGEN_DISABLED")
	this:RegisterEvent("PLAYER_ENTER_COMBAT")
	this:RegisterEvent("PLAYER_LEAVE_COMBAT")
	this:RegisterEvent("CHAT_MSG_COMBAT_SELF_MISSES")
	this:RegisterEvent("CHAT_MSG_SPELL_SELF_DAMAGE")
	this:RegisterEvent("CHAT_MSG_MONSTER_EMOTE")
	this:RegisterEvent("VARIABLES_LOADED")
	this:RegisterEvent("CHARACTER_POINTS_CHANGED")
	this:RegisterEvent("PLAYER_TARGET_CHANGED")

	this:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_CREATURE_VS_CREATURE_BUFF")
	this:RegisterEvent("CHAT_MSG_SPELL_HOSTILEPLAYER_BUFF")

	this:RegisterEvent("CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES")

	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")

	this:RegisterEvent("PLAYER_AURAS_CHANGED")

	WWEnemies = { Hist = {}, WWTime = 0, WWCount = nil, CleaveTime = 0, CleaveCount = nil }
	for i = 0,5 do
		WWEnemies.Hist[i] = 0
	end
	
	FuryLastSpellCast = GetTime()
	FuryLastStanceCast = GetTime()
	FuryRevengeTime = 0
	FuryRevengeReadyUntil = 0
	SlashCmdList["FURY"] = Fury_SlashCommand
	SLASH_FURY1 = "/fury"
end

local function Fury_ScanTalents()
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
	end	--Check for Piercing Howl
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
	local _, _, _, _, currRank = GetTalentInfo(2, 15)
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
	FuryTalents = true
end

function Fury_OnEvent(event)

	if event == "VARIABLES_LOADED" then
		--Check for settings
		Fury_Configuration_Init()

	elseif event == "CHAT_MSG_COMBAT_SELF_MISSES"
	  and string.find(arg1, CHAT_OVERPOWER1_FURY)
	  or event == "CHAT_MSG_SPELL_SELF_DAMAGE"
	  and string.find(arg1, CHAT_OVERPOWER2_FURY) then
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
		end

	elseif event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES" then
		-- set up time for revenge
		if string.find(arg1, CHAT_BLOCK_FURY)
		  or string.find(arg1, CHAT_PARRY_FURY)
		  or string.find(arg1, CHAT_DODGE_FURY) then
			Debug("Revenge soon ready")
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

	elseif event == "PLAYER_TARGET_CHANGED"
	  or (event == "CHARACTER_POINTS_CHANGED" and arg1 == -1) then
		--Reset Overpower and interrupts, check to see if talents are being calculated
		if event == "PLAYER_TARGET_CHANGED" then
			Fury_SetEnemies(1)
			FuryOverpower = nil
			FurySpellInterrupt = nil
		end
		if not FuryTalents
		  and UnitClass("player") == CLASS_WARRIOR_FURY then
			Fury_InitDistance()
			Fury_ScanTalents()
		end

	elseif event == "PLAYER_REGEN_DISABLED" then
		FuryCombat = true

	elseif event == "PLAYER_REGEN_ENABLED" then
		FuryCombat = nil
		FuryDanceDone = nil
		FuryOldStance = nil
		for slot = 1, 18 do
			local name = CheckCooldown(slot)
			if name then
				Print(name.." "..CHAT_IS_ON_CD_FURY)
			end
		end

	elseif event == "PLAYER_ENTER_COMBAT" then
		FuryAttack = true

	elseif event == "PLAYER_LEAVE_COMBAT" then
		FuryAttack = nil

	end
end

