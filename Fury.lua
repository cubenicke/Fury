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

function Fury_Configuration_Init()

	FURY_VERSION = "1.16.0"

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
	if Fury_Configuration[ITEM_JUJU_FLURRY] == nil then
		Fury_Configuration[ITEM_JUJU_FLURRY] = false -- use on cooldown
	end
	if Fury_Configuration[ITEM_JUJU_POWER] == nil then
		Fury_Configuration[ITEM_JUJU_POWER] = false -- use on cooldown
	end
	if Fury_Configuration[ITEM_JUJU_MIGHT] == nil then
		Fury_Configuration[ITEM_JUJU_MIGHT] = false -- use on cooldown
	end
	if Fury_Configuration[ITEM_JUJU_CHILL] == nil then
		Fury_Configuration[ITEM_JUJU_CHILL] = true -- use on cooldown for bosses with frost dmg
	end
	if Fury_Configuration[ITEM_JUJU_EMBER] == nil then
		Fury_Configuration[ITEM_JUJU_EMBER] = false -- use on cooldown for bosses with fire dmg
	end
	if Fury_Configuration[ITEM_OIL_OF_IMMOLATION] == nil then
		Fury_Configuration[ITEM_OIL_OF_IMMOLATION] = false -- use on cooldown
	end
	if not WWEnemies then
		WWEnemies = { Hist = {}, WWTime = 0, WWCount = nil, CleaveTime = 0, CleaveCount = nil}
		for i = 0,5 do
			WWEnemies.Hist[i] = 0
		end
	end
end

function Fury_Configuration_Default()
	Fury_Configuration["Enabled"] = true
	Fury_Configuration["Debug"] = false
	Fury_Configuration["StanceChangeRage"] = 10
	Fury_Configuration["MaximumRage"] = 60
	Fury_Configuration["BloodrageHealth"] = 50
	Fury_Configuration["DeathwishHealth"] = 60
	Fury_Configuration["NextAttackRage"] = 40
	Fury_Configuration["BerserkHealth"] = 60
	Fury_Configuration["HamstringHealth"] = 40
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
	Fury_Configuration[ABILITY_OVERPOWER_FURY] = true
	Fury_Configuration[ABILITY_PUMMEL_FURY] = true
	Fury_Configuration[ABILITY_REND_FURY] = true
	Fury_Configuration[ABILITY_SHIELD_BASH_FURY] = true
	Fury_Configuration[ABILITY_SHIELD_SLAM_FURY] = true
	Fury_Configuration[ABILITY_WHIRLWIND_FURY] = true
	Fury_Configuration[ITEM_JUJU_FLURRY] = false
	Fury_Configuration[ITEM_JUJU_MIGHT] = false
	Fury_Configuration[ITEM_JUJU_POWER] = false
	Fury_Configuration[ITEM_JUJU_CHILL] = true
	Fury_Configuration[ITEM_JUJU_EMBER] = false
	Fury_Configuration[ITEM_OIL_OF_IMMOLATION] = false
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
	DEFAULT_CHAT_FRAME:AddMessage(msg)
end

local function Debug(msg)
	if Fury_Configuration["Debug"] then
		Print(msg)
	end
end

function PrintEffects(target)
	local id = 1
	if UnitBuff(target, id) then
		Print("Buffs:")
		while (UnitBuff(target, id)) do
			Print(UnitBuff(target, id))
			id = id + 1
		end
		id = 1
	end
	if UnitDebuff(target, id) then
		Print("Debuffs:")
		while UnitDebuff(target, id) do
			Print(UnitDebuff(target, id))
			id = id + 1
		end
	end
end

local res = {
	["fire"] = {
		--Naxxramas
		"Grand Widow Faerlina",
		"Thane Korth'azz",
		--MC
		"Ragnaros",
		-- Onyxia
		"Onyxia"
	},
	["frost"] = {
		--Naxxramas
		"Kel'Thuzad",
		"Sapphiron"
	},
	["nature"] = {
		--Naxxramas
		"Heigan the Unclean",
		"Loatheb",
		"Princess Huhuran"
	},
	["shadow"] = {
		"Loatheb",
		"Baron Rivendare",
		"Lady Blaumeux"
	},
	["arcane"] = {
		--Naxxramas
		"Gothik the Harvester",
		--AQ40
		"The Prophet Skeram",
		"Emperor Vek'lor",
		--MC
		"Shazzrath"
	},
	["holy"] = {
		--Naxxramas
		"Sir Zeliek"
	}
}

function UseRes(type)
	for _, name in pairs(res[type]) do
		if UnitName("target") == name then
			return true
		end
	end
	return false
end


--------------------------------------------------

function SpellId(spellname)
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

function SpellReady(spellname)
	local id = SpellId(spellname)
	if id then
		local start, duration = GetSpellCooldown(id, 0)
		if start == 0 and duration == 0 and FuryLastSpellCast + 1 <= GetTime() then
			return true
		end
	end
	return false
end

function HasDebuff(unit, texturename, amount)
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

function HasBuff(unit, texturename)
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

function UseContainerItemByNameOnPlayer(search)
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

