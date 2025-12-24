const_value = 1
	const PUMMELO_STADIUM_SPECTATOR1
	const PUMMELO_STADIUM_SPECTATOR2
	const PUMMELO_STADIUM_DRAKE
	const PUMMELO_STADIUM_ANNOUNCER
	const PUMMELO_STADIUM_OFFICER
	const PUMMELO_STADIUM_CISSY
	const PUMMELO_STADIUM_DANNY
	const PUMMELO_STADIUM_RUDY
	const PUMMELO_STADIUM_LUANA
	const PUMMELO_STADIUM_RED

PummeloStadium_MapScriptHeader:

.MapTriggers: db 0

.MapCallbacks: db 0

PummeloStadiumEntry:
	checkevent EVENT_BEAT_ORANGE_LEAGUE
	iftrue .DrakeGone
	opentext
	writetext PummeloStadiumEntryBadgeCheckText
	checkflag ENGINE_SPIKE_SHELL_BADGE
	iffalse .NoSpikeShell
	checkflag ENGINE_JADE_STAR_BADGE
	iffalse .NoJadeStar
	writetext PummeloStadiumBadgeCheckPassText
	waitbutton
	closetext
	disappear PUMMELO_STADIUM_DRAKE
	disappear PUMMELO_STADIUM_CISSY
	disappear PUMMELO_STADIUM_DANNY
	disappear PUMMELO_STADIUM_RUDY
	disappear PUMMELO_STADIUM_LUANA
	disappear PUMMELO_STADIUM_RED
	applymovement PUMMELO_STADIUM_OFFICER, StadiumOfficerMovement
	spriteface PUMMELO_STADIUM_OFFICER, RIGHT
	applymovement PLAYER, StadiumPlayerMovement1
	opentext
	writetext StadiumPlayerEnteringArenaText
	waitbutton
	closetext
	applymovement PLAYER, StadiumPlayerMovement2
	spriteface PLAYER, RIGHT
	appear PUMMELO_STADIUM_DRAKE
	applymovement PUMMELO_STADIUM_DRAKE, StadiumNPCEnter
	opentext
	writetext DrakeOpeningText
	waitbutton
	closetext
	winlosstext DrakePummeloWinLoss, 0
	loadtrainer DRAKE, 1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_INDIGO_PLATEAU
	opentext
	writetext AnnouncerWinnerText
	waitbutton
	clearevent EVENT_DRAKE_IN_HALL_OF_FAME
	clearevent EVENT_PUMMELO_ISLAND_DRAKE_GIFT
	special FadeOutPalettes
	pause 15
	setevent EVENT_BEAT_ORANGE_LEAGUE
	clearevent EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	clearevent EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT
	clearevent EVENT_MIMIKYU_FOUGHT
	clearevent EVENT_MANDARIN_CAVE_KECLEON_FOUGHT
	clearevent EVENT_RED_ON_CLEOPATRA
	writebyte 0 ; 0x00 to totally reset romaers (Pummelo Stadium), 0x01 to not reset shinyness (Player's House)
	special InitRoamMons ;init the Eon Duo, making them encounterable even if the player doesn't check the TV
	warpfacing UP, HALL_OF_FAME, 6, 11
	end

.DrakeGone:
	opentext
	writetext DrakeGoneText
	yesorno
	iftrue .PostGameStadiumBegin
	writetext DeclinePostStadiumText
	waitbutton
	closetext
	end

.PostGameStadiumBegin:

if def(DEBUG)
	callasm _asmDebugSkateBoardCheck
	;Uncomment to totally skip the gauntlet battles when the SKATEBOARD item is held by the first party Pokémon
	;iftrue .debugSkipGaunlet
endc
	closetext

	disappear PUMMELO_STADIUM_DRAKE
	disappear PUMMELO_STADIUM_CISSY
	disappear PUMMELO_STADIUM_DANNY
	disappear PUMMELO_STADIUM_RUDY
	disappear PUMMELO_STADIUM_LUANA
	disappear PUMMELO_STADIUM_RED

	applymovement PUMMELO_STADIUM_OFFICER, StadiumOfficerMovement
	spriteface PUMMELO_STADIUM_OFFICER, RIGHT
	applymovement PLAYER, StadiumPlayerMovement1
	opentext
	writetext StadiumPlayerEnteringArenaGaunletText
	waitbutton
	closetext
	applymovement PLAYER, StadiumPlayerMovement2
	spriteface PLAYER, RIGHT
	appear PUMMELO_STADIUM_CISSY
	applymovement PUMMELO_STADIUM_CISSY, StadiumNPCEnter

;Cissy battle
	opentext
	writetext CissyBattleText
	waitbutton
	closetext
	winlosstext CissyWinLoss, 0
	loadtrainer CISSY, 2
	startbattle
	playmapmusic
	reloadmapafterbattle

	applymovement PUMMELO_STADIUM_CISSY, StadiumNPCLeave
	disappear PUMMELO_STADIUM_CISSY
	pause 30
	appear PUMMELO_STADIUM_DANNY
	applymovement PUMMELO_STADIUM_DANNY, StadiumNPCEnter

;Danny battle
	opentext
	writetext DannyBattleText
	waitbutton
	closetext
	winlosstext DannyWinLoss, 0
	loadtrainer DANNY, 2
	startbattle
	playmapmusic
	reloadmapafterbattle

	applymovement PUMMELO_STADIUM_DANNY, StadiumNPCLeave
	disappear PUMMELO_STADIUM_DANNY
	pause 30
	appear PUMMELO_STADIUM_RUDY
	applymovement PUMMELO_STADIUM_RUDY, StadiumNPCEnter

;Rudy battle
	opentext
	writetext RudyBattleText
	waitbutton
	closetext
	winlosstext RudyWinLoss, 0
	loadtrainer RUDY, 2
	startbattle
	playmapmusic
	reloadmapafterbattle

	applymovement PUMMELO_STADIUM_RUDY, StadiumNPCLeave
	disappear PUMMELO_STADIUM_RUDY
	pause 30
	appear PUMMELO_STADIUM_LUANA
	applymovement PUMMELO_STADIUM_LUANA, StadiumNPCEnter

;Luana battle	
	opentext
	writetext LuanaBattleText
	waitbutton
	closetext
	winlosstext LuanaWinLoss, 0
	loadtrainer LUANA, 2
	startbattle
	playmapmusic
	reloadmapafterbattle

	applymovement PUMMELO_STADIUM_LUANA, StadiumNPCLeave
	disappear PUMMELO_STADIUM_LUANA
	pause 30
	appear PUMMELO_STADIUM_RED
	applymovement PUMMELO_STADIUM_RED, StadiumNPCEnter

;Red battle
	opentext
	writetext RedBattleText
	waitbutton
	writetext HealPartyText
	yesorno
	iffalse .skipHeal
	
	;Heal party
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special Special_FadeInQuickly
	;special RestartMapMusic
	
.skipHeal
	closetext
	blackoutmod PUMMELO_ISLAND
	winlosstext RedWinLoss, 0
	loadtrainer RED, 1
	startbattle
	playmapmusic
	reloadmapafterbattle
	
	opentext
	writetext RedWinLoss
	waitbutton
	closetext

	applymovement PUMMELO_STADIUM_RED, StadiumNPCLeave
	disappear PUMMELO_STADIUM_RED

	opentext
	writetext StadiumWonText1
	waitbutton
	closetext
	
	applymovement PUMMELO_STADIUM_ANNOUNCER, StadiumOfficerMovement2
	spriteface PLAYER, UP
	opentext

.debugSkipGaunlet
	verbosegiveitem MASTER_BALL
	writetext StadiumWonText2
	waitbutton
	closetext
	special FadeOutPalettes
	;reset static encounters
	clearevent EVENT_SEVEN_GRAPEFRUITS_SNORLAX
	clearevent EVENT_FUKUHARA_BF3_AERODACTYL_FOUGHT
	clearevent EVENT_MIMIKYU_FOUGHT
	
	;only clear these if the Shamouti events are finished
	checkevent EVENT_SHAMOUTI_QUEST_ENDED
	iffalse .skipShamouti
	clearevent EVENT_ZAPDOS_FOUGHT
	clearevent EVENT_ARTICUNO_FOUGHT
	clearevent EVENT_MOLTRES_FOUGHT
	clearevent EVENT_LUGIA_FOUGHT

.skipShamouti

	clearevent EVENT_MANDARIN_CAVE_KECLEON_FOUGHT
	clearevent EVENT_SUNRAY_CAVE_1F_MARSHADOW_FOUGHT
	clearevent EVENT_ROUTE51_HO_OH_FOUGHT
	clearevent EVENT_TANGELO_JUNGLE_MEW_FOUGHT
	clearevent EVENT_VICTORY_ROAD_MEWTWO_FOUGHT
	clearevent EVENT_TARROCO_CELEBI_FOUGHT
	clearevent EVENT_RED_ON_CLEOPATRA

;re-init the romaers (resets DVs and HP if not caught)
	writebyte 0 ; 0x00 to totally reset romaers (Pummelo Stadium), 0x01 to not reset shinyness (Player's House)
	special InitRoamMons ;reset the eon duo
	special HealParty
	halloffame
	end
	
.NoSpikeShell:
	opentext
	writetext PummeloStadiumNoSpikeShellText
	waitbutton
	closetext
	end
	
.NoJadeStar:
	opentext
	writetext PummeloStadiumNoJadeStarText
	waitbutton
	closetext
	end

if def(DEBUG)
	_asmDebugSkateBoardCheck:
		ld a, $1
		ld [ScriptVar], a
		ld a, [PartyMon1Item]
		cp SKATEBOARD
		ret z
		xor a
		ld [ScriptVar], a
		ret
endc
	

DrakeGoneText:
	text "Ah, CHAMPION!"
	
	para "If you're looking"
	line "for DRAKE. He left"
	cont "PUMMELO to train."
	cont "But if you are"
	cont "looking for a"
	cont "challenge, you've"
	cont "come to the right"
	cont "place!"
	
	para "Would you like to"
	line "face our island's"
	cont "strongest?"
	done

DeclinePostStadiumText:
	text "Well, these"
	line "trainers love"
	cont "battling, they"
	cont "will accept your"
	cont "challenge anytime."
	
	para "Please come back."
	done

CissyBattleText:
	text "Your first battle"
	line "will be against"
	cont "CISSY!"
	para "What? You expected"
	line "someone else?"
	para "Of course our"
	line "strongest trainers"
	cont "are the GYM"
	cont "LEADERS!"
	para "But don't be"
	line "fooled, they are"
	cont "far more powerful"
	cont "than when you"
	cont "faced them!"
	para "Now, let's beggin!"
	done

DannyBattleText:
	text "The second match"
	line "against DANNY will"
	cont "commence!"
	done

RudyBattleText:
	text "The third match"
	line "against RUDY will"
	cont "commence!"
	done

LuanaBattleText:
	text "The fourth battle"
	line "against LUANA will"
	cont "commence!"
	done

RedBattleText:
	text "Finally, we have a"
	line "new challenger for"
	cont "you, CHAMPION!"

	para "How will you fare"
	line "against KANTO's"
	cont "CHAMPION?"
	done

HealPartyText:
	text "Would you like to"
	line "heal your party?"
	done

CissyWinLoss:
	text "I gave it my best"
	line "shot!"
	done

DannyWinLoss:
	text "Wow, not bad at"
	line "all!"
	done

RudyWinLoss:
	text "Hmph."
	done

LuanaWinLoss:
	text "Can you do it?"
	done

RedWinLoss:
	text "..."
	done

StadiumWonText1:
	text "Great job!"
	line "We had no doubts"
	cont "that you would"
	cont "succeed."
	
	para "We would like"
	line "you to have this!"
	done

StadiumWonText2:
	text "Please come see"
	line "us again if you"
	cont "have the itch to"
	cont "battle, CHAMPION."
	done

PummeloStadiumNoSpikeShellText:
	text "Frankly, I'm"
	line "appalled."
	
	para "You seem to be"
	line "missing the SPIKE"
	cont "SHELL BADGE."
	
	para "RUDY of TROVITA"
	line "ISLAND has that."
	done

PummeloStadiumNoJadeStarText:
	text "Frankly, I'm"
	line "appalled."
	
	para "You seem to be"
	line "missing the JADE"
	cont "STAR BADGE."
	
	para "LUANA of KUMQUAT"
	line "ISLAND has that."
	done
	
PummeloStadiumEntryBadgeCheckText:
	text "Greetings. You"
	line "must be <PLAYER>."
	cont "DRAKE has been"
	cont "expecting you."
	
	para "First, let me see"
	line "your BADGES."
	
	para "<...>"
	
	para "<...>"
	
	para "<...>"
	done
	
PummeloStadiumBadgeCheckPassText:
	text "Excellent. Come"
	line "this way, DRAKE"
	cont "awaits."
	done
	
StadiumPlayerEnteringArenaText:
	text "ANNOUNCER: Ladies"
	line "and Gentlemen!"
	
	para "The fight you've"
	line "all been waiting"
	cont "for!"
	
	para "From the ISLAND of"
	line "VALENCIA, <PLAYER>!"
	
	para "Will they be able"
	line "to beat the un-"
	cont "defeated CHAMP,"
	cont "DRAKE?!"
	done

StadiumPlayerEnteringArenaGaunletText:
	text "ANNOUNCER: Ladies"
	line "and Gentlemen!"
	
	para "The fight you've"
	line "all been waiting"
	cont "for!"
	
	para "From the ISLAND of"
	line "VALENCIA, <PLAYER>!"
	
	para "Will they be able"
	line "to beat the best"
	cont "trainers of the"
	cont "ORANGE ISLANDS?"
	done
	
DrakeOpeningText:
	text "Welcome, <PLAYER>."
	line "I'm DRAKE, the top"
	cont "dog of the ORANGE"
	cont "CREW."
	
	para "You've done well"
	line "to come this far,"
	cont "but I'm not giving"
	cont "up my title so"
	
	para "easily!"
	done
	
DrakePummeloWinLoss:
	text "Impossible!"
	
	para "<...>"
	
	para "What am I sayin'?"
	line "<PLAYER>, I am"
	cont "beyond impressed."
	
	para "You've earned the"
	line "title of CHAMPION!"
	done
	
AnnouncerWinnerText:
	text "ANNOUNCER: WOW!"
	line "LADIES AND GENTS!"
	
	para "WE HAVE A NEW"
	line "CHAMP! <PLAYER>!"
	
	para "DRAKE: <PLAYER>."
	line "Follow me, it's"
	cont "now time to go"
	cont "to the HALL OF"
	
	para "FAME."
	done
	
StadiumOfficerMovement:
	step UP
	step LEFT
	step_end

StadiumOfficerMovement2:
	step LEFT
	step DOWN
	step_end
	
StadiumPlayerMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end
	
StadiumPlayerMovement2:
	step LEFT
	step UP
	step UP
	step UP
	step_end

StadiumNPCLeave:
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

StadiumNPCEnter:
	step LEFT
	step LEFT
	step LEFT
	step_end

PummeloStadium_MapEventHeader::

.Warps: db 2
	warp_def 19,  6, 3, PUMMELO_ISLAND
	warp_def 19,  7, 4, PUMMELO_ISLAND

.CoordEvents: db 0

.BGEvents: db 0

.ObjectEvents: db 10
	person_event SPRITE_SPECTATOR_1,  2,  6, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_SPECTATOR_1,  2,  9, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_DRAKE,  6, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_GYM_GUY,  4,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_OFFICER, 16,  7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, PummeloStadiumEntry, -1
	person_event SPRITE_CISSY,  6, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_DANNY,  6, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_RUDY,  6, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_LUANA,  6, 11, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
	person_event SPRITE_RED,  6, 11, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
