extends Node

const KEYBOARD_CLICKS = [
	preload("res://resources/SFX/CLick1.mp3"),
	preload("res://resources/SFX/CLick2.mp3"),
	preload("res://resources/SFX/CLick3.mp3"),
	preload("res://resources/SFX/CLick4.mp3"),
	preload("res://resources/SFX/CLick5.mp3"),
	
]

const UI_CLICK = preload("res://resources/SFX/UIClick2.mp3")
const F_CLICK = preload("res://resources/SFX/ClickF.mp3")
const MAIN_THEME = preload("res://resources/Music/NightCity/NCFull.ogg")
const DESCARTE = preload("uid://cct2itbtp061s")
const NOTIFICACION = preload("uid://cod665jok36a5")

@onready var keyboard_player: AudioStreamPlayer = $KeyboardPlayer
@onready var ui_player: AudioStreamPlayer = $UIPlayer

#Cancion 1
@onready var nc_drums: AudioStreamPlayer = $NC_Drums
@onready var nc_chords: AudioStreamPlayer = $NC_Chords
@onready var nc_bass: AudioStreamPlayer = $NC_Bass
@onready var nc_lead: AudioStreamPlayer = $NC_Lead
@onready var nc_pad: AudioStreamPlayer = $NC_Pad

#Cancion2
@onready var fa_chords: AudioStreamPlayer = $FA_Chords
@onready var fa_chords_2: AudioStreamPlayer = $FA_Chords2
@onready var fa_lead: AudioStreamPlayer = $FA_Lead
@onready var fa_coro: AudioStreamPlayer = $FA_Coro
@onready var fa_base: AudioStreamPlayer = $FA_Base


var keyboard_playback: AudioStreamPlaybackPolyphonic

func _ready():
	keyboard_player.play()
	keyboard_playback = keyboard_player.get_stream_playback()

func play_song(song: int):
	if song == 1:
		nc_drums.play()
		nc_chords.play()
		nc_bass.play()
		nc_lead.play()
		nc_pad.play()
	else:
		nc_drums.stop()
		nc_chords.stop()
		nc_bass.stop()
		nc_lead.stop()
		nc_pad.stop()
		fa_chords.play()
		fa_lead.play()
		fa_coro.play()
		fa_base.play()

func play_keyboard_click():
	keyboard_playback.play_stream(KEYBOARD_CLICKS.pick_random())
	
func play_ui_click():
	ui_player.stream = UI_CLICK
	ui_player.play()
	
func play_ui_f_click():
	ui_player.volume_db = -12
	ui_player.stream = F_CLICK
	ui_player.play()
	
func play_notification():
	ui_player.stream = NOTIFICACION
	ui_player.play()

func play_discard_notification():
	ui_player.stream = DESCARTE
	ui_player.play()
	
func set_layer(player: AudioStreamPlayer, enabled: bool):
	if enabled: 
		player.volume_db = 0 
	else:
		player.volume_db =	-80
		
func set_music_state(song: int, interval: int):
	if song == 1:
		set_layer(nc_drums, true)
		set_layer(nc_chords, true)
		set_layer(nc_bass, interval >= 1)
		set_layer(nc_pad, interval >= 2)
		set_layer(nc_lead, interval >= 3)

	elif song == 2:
		set_layer(fa_chords, true)
		set_layer(fa_base, interval >= 1)
		set_layer(fa_lead, interval >= 2)
		set_layer(fa_coro, interval >= 3)