function ActiveStance()
	--Detect the active stance
	for i = 1, 3 do
		local _, _, active = GetShapeshiftFormInfo(i)
		if active then
			return i
		end
	end
	return nil
end

function Weapon()
	--Detect if a suitable weapon (not a skinning knife/mining pick and not broken) is present
	if GetInventoryItemLink("player", 16) then
		local _, _, itemCode = strfind(GetInventoryItemLink("player", 16), "(%d+):")
		local itemName, itemLink, _, _, itemType = GetItemInfo(itemCode)
		if itemLink ~= "item:7005:0:0:0" and itemLink ~= "item:2901:0:0:0" and not GetInventoryItemBroken("player", 16) then
			return true
		end
	end
	return nil
end

function Shield()
	--Detect if a shield is present
	if GetInventoryItemLink("player", 17) then
		local _, _, itemCode = strfind(GetInventoryItemLink("player", 17), "(%d+):")
		local _, _, _, _, _, itemType = GetItemInfo(itemCode)
		if itemType == ITEM_SHIELDS_FURY and not GetInventoryItemBroken("player", 17) then
			return true
		end
	end
	return nil
end

function HamstringCost()
	--Calculate the cost of Hamstring based on gear
	local i = 0
	if GetInventoryItemLink("player", 10) then
		local _, _, itemCode = strfind(GetInventoryItemLink("player", 10), "(%d+):")
		local itemName = GetItemInfo(itemCode)
		if itemName == ITEM_GAUNTLETS1_FURY or itemName == ITEM_GAUNTLETS2_FURY or itemName == ITEM_GAUNTLETS3_FURY or itemName == ITEM_GAUNTLETS4_FURY then
			i = 3
		end
	end
	return 10 - i
end

function AntiStealthDebuff()
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

function SnareDebuff()
	--Detect snaring debuffs
	--Hamstring, Wing Clip, Curse of Exhaustion, Crippling Poison, Frostbolt, Cone of Cold, Frost Shock
	if HasDebuff("target", "Ability_ShockWave")
	  or HasDebuff("target", "Ability_Rogue_Trip")
	  or HasDebuff("target", "Spell_Shadow_GrimWard")
	  or HasDebuff("target", "Ability_PoisonSting")
	  or HasDebuff("target", "Spell_Frost_FrostBolt02")
	  or HasDebuff("target", "Spell_Frost_Glacier")
	  or HasDebuff("target", "Spell_Frost_FrostShock") then
		return true
	end
	return nil
end

function Fury_RunnerDetect(arg1, arg2)
	--Thanks to HateMe
	if arg1 == CHAT_RUNNER_FURY then
		Fury_Runners[arg2] = true
	end
end

function ItemExists(itemName)
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


function ItemReady(item)
	if ItemExists(item) == false then
		return false
	end
	local _, duration, _ = GetItemCooldown(item)
	if duration == 0 then
		return true
	end
	return false
end

function addEnemyCount(Enemies)
	for i=5,1,-1 do
		WWEnemies.Hist[i] = WWEnemies.Hist[i - 1]
	end
	WWEnemies.Hist[0] = Enemies
	Debug("Enemies "..Enemies)
	if Enemies < 2 and Fury_Configuration[MODE_HEADER_AOE] then
		Print("Disabling AoE")
		Fury_Configuration[MODE_HEADER_AOE] = false
	end
end

