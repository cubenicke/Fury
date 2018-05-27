# Fury
Fury Addon originally by Bhaerau, modifications for end game raiding in vanilla by cubenicke.

## Usage

In simplest form these two take you a long way
```
/fury
```
Toggle whirlwind, Cleave only rotation
```
/fury aoe
```

To improve game play one can also disable individual spells like Whirlwind to not break crowd controlled targets
```
/fury ability Whirlwind
```
To minimize threat build up in normal rotation
```
/fury threat
```

### Usage
Some commands exists as key bindings, but for commands most commands one has to write a macro to make them usable during combat.
To get a button to press on the action bar, create a macro
    
    /fury juju power

Then edit the macro file in a text editor **WTF/<account>/<character>/macros-cache.txt**, change the icon name to the correct one. See below for some icon names.

    MACRO 16777224 "Power" INV_Misc_MonsterScales_11
        /fury juju power
    END

## Reference
```
/fury - uses Fury
```
### Logic
Dismount (Mounted only)  
Berserker Rage (Feared only)  
Execute  
Overpower  
Pummel / Shield Bash  
Hamstring  
Rend (PvP only)  
Berserker Rage (PvE only)  
Bloodrage  
Berserking (Troll racial)  
Disarm (PvP only)  
Demoralizing Shout (PvE only)  
Battle Shout  
Mortal Strike / Bloodthirst  
Whirlwind  
Juju Flurry  
Juju Chill  
Juju Ember  
Juju Might  
Juju Power  
Oil of Immolation  
Death Wish (on every cooldown)  
Hamstring  
Heroic Strike / Cleave  

### Abilities
**Name, Icon**  
![](https://classicdb.ch/images/icons/small/ability_warrior_battleshout.jpg) Battle Shout, Ability_Warrior_BattleShout  
![](https://classicdb.ch/images/icons/small/ability_rogue_ambush.jpg) Berserker Rage, spell_nature_ancestralguardian  
![](https://classicdb.ch/images/icons/small/ability_racial_bloodrage.jpg) Bloodrage, ability_racial_bloodrage  
![](https://classicdb.ch/images/icons/small/spell_nature_bloodlust.jpg) Bloodthirst, spell_nature_bloodlust  
![](https://classicdb.ch/images/icons/small/ability_warrior_cleave.jpg) Cleave, Ability_Warrior_Cleave  
![](https://classicdb.ch/images/icons/small/ability_warrior_disarm.jpg) Disarm, ability_warrior_disarm  
![](https://classicdb.ch/images/icons/small/spell_shadow_deathpact.jpg) Death Wish, Spell_Shadow_DeathPact  
![](https://classicdb.ch/images/icons/small/ability_warrior_warcry.jpg) Demoralizing Shout, Ability_Warrior_Warcry  
![](https://classicdb.ch/images/icons/small/inv_sword_48.jpg) Execute, inv_sword_48  
![](https://classicdb.ch/images/icons/small/ability_shockwave.jpg) Hamstring, ability_shockwave  
![](https://classicdb.ch/images/icons/small/ability_rogue_ambush.jpg) Heroic Strike, Ability_Rogue_Ambush  
![](https://classicdb.ch/images/icons/small/ability_warrior_savageblow.jpg) Mortal Strike, ability_warrior_savageblow  
![](https://classicdb.ch/images/icons/small/ability_meleedamage.jpg) Overpower, ability_meleedamage  
![](https://classicdb.ch/images/icons/small/inv_gauntlets_04.jpg) Pummel, inv_gauntlets_04  
![](https://classicdb.ch/images/icons/small/ability_gouge.jpg) Rend, ability_gouge  
![](https://classicdb.ch/images/icons/small/ability_warrior_shieldbash.jpg) Shield Bash, ability_warrior_shieldbash  
![](https://classicdb.ch/images/icons/small/ability_whirlwind.jpg) Whirlwind, Ability_Whirlwind  

### Items
  * ![](https://classicdb.ch/images/icons/small/inv_misc_monsterscales_09.jpg) [Juju Chill](https://classicdb.ch/?item=12457),INV_Misc_MonsterScales_09 (Only on Kel'Thuzad and Sapphiron)
  * ![](https://classicdb.ch/images/icons/small/inv_misc_monsterscales_15.jpg) [Juju Ember](https://classicdb.ch/?item=12455),INV_Misc_MonsterScales_15
  * ![](https://classicdb.ch/images/icons/small/inv_misc_monsterscales_17.jpg) [Juju Flurry](https://classicdb.ch/?item=12450),INV_Misc_MonsterScales_17
  * ![](https://classicdb.ch/images/icons/small/inv_misc_monsterscales_07.jpg) [Juju Might](https://classicdb.ch/?item=12460),INV_Misc_MonsterScales_07 Doesn't overrride ![](https://classicdb.ch/images/icons/small/inv_potion_92.jpg) [Winterfall Firewater](https://classicdb.ch/?item=12820)
  * ![](https://classicdb.ch/images/icons/small/inv_misc_monsterscales_11.jpg) [Juju Power](https://classicdb.ch/?item=12451),INV_Misc_MonsterScales_11 Doesn't overrride ![](https://classicdb.ch/images/icons/small/inv_potion_61.jpg) [Elixir of Giants](https://classicdb.ch/?item=9206)
  * ![](https://classicdb.ch/images/icons/small/inv_potion_11.jpg) [Oil of Immolation](https://classicdb.ch/?item=8956), inv_potion_11

### operational Control
```
/fury aoe - enables cleave and whirlwind, disables overpower, bloodhtirst, Heroic Strike (Swithced off when fewer than 2 enemies)
/fury toggle - toggles Fury
/fury threat - enables Cleave or Heroic Strike based on current settings, use on thread critical fights to decrease threat build up
/fury juju flurry|power|might|ember|chill - enables buff on every cooldown, chill only on Kel'Thuzad and Sapphiron
/fury ooi - enables Oil of Immolation whenever OoI buff is not up
/fury ability <name> - toggles the use of abilities. Must use correct names with capitalization, ie. Heroic Strike, Rend etc.
```
### Setup commands
```
/fury dance <number> - sets rage allowed to be wasted when switching stance ("dancing")
/fury attackrage <number> - sets minimum rage required when using Heroic Strike or Cleave
/fury rage <number> - sets maximum rage allowed when using abilities to gain rage
/fury bloodrage <number> - sets minimum percent of health required when using Bloodrage
/fury hamstring <number> - sets maximum percent of health allowed when using Hamstring on NPCs
/fury berserk <number> - sets minimum percent of health required when using Berserk
/fury deathwish <number> - sets minimum percent of health required when using Death Wish
/fury stance <name> - sets stance to return to after switching stance. If default is selected it will return to your last used stance. If no stance is selected it will disable stance switching. Must use correct names with capitalization.
```
### Debugging
```
/fury help [command] - prints help text
/fury attack - toggles the use of autoattack. Experimental.
/fury debug - toggles debug mode
/fury unit [player|target] - shows buffs and debuffs for player or target
/fury where - info about whereabouts
```