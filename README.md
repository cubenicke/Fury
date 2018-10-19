# Fury
Fury Addon originally by Bhaerau, modifications for end game raiding in vanilla by cubenicke. Purpose for the addon is to make a Fury warriors life easier while raiding in vanilla wow.
Fury makes one button for the warrior rotation, but still makes it possible to adapt the rotation with manual settings to make it adapt for each fight. Also gives some aid with mid-fight buffs
like Jujus.

## Usage

In key bindings, bind these actions to some keys available to you mid fight (Same commands can also be created as macros - to create a button on action bar). Easiest way to get going
is to bind keys to Attack and Charge. Those two will work in most situations and just use charge to initiate fights (2-3 presses) then spam use Attack. When You want to have more control over
the logic you can go into the other keybinds or even macros to finetune your playstyle and handle certain mechanics.   

### KeyBinds

Attack - One button Fury Warrior rotation. Spam it!  
Charge - Will charge or intercept, sometimes builds rage and or switch stance to be able to charge/intercept.  
Toggle HS or Cleave - Dump excessing rage with Heroic Strike or Cleave. Useful in threat situations and for a AoE with single mob prio.  
Toggle WW - Stops using Whirlwind during normal rotation, toggle it in CC situations. or Kel'Thuzad to don't do damage on Mind Controlled people.   
Toggle DW - Enable it a bit into fights when you want your first Death Wish to fire off (Also controls Orc racial Blood Fury).  

### Usage as Macros
Some commands exists as key bindings, but for most commands one has to write a macro to make them usable during combat.
To get a button to press on the action bar, create a macro
    
    /fury juju power

To get the correct Icon for the macro, edit the macro file in a text editor **WTF/<account>/<character>/macros-cache.txt**, change the icon name to the correct one. See below for some icon names.

    MACRO 16777224 "Power" INV_Misc_MonsterScales_11
        /fury juju power
    END

## Reference

### Logic
Dismount (Mounted only)  
Berserker Rage (Feared only)  
Execute  
Overpower  
Pummel / Shield Bash  
Hamstring  
Piercing Howl  
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
Blood Fury (Orcs only)  
Death Wish (on every cooldown)  
Hamstring  
Heroic Strike / Cleave  

### Abilities
**Name, Icon**  
![](https://classicdb.ch/images/icons/small/ability_warrior_battleshout.jpg) Battle Shout, Ability_Warrior_BattleShout  
![](https://classicdb.ch/images/icons/small/spell_nature_ancestralguardian.jpg) Berserker Rage, spell_nature_ancestralguardian  
![](https://classicdb.ch/images/icons/small/racial_orc_berserkerstrength.jpg) Blood Fury, racial_orc_berserkerstrength  
![](https://classicdb.ch/images/icons/small/ability_racial_bloodrage.jpg) Bloodrage, ability_racial_bloodrage  
![](https://classicdb.ch/images/icons/small/spell_nature_bloodlust.jpg) Bloodthirst, spell_nature_bloodlust  
![](https://classicdb.ch/images/icons/small/ability_warrior_charge.jpg) Charge, Ability_Warrior_Charge  
![](https://classicdb.ch/images/icons/small/ability_warrior_cleave.jpg) Cleave, Ability_Warrior_Cleave  
![](https://classicdb.ch/images/icons/small/ability_warrior_disarm.jpg) Disarm, ability_warrior_disarm  
![](https://classicdb.ch/images/icons/small/spell_shadow_deathpact.jpg) Death Wish, Spell_Shadow_DeathPact  
![](https://classicdb.ch/images/icons/small/ability_warrior_warcry.jpg) Demoralizing Shout, Ability_Warrior_Warcry  
![](https://classicdb.ch/images/icons/small/inv_sword_48.jpg) Execute, inv_sword_48  
![](https://classicdb.ch/images/icons/small/ability_shockwave.jpg) Hamstring, ability_shockwave  
![](https://classicdb.ch/images/icons/small/ability_rogue_ambush.jpg) Heroic Strike, Ability_Rogue_Ambush  
![](https://classicdb.ch/images/icons/small/ability_rogue_sprint.jpg) Intercept, Ability_Warrior_Rogue_Sprint  
![](https://classicdb.ch/images/icons/small/ability_warrior_savageblow.jpg) Mortal Strike, ability_warrior_savageblow  
![](https://classicdb.ch/images/icons/small/ability_meleedamage.jpg) Overpower, ability_meleedamage  
![](https://classicdb.ch/images/icons/small/spell_shadow_deathscream.jpg) Piercing Howl, spell_shadow_deathscream  
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
/fury - uses Fury
/fury charge - uses Intercept or Charge sequence
/fury aoe - enables cleave and whirlwind, disables overpower, bloodhtirst, Heroic Strike (Swithced off when fewer than 2 enemies)
/fury toggle - toggles Fury on/off
/fury threat - enables Cleave or Heroic Strike based on current settings, use on threat critical fights to decrease threat build up
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