function Fury()
	if Fury_Configuration["Enabled"]
	  and not UnitIsCivilian("target")
	  and UnitClass("player") == CLASS_WARRIOR_FURY
	  and FuryTalents then
		if Fury_Configuration["AutoAttack"] and not FuryAttack then
			-- Auto attack closest target
			AttackTarget()
		end

		if FuryOverpower then
			if (GetTime() - FuryOverpower) > 4 then
				FuryOverpower = nil
			end
		end

		if FurySpellInterrupt then
			if (GetTime() - FurySpellInterrupt) > 2 then
				FurySpellInterrupt = nil
			end
		end

		-- Add number of enemies
		if GetTime() - WWEnemies.CleaveTime > 1 and WWEnemies.CleaveCount ~= nil then
			addEnemyCount(WWEnemies.CleaveCount)
			WWEnemies.CleaveCount = nil
		elseif GetTime() - WWEnemies.WWTime > 1 and WWEnemies.WWCount ~= nil then
			addEnemyCount(WWEnemies.WWCount)
			WWEnemies.WWCount = nil
		end

		-- Dismount if mounted
		if FuryMount then
			Debug("Dismount")
			Dismount()
			FuryMount = nil

		-- Use Berserker rage to interrupt fears and ....
		elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
		  and (FuryIncapacitate or FuryFear)
		  and ActiveStance() == 3
		  and SpellReady(ABILITY_BERSERKER_RAGE_FURY) then
			Debug("Berserker Rage")
			CastSpellByName(ABILITY_BERSERKER_RAGE_FURY)
			FuryLastSpellCast = GetTime()

		-- Execute, this will stance dance in prot mode?
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

		-- Overpower when available
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

		-- Pummel if casting
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
				if UnitName("target") == "Kel'Thuzad" then
					SendChatMessage("Kicked" ,"SAY" ,"common")
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

		-- Shield bash to interrupt
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
				if UnitName("target") == "Kel'Thuzad" then
					SendChatMessage("Kicked" ,"SAY" ,"common")
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

		-- Cast hamstring to stop runners
		elseif Fury_Configuration[ABILITY_HAMSTRING_FURY]
		  and (UnitIsPlayer("target")
		  or (Fury_Runners[UnitName("target")]
		  and (UnitHealth("target") / UnitHealthMax("target") * 100) <= tonumber(Fury_Configuration["HamstringHealth"])))
		  and Weapon()
		  and not SnareDebuff()
		  and FuryAttack == true
		  and UnitMana("player") >= HamstringCost()
		  and (ActiveStance() ~= 2
		  or (UnitMana("player") <= (FuryTacticalMastery + Fury_Configuration["StanceChangeRage"])
		  and Fury_Configuration["PrimaryStance"] ~= 0))
		  and SpellReady(ABILITY_HAMSTRING_FURY) then
			if ActiveStance() ~= 2 then
				Debug("Hamstring (Runner)")
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

		-- slow target
		elseif Fury_Configuration[ABILITY_PIERCING_HOWL_FURY]
		  and FuryPiercingHowl
		  and (UnitIsPlayer("target")
		  or (Fury_Runners[UnitName("target")]
		  and (UnitHealth("target") / UnitHealthMax("target") * 100) <= tonumber(Fury_Configuration["HamstringHealth"])))
		  and FuryAttack == true
		  and not SnareDebuff()
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_PIERCING_HOWL_FURY) then
				Debug("Piercing Howl")
				CastSpellByName(ABILITY_PIERCING_HOWL_FURY)
				FuryLastSpellCast = GetTime()

		-- Rend to antistealth
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

		-- Berserker rage
		elseif Fury_Configuration[ABILITY_BERSERKER_RAGE_FURY]
		  and FuryBerserkerRage
		  and not UnitIsPlayer("target")
		  and UnitName("target") ~= "Magmadar"
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
				FuryLastSpellCast = GetTime()
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

		-- Stance dance
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

		-- Bloodrage
		elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
		  and UnitMana("player") <= tonumber(Fury_Configuration["MaximumRage"])
		  and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["BloodrageHealth"])
		  and SpellReady(ABILITY_BLOODRAGE_FURY) then
			Debug("Bloodrage")
			CastSpellByName(ABILITY_BLOODRAGE_FURY)
			--FuryLastSpellCast = GetTime()
			--No global cooldown, added anyway to ensure better flow

		-- Battle Shout
		elseif Fury_Configuration[ABILITY_BATTLE_SHOUT_FURY]
		  and not HasBuff("player", "Ability_Warrior_BattleShout")
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_BATTLE_SHOUT_FURY) then
			Debug("Battle Shout")
			CastSpellByName(ABILITY_BATTLE_SHOUT_FURY)
			FuryLastSpellCast = GetTime()

		-- Racial berserking
		elseif Fury_Configuration[RACIAL_BERSERKING_FURY]
		  and UnitMana("player") >= 5
		  and (UnitHealth("player") / UnitHealthMax("player") * 100) <= tonumber(Fury_Configuration["BerserkHealth"])
		  and not HasBuff("player", "Racial_Berserk")
		  and SpellReady(RACIAL_BERSERKING_FURY) then
			Debug("Berserking")
			CastSpellByName(RACIAL_BERSERKING_FURY)
			FuryLastSpellCast = GetTime()

		-- Disarm (PVP only)
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

		-- Demoralizing Shout (PVE only)
		elseif Fury_Configuration[ABILITY_DEMORALIZING_SHOUT_FURY]
		  and not HasDebuff("target", "Ability_Warrior_WarCry")
		  and not HasDebuff("target", "Ability_Druid_DemoralizingRoar")
		  and UnitMana("player") >= 10
		  and not UnitIsPlayer("target")
		  and FuryAttack == true
		  and SpellReady(ABILITY_DEMORALIZING_SHOUT_FURY) then
			Debug("Demoralizing Shout")
			CastSpellByName(ABILITY_DEMORALIZING_SHOUT_FURY)
			FuryLastSpellCast = GetTime()

		-- Mortal Strike
		elseif Fury_Configuration[ABILITY_MORTAL_STRIKE_FURY]
		  and FuryMortalStrike
		  and Weapon()
		  and not Fury_Configuration[MODE_HEADER_AOE]
		  and UnitMana("player") >= 30
		  and SpellReady(ABILITY_MORTAL_STRIKE_FURY) then
			Debug("Mortal Strike")
			CastSpellByName(ABILITY_MORTAL_STRIKE_FURY)
			FuryLastSpellCast = GetTime()

		-- Bloodthirst
		elseif Fury_Configuration[ABILITY_BLOODTHIRST_FURY]
		  and FuryBloodthirst
		  and not Fury_Configuration[MODE_HEADER_AOE]
		  and UnitMana("player") >= 30
		  and SpellReady(ABILITY_BLOODTHIRST_FURY) then
			Debug("Bloodthirst")
			CastSpellByName(ABILITY_BLOODTHIRST_FURY)
			FuryLastSpellCast = GetTime()

		-- Shield Slam
		elseif Fury_Configuration[ABILITY_SHIELD_SLAM_FURY]
		  and FuryShieldSlam
		  and UnitMana("player") >= 20
		  and SpellReady(ABILITY_SHIELD_SLAM_FURY) then
		  Debug("Shield Slam")
		  CastSpellByName(ABILITY_SHIELD_SLAM_FURY)
		  FuryLastSpellCast = GetTime()

		-- Whirlwind
		elseif (Fury_Configuration[ABILITY_WHIRLWIND_FURY]
		  or Fury_Configuration[MODE_HEADER_AOE])
		  and CheckInteractDistance("target", 2)
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

		-- Stance dance (part 2)
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

		-- Juju Flurry
		elseif FuryCombat
		  and not HasBuff("player", "INV_Misc_MonsterScales_17")
		  and FuryAttack == true
		  and Fury_Configuration[ITEM_JUJU_FLURRY]
		  and ItemReady(ITEM_JUJU_FLURRY) then
			Debug(ITEM_JUJU_FLURRY)
			UseContainerItemByNameOnPlayer(ITEM_JUJU_FLURRY)

		-- Juju Chill
		elseif FuryCombat
		  and FuryAttack == true
		  and Fury_Configuration[ITEM_JUJU_CHILL]
		  and not HasBuff("player", "INV_Misc_MonsterScales_09")
		  and UseRes("frost")
		  and ItemReady(ITEM_JUJU_CHILL) then
			Debug(ITEM_JUJU_CHILL)
			UseContainerItemByNameOnPlayer(ITEM_JUJU_CHILL)

		-- Juju Ember
		elseif FuryCombat
		  and Fury_Configuration[ITEM_JUJU_EMBER]
		  and not HasBuff("player", "INV_Misc_MonsterScales_15")
		  and UseRes("fire")
		  and ItemReady(ITEM_JUJU_EMBER) then
			Debug(ITEM_JUJU_EMBER)
			UseContainerItemByNameOnPlayer(ITEM_JUJU_EMBER)

		-- Juju Might
		elseif FuryCombat
		  and FuryAttack == true
		  and Fury_Configuration[ITEM_JUJU_MIGHT]
		  and not HasBuff("player", "INV_Misc_MonsterScales_07")
		  and not HasBuff("player", "INV_Potion_92") -- Winterfall Firewater
		  and ItemReady(ITEM_JUJU_MIGHT) then
			Debug(ITEM_JUJU_MIGHT)
			UseContainerItemByNameOnPlayer(ITEM_JUJU_MIGHT)

		-- Juju Power
		elseif FuryCombat
		  and FuryAttack == true
		  and Fury_Configuration[ITEM_JUJU_POWER]
		  and not HasBuff("player", "INV_Misc_MonsterScales_11")
		  and not HasBuff("player", "INV_Potion_61") -- Elixir of Giants
		  and ItemReady(ITEM_JUJU_POWER) then
			Debug(ITEM_JUJU_POWER)
			UseContainerItemByNameOnPlayer(ITEM_JUJU_POWER)

		-- Immolation potion
		elseif FuryCombat
		  and Fury_Configuration[ITEM_OIL_OF_IMMOLATION]
		  and not HasBuff("player", "Spell_Fire_Immolation")
		  and ItemReady(ITEM_OIL_OF_IMMOLATION) then
			Debug(ITEM_OIL_OF_IMMOLATION)
			UseContainerItemByNameOnPlayer(ITEM_OIL_OF_IMMOLATION)

		-- Blood Fury (Orc racial ability)
		elseif Fury_Configuration[ABILITY_DEATH_WISH_FURY]
		  and FuryAttack == true
		  and ActiveStance() ~= 2
		  and FuryCombat
		  and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["DeathWishHealth"])
		  and SpellReady(ABILITY_BLOOD_FURY) then
			Debug("Blood Fury")
			CastSpellByName(ABILITY_BLOOD_FURY)

		-- Death Wish
		elseif Fury_Configuration[ABILITY_DEATH_WISH_FURY]
		  and UnitMana("player") >= 10
		  and FuryAttack == true
		  and ActiveStance() ~= 2
		  and FuryCombat
		  and (UnitHealth("player") / UnitHealthMax("player") * 100) >= tonumber(Fury_Configuration["DeathWishHealth"])
		  and SpellReady(ABILITY_DEATH_WISH_FURY) then
			Debug("Death Wish")
			CastSpellByName(ABILITY_DEATH_WISH_FURY)

		-- Dump rage with Heroic Strike or Cleave
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
		  or (not Fury_Configuration[ABILITY_WHIRLWIND_FURY]
		  or not CheckInteractDistance("target", 2))) then

			--Will try to lessen the amounts of Heroic Strike, when instanct attacks (MS, BT, WW) are enabled
			-- Hamstring
			if Fury_Configuration[ABILITY_HAMSTRING_FURY]
			  and FuryFlurry
			  and Weapon()
			  and not HasBuff("player", "Ability_GhoulFrenzy")
			  and UnitMana("player") >= HamstringCost()
			  and SpellReady(ABILITY_HAMSTRING_FURY) then
				-- Try trigger Flurry with use of Hamstring to dump rage
				Debug("Hamstring")
				CastSpellByName(ABILITY_HAMSTRING_FURY)

			-- Heroic Strike
			elseif Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY]
			  and Weapon()
			  and not Fury_Configuration[MODE_HEADER_AOE]
			  and UnitMana("player") >= FuryHeroicStrikeCost
			  and UnitMana("player") >= tonumber(Fury_Configuration["NextAttackRage"])
			  and SpellReady(ABILITY_HEROIC_STRIKE_FURY) then
				Debug("Heroic Strike")
				CastSpellByName(ABILITY_HEROIC_STRIKE_FURY)
				--FuryLastSpellCast = GetTime()
				--No global cooldown, added anyway to prevent Heroic Strike from being spammed over other abilities

			-- Cleave
			elseif (Fury_Configuration[ABILITY_CLEAVE_FURY]
			  or Fury_Configuration[MODE_HEADER_AOE])
			  and Weapon()
			  and UnitMana("player") >= 20
			  and ((UnitMana("player") >= tonumber(Fury_Configuration["NextAttackRage"]))
			  or (Fury_Configuration[MODE_HEADER_AOE] and UnitMana("player") >= 25))
			  and SpellReady(ABILITY_CLEAVE_FURY) then
				Debug("Cleave")
				CastSpellByName(ABILITY_CLEAVE_FURY)
				--FuryLastSpellCast = GetTime()
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

