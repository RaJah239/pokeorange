GetLandmarkCoords: ; 0x1ca896
; Return coordinates (d, e) of landmark e.

;erase underwater/surf bitflags
	ld a, e
	and LANDMARK_MASK
	ld e, a
	

	push hl
	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, 0
	add hl, de
	ld de, Landmarks
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ret
; 0x1ca8a5


GetLandmarkName:: ; 0x1ca8a5
; Copy the name of landmark e to StringBuffer1.
	push hl
	push de
	push bc

	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, 0
	add hl, de
	ld de, Landmarks + 3
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld de, StringBuffer1
	ld c, 18
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy

	pop bc
	pop de
	pop hl
	ret
; 0x1ca8c3

GetLandmarkFishGroup: ; 0x1ca896
; Return fishgroup of landmark e in d

;erase underwater/surf bitflags
	ld a, e
	and LANDMARK_MASK
	ld e, a

	ld l, e
	ld h, 0
	add hl, hl
	add hl, hl
	ld d, 0
	add hl, de
	ld de, Landmarks + 2
	add hl, de
	ld d, [hl]
	ret

Landmarks: ; 0x1ca8c3

landmark: MACRO
	db \1, \2, \3	; Xcoord, Ycoord, Fishgroup
	dw \4		 	; Name pointer
