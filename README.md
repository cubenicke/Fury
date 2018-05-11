# Fury
Fury Addon by Bhaerau, modifications for end game raiding in vanilla. 

#Usage

In simplest form these two take you a long way
/fury
/fury aoe - toggles Whirlwind, Cleave only rotation

One can also disable individual spells like Whirlwind to not break crowd controled targets
/fury ability Whirlwind - toggle use of whirlwind

To minimize threat build up in normal rotation
/fury threat

#Reference
/fury - uses Fury

#Fight control
/fury aoe - enables cleave and whirlwind, disables overpower, bloodhtirst, Heroic Strike

##operational Control
/fury toggle - toggles Fury
/fury help - prints help text
/fury threat - enables Cleave or Heroic Strike based on current settings, use on thread critical fights to decrease threat build up

## Setup commands
/fury ability <name> - toggles the use of abilities. Must use correct names with capitalization, ie. Heroic Strike, Rend etc.
/fury dance <number> - sets rage allowed to be wasted when switching stance ("dancing")
/fury attackrage <number> - sets minimum rage required when using Heroic Strike or Cleave
/fury rage <number> - sets maximum rage allowed when using abilities to gain rage
/fury bloodrage <number> - sets minimum percent of health required when using Bloodrage
/fury hamstring <number> - sets maximum percent of health allowed when using Hamstring on NPCs
/fury berserk <number> - sets minimum percent of health required when using Berserk
/fury stance <name> - sets stance to return to after switching stance. If default is selected it will return to your last used stance. If no stance is selected it will disable stance switching. Must use correct names with capitalization.

##Debugging
/fury debug - toggles debug mode
/fury attack - toggles the use of autoattack. Experimental.

