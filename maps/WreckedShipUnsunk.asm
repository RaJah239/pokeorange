const_value = 1
	const WRECKED_SHIP_SHADOW_BALL
	const WRECKED_SHIP_MIMIKYU
	const WRECKED_SHIP_PIKACHU

WreckedShipUnsunk_MapScriptHeader::

.Triggers: db 0

.Callbacks: db 2
	dbw MAPCALLBACK_NEWMAP, .InitializeDiveMap
	dbw MAPCALLBACK_OBJECTS, .hideMimikyu

.InitializeDiveMap:
	divemap WRECKED_SHIP_UNDERWATER, 0, 0
	return

.hideMimikyu
	disappear WRECKED_SHIP_MIMIKYU
	return

WreckedShipTMShadowBall:
	itemball TM_SHADOW_BALL

WreckedShipHiddenRareCandy:
	dwb EVENT_WRECKED_SHIP_HIDDEN_RARE_CANDY, RARE_CANDY
	
MimikyuScript:
	faceplayer
	disappear WRECKED_SHIP_PIKACHU
	checkcode VAR_FACING
	if_equal RIGHT, .playerLeft
	if_equal LEFT, .playerRight
	pause 15
	spriteface PLAYER, RIGHT
	pause 15
	spriteface PLAYER, LEFT
	pause 15
	spriteface PLAYER, UP
.appearMimikyu
	appear WRECKED_SHIP_MIMIKYU
	pause 5
	showemote EMOTE_SHOCK, PLAYER, 10
	opentext
	writetext MimikyuText
	cry MIMIKYU
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_SNORLAX
	loadwildmon MIMIKYU, 40
	startbattle
	disappear WRECKED_SHIP_MIMIKYU
	reloadmapafterbattle
	setevent EVENT_MIMIKYU_FOUGHT
	end

.playerLeft
	pause 15
	spriteface PLAYER, UP
	pause 15
	spriteface PLAYER, DOWN
	pause 15
	spriteface PLAYER, LEFT
	jump .appearMimikyu
.playerRight
	pause 15
	spriteface PLAYER, UP
	pause 15
	spriteface PLAYER, DOWN
	pause 15
	spriteface PLAYER, RIGHT
	jump .appearMimikyu

MimikyuText:
	text "Khuuuuu!"
	done
	
WreckedShipUnsunk_MapEventHeader::

.Warps: db 3
	warp_def 15, 18, 3, WRECKED_SHIP_UNSUNK
	warp_def 9, 4, 1, WRECKED_SHIP_UNSUNK
	warp_def 9, 5, 1, WRECKED_SHIP_UNSUNK

.CoordEvents: db 0

.BGEvents: db 1
	signpost 20, 16, SIGNPOST_ITEM, WreckedShipHiddenRareCandy

.ObjectEvents: db 3
	person_event SPRITE_POKE_BALL, 21, 34, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WreckedShipTMShadowBall, EVENT_WRECKED_SHIP_TM_SHADOW_BALL
	person_event SPRITE_MIMIKYU, 7, 18, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_YELLOW2, 0, 0, MimikyuScript, EVENT_TEMPORARY_1
	person_event SPRITE_PIKACHU, 7, 18, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_OW_YELLOW2, 0, 0, MimikyuScript, EVENT_MIMIKYU_FOUGHT

