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
    Battle Shout
    Berserker Rage
    Bloodrage
    Bloodthirst
    Cleave
    Disarm
    Death Wish
    Demoralizing Shout
    Execute
    Hamstring
    Heroic Strike
    Mortal Strike
    Overpower
    Pummel
    Rend
    Shield Bash
    Whirlwind

### Items
  * [Juju Chill](https://classicdb.ch/?item=12457) (Only Kel'Thuzad and Sapphiron)
  * [Juju Ember](https://classicdb.ch/?item=12455)
  * [Juju Might](https://classicdb.ch/?item=12460) Doesn't overrride [Winterfall Firewater](https://classicdb.ch/?item=12820)
  * [Juju Power](https://classicdb.ch/?item=12451) Doesn't overrride [Elixir of Giants](https://classicdb.ch/?item=9206)
  * [Juju Flurry](https://classicdb.ch/?item=12450)
  * [Oil of Immolation](https://classicdb.ch/?item=8956)

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