ENDM

	landmark    0,    0, FISHGROUP_NONE, SpecialMapName
	landmark   52,  140, FISHGROUP_OCEAN, ValenciaIslandName
	landmark   44,  132, FISHGROUP_SHORE, Route49Name
	landmark   28,  132, FISHGROUP_SHORE, TangeloIslandName
	landmark   20,  128, FISHGROUP_SHORE, Route50Name
	landmark   28,  124, FISHGROUP_SHORE, Route51Name
	landmark   20,  124, FISHGROUP_POND, TangeloJungleName
	landmark   28,  112, FISHGROUP_SHORE, Route52Name
	landmark   28,  100, FISHGROUP_POND, MikanIslandName
	landmark   40,  92,  FISHGROUP_SHORE, Route53Name
	landmark   52,  84,  FISHGROUP_SHORE, Route54Name
	landmark   52,  76,  FISHGROUP_SHORE, MandarinNorthName
	landmark   52,  100, FISHGROUP_SHORE, SunburstIslandName
	landmark   56,  116, FISHGROUP_SHORE, Route55Name
	landmark   52,  110, FISHGROUP_POND, CrystalCaveName
	landmark   72,  120, FISHGROUP_NONE, PinkanIslandName
	landmark   92,  124, FISHGROUP_SHORE, Route56Name
	landmark   108, 124, FISHGROUP_POND, Fukuhara4Name
	landmark   116, 108, FISHGROUP_SHORE, KinnowIslandName
	landmark   136,  96, FISHGROUP_SHORE, Route57Name
	landmark   136,  80, FISHGROUP_SHORE, UnnamedIsland1Name
	landmark   148,  76, FISHGROUP_SHORE, Route58Name
	landmark   156,  76, FISHGROUP_SHORE, NavelIslandName
	landmark   158,  74, FISHGROUP_NONE, MtNavelName
	landmark   148, 100, FISHGROUP_SHORE, GrapefruitName
	landmark   148, 108, FISHGROUP_SHORE, Route59Name
	landmark   148, 116, FISHGROUP_SHORE, MoroIslandName
	landmark   140, 124, FISHGROUP_SHORE, Route60Name
	landmark   142, 118, FISHGROUP_SHORE, WreckedShipName
	landmark   128, 128, FISHGROUP_SHORE, GoldenIslandName
	landmark   124, 140, FISHGROUP_OCEAN, Route61Name
	landmark   140, 148, FISHGROUP_POND, MurcottIslandName
	landmark   124, 156, FISHGROUP_CONTEST, UnnamedIsland2Name
	landmark   104, 144, FISHGROUP_OCEAN, Route62Name
	landmark   96,  144, FISHGROUP_SHORE, MandarinDesertName
	landmark   84,  140, FISHGROUP_SEWER, TrovitopolisName
	landmark   76,  148, FISHGROUP_SHORE, TrovitaIslandName
	landmark   128,  56, FISHGROUP_SHORE, CleopatraIslandName
	landmark   152,  52, FISHGROUP_SHORE, Route63Name
	landmark   164,  36, FISHGROUP_SHORE, AscorbiaIslandName
	landmark   152,  32, FISHGROUP_SHORE, Route64Name
	landmark   148,  36, FISHGROUP_SHORE, Route65Name
	landmark   136,  32, FISHGROUP_POND, ButwalIslandName
	landmark   112,  32, FISHGROUP_OCEAN, Route66Name
	landmark   108,  52, FISHGROUP_SHORE, KumquatIslandName
	landmark   82,   60, FISHGROUP_OCEAN, Route67Name
	landmark   60,   60, FISHGROUP_RIND, RindIslandName
	landmark   44,   60, FISHGROUP_OCEAN, Route68Name
	landmark   24,   56, FISHGROUP_POND, UnnamedIsland3Name
	landmark   20,   36, FISHGROUP_OCEAN, Route69Name
	landmark   28,   36, FISHGROUP_POND, VictoryRoadName
	landmark   36,   36, FISHGROUP_SHORE, PummeloIslandName
	landmark   52,   36, FISHGROUP_OCEAN, Route70Name
	landmark   64,   32, FISHGROUP_SHORE, TarrocoIslandName
	landmark   76,   36, FISHGROUP_OCEAN, Route71Name
	landmark   92,   36, FISHGROUP_NONE, HamlinIslandName ;Not accessible in normal gameplay, hence the FISHGROUP_NONE even if it is not in the mapheader
	landmark   96,   36, FISHGROUP_NONE, HamlinFieldsName ;Not accessible in normal gameplay, hence the FISHGROUP_NONE even if it is not in the mapheader
	landmark   92,   84, FISHGROUP_SHORE, ShamoutiIslandName
	landmark   84,   92, FISHGROUP_SHORE, FireIslandName
	landmark   100,  92, FISHGROUP_SHORE, IceIslandName
	landmark   108,  84, FISHGROUP_SHORE, LightningIslandName

	landmark   116,   28, FISHGROUP_NONE, VermilionCityName
	landmark   138,   28, FISHGROUP_NONE, Route11Name
	landmark   156,   36, FISHGROUP_NONE, Route12Name
	landmark   148,   44, FISHGROUP_NONE, Route13Name
	landmark   140,   52, FISHGROUP_NONE, Route14Name
	landmark   132,   60, FISHGROUP_NONE, Route15Name
	landmark   116,   60, FISHGROUP_NONE, FuchsiaCityName
	landmark   116,   58, FISHGROUP_NONE, SafariZoneName
	landmark   116,   72, FISHGROUP_NONE, Route19Name
	landmark   92,   76, FISHGROUP_NONE, Route20Name
	landmark   84,   76, FISHGROUP_NONE, SeafoamIslandsName
	landmark   60,   76, FISHGROUP_NONE, CinnabarIslandName
	landmark   62,   74, FISHGROUP_NONE, CinnabarVolcanoName
	landmark   60,   64, FISHGROUP_NONE, Route21Name
	landmark   60,   52, FISHGROUP_NONE, PalletTownName
	landmark   42,   68, FISHGROUP_NONE, CinnabarSeaName
	landmark   20,   60, FISHGROUP_NONE, SaydaIslandName
	landmark   84,   64, FISHGROUP_NONE, KantoSea1Name
	landmark   92,   52, FISHGROUP_NONE, CamomileIslandName
	landmark   100,   36, FISHGROUP_NONE, VermilionSeaName
	landmark   100,   92, FISHGROUP_NONE, KantoSea2Name
	landmark   84,   92, FISHGROUP_NONE, ChrysanthemumName
	landmark   100,   116, FISHGROUP_NONE, MetallicaIslandName
	landmark   116,   92, FISHGROUP_NONE, KantoSea3Name
	landmark   132,   92, FISHGROUP_NONE, WisteriaTownName
	landmark   124,   116, FISHGROUP_NONE, HutberCityName
	landmark   132,   128, FISHGROUP_NONE, PortaVistaName
	landmark   116,   132, FISHGROUP_NONE, AcapulcoTownName
	landmark   36,   116, FISHGROUP_NONE, NewIslandName
	landmark   68,   140, FISHGROUP_NONE, RainbowIslandName
	landmark 148, 132, FISHGROUP_NONE, FastShipName