local function doCharge()
	if FuryMount then
		-- Dismount as a first step
		Debug("Dismounting")
		Dismount();
		FuryMount = nil;
	elseif FuryCombat then
		Debug("In combat")
		if Fury_Configuration[ABILITY_INTERCEPT_FURY]
		  and ActiveStance() == 3
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_INTERCEPT_FURY) then
			Debug("Intercept")
			CastSpellByName(ABILITY_INTERCEPT_FURY);
		elseif Fury_Configuration[ABILITY_BLOODRAGE_FURY]
		  and ActiveStance() == 3
		  and UnitMana("player") < 10
		  and SpellReady(ABILITY_BLOODRAGE_FURY) then
			Debug("Bloodrage")
			CastSpellByName(ABILITY_BLOODRAGE_FURY);
		elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
		  and ActiveStance() ~= 3
		  and SpellReady(ABILITY_INTERCEPT_FURY) then
			if (FuryLastStanceCast + 1.5 <= GetTime()) then
				Debug("Berserker Stance (Intercept)");
				if (not FuryOldStance) then
					FuryOldStance = ActiveStance();
					FuryLastStanceCast = GetTime();
				end
				CastShapeshiftForm(3);
			end
		end
	else
		Debug("Out of combat")
		if Fury_Configuration[ABILITY_CHARGE_FURY]
		  and ActiveStance() == 1
		  and SpellReady(ABILITY_CHARGE_FURY) then
			Debug("Charge")
			CastSpellByName(ABILITY_CHARGE_FURY);
		elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
		  and ActiveStance() == 3
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_INTERCEPT_FURY) then
			Debug("Intercept")
			CastSpellByName(ABILITY_INTERCEPT_FURY);
		elseif Fury_Configuration[ABILITY_CHARGE_FURY]
		  and ActiveStance() ~= 1
		  and SpellReady(ABILITY_CHARGE_FURY)
		  and UnitMana("player") < tonumber(Fury_Configuration["StanceChangeRage"]) then
			Debug("Arm Stance (Charge)")
			if Fury_Configuration["PrimaryStance"] ~= 1
			  and FuryOldStance == nil then
				FuryOldStance = ActiveStance()
				FuryLastStanceCast = GetTime()
			end
			CastShapeshiftForm(1)
		elseif Fury_Configuration[ABILITY_INTERCEPT_FURY]
		  and ActiveStance() == 3
		  and UnitMana("player") >= 10
		  and SpellReady(ABILITY_INTERCEPT_FURY) then
			Debug("Intercept")
			CastSpellByName(ABILITY_INTERCEPT_FURY)
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
		doCharge()
	elseif command == "aoe" then
		if Fury_Configuration[MODE_HEADER_AOE] then
			Fury_Configuration[MODE_HEADER_AOE] = false
			Print(BINDING_HEADER_FURY .. ": " .. MODE_HEADER_AOE .. " " .. SLASH_FURY_DISABLED .. ".")
		else
			Fury_Configuration[MODE_HEADER_AOE] = true
			Print(BINDING_HEADER_FURY .. ": " .. MODE_HEADER_AOE .. " " .. SLASH_FURY_ENABLED .. ".")
		end
	elseif command == "toggle" then
		if Fury_Configuration["Enabled"] then
			Fury_Configuration["Enabled"] = false
			Print(BINDING_HEADER_FURY .. ": " .. BINDING_HEADER_FURY .. " " .. SLASH_FURY_DISABLED .. ".")
		else
			Fury_Configuration["Enabled"] = true
			Print(BINDING_HEADER_FURY .. ": " .. BINDING_HEADER_FURY .. " " .. SLASH_FURY_ENABLED .. ".")
		end
	elseif command == "debug" then
		if Fury_Configuration["Debug"] then
			Fury_Configuration["Debug"] = false
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_DEBUG .. " " .. SLASH_FURY_DISABLED .. ".")
		else
			Fury_Configuration["Debug"] = true
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_DEBUG .. " " .. SLASH_FURY_ENABLED .. ".")
		end
	elseif command == "dance" then
		if options == ""
		  or tonumber(options) < 0 then
			options = 0
		elseif tonumber(options) > 100 then
			options = 100
		end
		Fury_Configuration["StanceChangeRage"] = options
		Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_DANCE .. options .. ".")
	elseif command == "attack" then
		if Fury_Configuration["AutoAttack"] then
			Fury_Configuration["AutoAttack"] = false
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_AUTOATTACK .. " " .. SLASH_FURY_DISABLED .. ".")
		else
			Fury_Configuration["AutoAttack"] = true
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_AUTOATTACK .. " " .. SLASH_FURY_ENABLED .. ".")
		end
	elseif command == "rage" then
		if options == "" or tonumber(options) < 0 then
			options = 0
		elseif tonumber(options) > 100 then
			options = 100
		end
		Fury_Configuration["MaximumRage"] = options
		Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_RAGE .. options .. ".")

	elseif command == "attackrage" then
		if options == "" or tonumber(options) < 0 then
			options = 0
		elseif tonumber(options) > 100 then
			options = 100
		end
		Fury_Configuration["NextAttackRage"] = options
		Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_ATTACKRAGE .. options .. ".")

	elseif command == "bloodrage" then
		if options == "" or tonumber(options) < 1 then
			options = 1
		elseif tonumber(options) > 100 then
			options = 100
		end
		Fury_Configuration["BloodrageHealth"] = options
		Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_BLOODRAGE .. options .. ".")

	elseif command == "deathwish" then
		if options == "" or tonumber(options) < 1 then
			options = 1
		elseif tonumber(options) > 100 then
			options = 100
		end
		Fury_Configuration["DeathWishHealth"] = options
		Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_DEATHWISH .. options .. ".")

	elseif command == "hamstring" then
		if options == "" or tonumber(options) < 1 then
			options = 1
		elseif tonumber(options) > 100 then
			options = 100
		end
		Fury_Configuration["HamstringHealth"] = options
		Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_HAMSTRING .. options .. ".")

	elseif command == "threat" then
		--If HS then use cleave, if cleave then use HS
		if Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] then
			Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = false
			Fury_Configuration[ABILITY_CLEAVE_FURY] = true
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_LOWTHREAT)
		else
			Fury_Configuration[ABILITY_CLEAVE_FURY] = false
			Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = true
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_HIGHTHREAT)
		end
	elseif command == "berserk" then
		if options == "" or tonumber(options) < 1 then
			options = 1
		elseif tonumber(options) > 100 then
			options = 100
		end
		Fury_Configuration["BerserkHealth"] = options
		Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_TROLL .. options .. ".")
	elseif command == "stance" then
		if options == ABILITY_BATTLE_STANCE_FURY
		  or options == "1" then
			Fury_Configuration["PrimaryStance"] = 1
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_STANCE .. ABILITY_BATTLE_STANCE_FURY .. ".")
		elseif options == ABILITY_DEFENSIVE_STANCE_FURY
		  or options == "2" then
			Fury_Configuration["PrimaryStance"] = 2
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_STANCE .. ABILITY_DEFENSIVE_STANCE_FURY .. ".")
		elseif options == ABILITY_BERSERKER_STANCE_FURY
		  or options == "3" then
			Fury_Configuration["PrimaryStance"] = 3
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_STANCE .. ABILITY_BERSERKER_STANCE_FURY .. ".")
		elseif options == "default" then
			Fury_Configuration["PrimaryStance"] = false
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_STANCE .. SLASH_FURY_DEFAULT .. ".")
		else
			Fury_Configuration["PrimaryStance"] = 0
			Print(BINDING_HEADER_FURY .. ": " .. SLASH_FURY_NOSTANCE .. SLASH_FURY_DISABLED .. ".")
		end

	elseif command == "juju" then
		if options == "flurry" then
			if Fury_Configuration[ITEM_JUJU_FLURRY] then
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_FLURRY .. " disabled.")
				Fury_Configuration[ITEM_JUJU_FLURRY] = false
			else
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_FLURRY .. " enabled.")
				Fury_Configuration[ITEM_JUJU_FLURRY] = true
			end
		elseif options == "chill" then
			if Fury_Configuration[ITEM_JUJU_CHILL] then
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_CHILL .. " disabled.")
				Fury_Configuration[ITEM_JUJU_CHILL] = false
			else
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_CHILL .. " enabled.")
				Fury_Configuration[ITEM_JUJU_CHILL] = true
			end
		elseif options == "might" then
			if Fury_Configuration[ITEM_JUJU_MIGHT] then
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_MIGHT .. " disabled.")
				Fury_Configuration[ITEM_JUJU_MIGHT] = false
			else
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_MIGHT .. " enabled.")
				Fury_Configuration[ITEM_JUJU_MIGHT] = true
			end
		elseif options == "ember" then
			if Fury_Configuration[ITEM_JUJU_EMBER] then
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_EMBER .. " disabled.")
				Fury_Configuration[ITEM_JUJU_EMBER] = false
			else
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_EMBER .. " enabled.")
				Fury_Configuration[ITEM_JUJU_EMBER] = true
			end
		elseif options == "power" then
			if Fury_Configuration[ITEM_JUJU_POWER] then
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_POWER .. " disabled.")
				Fury_Configuration[ITEM_JUJU_POWER] = false
			else
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_JUJU_POWER .. " enabled.")
				Fury_Configuration[ITEM_JUJU_POWER] = true
			end
		else
			Print(HELP_JUJU)
		end
	elseif command == "ooi" then
			if Fury_Configuration[ITEM_OIL_OF_IMMOLATION] then
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_OIL_OF_IMMOLATION .. " disabled.")
				Fury_Configuration[ITEM_OIL_OF_IMMOLATION] = false
			else
				Print(BINDING_HEADER_FURY .. ": " .. ITEM_OIL_OF_IMMOLATION .. " enabled.")
				Fury_Configuration[ITEM_OIL_OF_IMMOLATION] = true
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
			Print(BINDING_HEADER_FURY .. ": " .. ABILITY_HEROIC_STRIKE_FURY .. " enabled.")
			if Fury_Configuration[ABILITY_CLEAVE_FURY] then
				Fury_Configuration[ABILITY_CLEAVE_FURY] = false
				Print(BINDING_HEADER_FURY .. ": " .. ABILITY_CLEAVE_FURY .. " disabled.")
			end
		elseif options == ABILITY_CLEAVE_FURY
		  and not Fury_Configuration[ABILITY_CLEAVE_FURY] then
			Fury_Configuration[ABILITY_CLEAVE_FURY] = true
			Print(BINDING_HEADER_FURY .. ": " .. ABILITY_CLEAVE_FURY .. " enabled.")
			if Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] then
				Fury_Configuration[ABILITY_HEROIC_STRIKE_FURY] = false
				Print(BINDING_HEADER_FURY .. ": " .. ABILITY_HEROIC_STRIKE_FURY .. " disabled.")
			end
		elseif Fury_Configuration[options] then
			Fury_Configuration[options] = false
			Print(BINDING_HEADER_FURY .. ": " .. options .. " disabled.")
		elseif Fury_Configuration[options] == false then
			Fury_Configuration[options] = true
			Print(BINDING_HEADER_FURY .. ": " .. options .. " enabled.")
		else
			Print(BINDING_HEADER_FURY .. ": " .. options .. " not found.")
		end
	elseif command == "version" then
		Print("Version "..FURY_VERSION)
	elseif command == "help" then
		if options == nil or options == "" then
			Print(SLASH_FURY_HELP)
		else
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
			 ["hamstring"] = HELP_HAMSTRING,
			 ["juju"] = HELP_JUJU,
			 ["help"] = HELP_HELP,
			 ["ooi"] = HELP_OOI,
			 ["rage"] = HELP_RAGE,
			 ["stance"] = HELP_STANCE,
			 ["threat"] = HELP_THREAT,
			 ["toggle"] = HELP_TOGGLE,
			 ["unit"] = HELP_UNIT,
			 ["where"] = HELP_WHERE
			}
			if helps[options] ~= nil then
				Print(helps[options])
			else
				Print(HELP_UNKNOWN)
			end
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

	this:RegisterEvent("CHAT_MSG_SPELL_PERIODIC_SELF_DAMAGE")
	this:RegisterEvent("CHAT_MSG_SPELL_AURA_GONE_SELF")

	this:RegisterEvent("PLAYER_AURAS_CHANGED")

	FuryLastSpellCast = GetTime()
	FuryLastStanceCast = GetTime()
	SlashCmdList["FURY"] = Fury_SlashCommand
	SLASH_FURY1 = "/fury"
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
			end
			return
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
		if string.find(arg1,"You block")
		  or string.find(arg1,"You parry")
		  or string.find(arg1,"You dodge") then
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
			FuryOverpower = nil
			FurySpellInterrupt = nil
		end
		if not FuryTalents then
			--Calculate the cost of Heroic Strike based on talents
			local _, _, _, _, currRank = GetTalentInfo(1, 1)
			FuryHeroicStrikeCost = (15 - tonumber(currRank))
			--Calculate the cost of Execute based on talents
			local _, _, _, _, currRank = GetTalentInfo(2, 10)
			FuryExecuteCost = (15 - strsub(tonumber(currRank) * 2.5, 1, 2))
			--Calculate the rage retainment of Tactical Mastery
			local _, _, _, _, currRank = GetTalentInfo(1, 5)
			FuryTacticalMastery = (tonumber(currRank) * 5)
			--Check for Improved Berserker Rage
			local _, _, _, _, currRank = GetTalentInfo(2, 15)
			if currRank > 0 then
				FuryBerserkerRage = true
			else
				FuryBerserkerRage = false
			end
			--Check for Flurry
			local _, _, _, _, currRank = GetTalentInfo(1, 16)
			if currRank > 0 then
				FuryFlurry = true
			else
				FuryFlurry = false
			end
			--Check for Piercing Howl
			local _, _, _, _, currRank = GetTalentInfo(2, 6)
			if currRank > 0 then
				FuryPiercingHowl = true
			else
				FuryPiercingHowl = false
			end
			--Check for Mortal Strike
			local _, _, _, _, currRank = GetTalentInfo(1, 18)
			if currRank > 0 then
				FuryMortalStrike = true
			else
				FuryMortalStrike = false
			end
			--Check for Bloodthirst
			local _, _, _, _, currRank = GetTalentInfo(2, 17)
			if currRank > 0 then
				FuryBloodthirst =  true
			else
				FuryBloodthirst = false
			end
			--Check for Shield Slam
			local _, _, _, _, currRank = GetTalentInfo(3, 17)
			if currRank > 0 then
				FuryShieldSlam =  true
			else
				FuryShieldSlam = false
			end
			FuryTalents = true
		end

	elseif event == "PLAYER_REGEN_DISABLED" then
		FuryCombat = true

	elseif event == "PLAYER_REGEN_ENABLED" then
		FuryCombat = nil
		FuryDanceDone = nil
		FuryOldStance = nil

	elseif event == "PLAYER_ENTER_COMBAT" then
		FuryAttack = true

	elseif event == "PLAYER_LEAVE_COMBAT" then
		FuryAttack = nil

	end
