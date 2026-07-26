extends Node

const KEYBOARD_CLICKS = [
	preload("res://globals/AudioManager/SFX/CLick1.mp3"),
	preload("res://globals/AudioManager/SFX/CLick2.mp3"),
	preload("res://globals/AudioManager/SFX/CLick3.mp3"),
	preload("res://globals/AudioManager/SFX/CLick5.mp3"),
]

const UI_CLICK = preload("res://globals/AudioManager/SFX/UIClick2.mp3")
const F_CLICK = preload("res://globals/AudioManager/SFX/ClickF.mp3")
const MAIN_THEME = preload("res://globals/AudioManager/Music/Prueba_1.ogg")

@onready var keyboard_player: AudioStreamPlayer = $KeyboardPlayer
@onready var ui_player: AudioStreamPlayer = $UIPlayer
@onready var music_player: AudioStreamPlayer = $MusicPlayer


var keyboard_playback: AudioStreamPlaybackPolyphonic

func _ready():
	keyboard_player.play()
	keyboard_playback = keyboard_player.get_stream_playback()

func play_keyboard_click():
	keyboard_playback.play_stream(KEYBOARD_CLICKS.pick_random())
func play_ui_click():
	ui_player.stream = UI_CLICK
	ui_player.play()
func play_ui_f_click():
	ui_player.volume_db = -12
	ui_player.stream = F_CLICK
	ui_player.play()
func play_music():
	music_player.stream = MAIN_THEME
	music_player.play()