ValenciaIslandName:  db "VALENCIA ISLAND@"
Route49Name:         db "ROUTE 49@"
TangeloIslandName:   db "TANGELO ISLAND@"
Route50Name:         db "ROUTE 50@"
Route51Name:         db "ROUTE 51@"
TangeloJungleName:   db "TANGELO JUNGLE@"
Route52Name:         db "ROUTE 52@"
MikanIslandName:     db "MIKAN ISLAND@"
Route53Name:         db "ROUTE 53@"
Route54Name:         db "ROUTE 54@"
MandarinNorthName:   db "MANDARIN NORTH@"
SunburstIslandName:  db "SUNBURST ISLAND@"
Route55Name:         db "ROUTE 55@"
CrystalCaveName:     db "CRYSTAL CAVE@"
PinkanIslandName:    db "PINKAN ISLAND@"
Route56Name:         db "ROUTE 56@"
Fukuhara4Name:       db "FUKUHARA №.4@"
KinnowIslandName:    db "KINNOW ISLAND@"
Route57Name:         db "ROUTE 57@"
UnnamedIsland1Name:  db "UNNAMED ISLAND@"
Route58Name:         db "ROUTE 58@"
NavelIslandName:     db "NAVEL ISLAND@"
MtNavelName:         db "MT.NAVEL@"
GrapefruitName:      db "7 GRAPEFRUITS@"
Route59Name:         db "ROUTE 59@"
MoroIslandName:      db "MORO ISLAND@"
Route60Name:         db "ROUTE 60@"
WreckedShipName:     db "WRECKED SHIP@"
GoldenIslandName:    db "GOLDEN ISLAND@"
Route61Name:         db "ROUTE 61@"
MurcottIslandName:   db "MURCOTT ISLAND@"
UnnamedIsland2Name:  db "UNNAMED ISLAND@"
Route62Name:         db "ROUTE 62@"
MandarinDesertName:  db "MANDARIN DESERT@"
TrovitopolisName:    db "TROVITOPOLIS@"
TrovitaIslandName:   db "TROVITA ISLAND@"
CleopatraIslandName: db "CLEOPATRA ISLAND@"
Route63Name:         db "ROUTE 63@"
AscorbiaIslandName:  db "ASCORBIA ISLAND@"
Route64Name:         db "ROUTE 64@"
Route65Name:         db "ROUTE 65@"
ButwalIslandName:    db "BUTWAL ISLAND@"
Route66Name:         db "ROUTE 66@"
KumquatIslandName:   db "KUMQUAT ISLAND@"
Route67Name:         db "ROUTE 67@"
RindIslandName:      db "RIND ISLAND@"
Route68Name:         db "ROUTE 68@"
UnnamedIsland3Name:  db "UNNAMED ISLAND@"
Route69Name:         db "ROUTE 69@"
VictoryRoadName:     db "VICTORY ROAD@"
PummeloIslandName:   db "PUMMELO ISLAND@"
Route70Name:         db "ROUTE 70@"
TarrocoIslandName:   db "TARROCO ISLAND@"
Route71Name:         db "ROUTE 71@"
HamlinIslandName:    db "HAMLIN ISLAND@"
HamlinFieldsName:    db "HAMLIN FIELDS@"
ShamoutiIslandName:  db "SHAMOUTI ISLAND@"
FireIslandName:      db "FIRE ISLAND@"
IceIslandName:       db "ICE ISLAND@"
LightningIslandName: db "LIGHTNING ISLAND@"

; Kanto
VermilionCityName:   db "VERMILION CITY@"
Route11Name:         db "ROUTE 11@"
Route12Name:         db "ROUTE 12@"
Route13Name:         db "ROUTE 13@"
Route14Name:         db "ROUTE 14@"
Route15Name:         db "ROUTE 15@"
FuchsiaCityName:     db "FUCHSIA CITY@"
SafariZoneName:		 db "SAFARI ZONE@"
Route19Name:         db "ROUTE 19@"
Route20Name:         db "ROUTE 20@"
SeafoamIslandsName:  db "SEAFOAM ISLANDS@"
CinnabarIslandName:  db "CINNABAR ISLAND@"
CinnabarVolcanoName: db "CINNABAR VOLCANO@"
Route21Name:         db "ROUTE 21@"
PalletTownName:      db "PALLET TOWN@"
CinnabarSeaName:     db "CINNABAR SEA@"
SaydaIslandName:     db "SAYDA ISLAND@"
KantoSea1Name:       db "KANTO SEA@"
CamomileIslandName:  db "CAMOMILE ISLAND@"
VermilionSeaName:    db "VERMILION SEA@"
KantoSea2Name:       db "KANTO SEA@"
ChrysanthemumName:   db "CHRYSANTHEMUM@"
MetallicaIslandName: db "METALLICA ISLAND@"
KantoSea3Name:       db "KANTO SEA@"
WisteriaTownName:    db "WISTERIA TOWN@"
HutberCityName:      db "HUTBER CITY@"
PortaVistaName:      db "PORTA VISTA@"
AcapulcoTownName:    db "ACAPULCO TOWN@"
NewIslandName:       db "NEW ISLAND@"
RainbowIslandName:   db "RAINBOW ISLAND@"

SpecialMapName:      db "SPECIAL@"
FastShipName:        db "FAST SHIP@"

RegionCheck: ; 0x1caea1
; Checks if the player is in Kanto or Johto.
; If in Johto, returns 0 in e.
; If in Kanto, returns 1 in e.
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp FAST_SHIP ; S.S. Aqua
	jr z, .johto
	cp SPECIAL_MAP
	jr nz, .checkagain

; In a special map, get the backup map group / map id
	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a
	call GetWorldMapLocation

.checkagain
	cp KANTO_LANDMARK
	jr c, .johto

; Victory Road area is considered to be Johto.
	cp VALENCIA_ISLAND
	jr c, .kanto

.johto
	ld e, 0
	ret
.kanto
	ld e, 1
	ret