end

function Fury_CheckButtons()
	if not Zorlen_Button_SweepingStrikes then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_SweepingStrikes) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_SweepingStrikes then
				Print("You must put "..LOCALIZATION_ZORLEN_SweepingStrikes.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Cleave then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Cleave) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Cleave then
				Print("You must put "..LOCALIZATION_ZORLEN_Cleave.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Whirlwind then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Whirldwind) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Whirlwind then
				Print("You must put "..LOCALIZATION_ZORLEN_Whirlwind.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_ThunderClap then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_ThunderClap) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_ThunderClap then
				Print("You must put "..LOCALIZATION_ZORLEN_ThunderClap.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Disarm then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Disarm) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Disarm then
				Print("You must put "..LOCALIZATION_ZORLEN_Disarm.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_MortalStrike then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_MortalStrike) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_MortalStrike then
				Print("You must put "..LOCALIZATION_ZORLEN_MortalStrike.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Bloodthirst then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Bloodthirst) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Bloodthirst then
				Print("You must put "..LOCALIZATION_ZORLEN_Bloodthirst.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_ShieldSlam then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_ShieldSlam) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_ShieldSlam then
				Print("You must put "..LOCALIZATION_ZORLEN_ShieldSlam.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Charge then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Charge) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Charge then
				Print("You must put "..LOCALIZATION_ZORLEN_Charge.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Intercept then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Intercept) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Intercept then
				Print("You must put "..LOCALIZATION_ZORLEN_Intercept.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Overpower then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Overpower) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Overpower then
				Print("You must put "..LOCALIZATION_ZORLEN_Overpower.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Rend then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Rend) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Rend then
				Print("You must put "..LOCALIZATION_ZORLEN_Rend.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Hamstring then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Hamstring) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Hamstring then
				Print("You must put "..LOCALIZATION_ZORLEN_Hamstring.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Execute then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Execute) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Execute then
				Print("You must put "..LOCALIZATION_ZORLEN_Execute.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_ShieldBash then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_ShieldBash) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_ShieldBash then
				Print("You must put "..LOCALIZATION_ZORLEN_ShieldBash.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Pummel then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Pummel) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Pummel then
				Print("You must put "..LOCALIZATION_ZORLEN_Pummel.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_DemoralizingShout then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_DemoralizingShout) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_DemoralizingShout then
				Print("You must put "..LOCALIZATION_ZORLEN_DemoralizingShout.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_BerserkerRage then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_BerserkerRage) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_BerserkerRage then
				Print("You must put "..LOCALIZATION_ZORLEN_BerserkerRage.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_Bloodrage then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_Bloodrage) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_Bloodrage then
				Print("You must put "..LOCALIZATION_ZORLEN_Bloodrage.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_DeathWish then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_DeathWish) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_DeathWish then
				Print("You must put "..LOCALIZATION_ZORLEN_DeathWish.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_HeroicStrike then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_HeroicStrike) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_HeroicStrike then
				Print("You must put "..LOCALIZATION_ZORLEN_HeroicStrike.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
	if not Zorlen_Button_BattleShout then
		if Zorlen_IsSpellKnown(LOCALIZATION_ZORLEN_BattleShout) then
			Zorlen_RegisterButtons()
			if not Zorlen_Button_BattleShout then
				Print("You must put "..LOCALIZATION_ZORLEN_BattleShout.." on one of your action bars (even if it is hidden) for Warrior Button to work right!")
			end
		end
	end
end