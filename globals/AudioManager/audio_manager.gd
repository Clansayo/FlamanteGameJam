extends Node

const KEYBOARD_CLICKS = [
	preload("res://globals/AudioManager/SFX/CLick1.mp3"),
	preload("res://globals/AudioManager/SFX/CLick2.mp3"),
	preload("res://globals/AudioManager/SFX/CLick3.mp3"),
	preload("res://globals/AudioManager/SFX/CLick5.mp3"),
]

const UI_CLICK = preload("res://globals/AudioManager/SFX/UIClick2.mp3")

@onready var keyboard_player: AudioStreamPlayer = $KeyboardPlayer
@onready var ui_player: AudioStreamPlayer = $UIPlayer


var keyboard_playback: AudioStreamPlaybackPolyphonic

func _ready():
	keyboard_player.play()
	keyboard_playback = keyboard_player.get_stream_playback()

func play_keyboard_click():
	keyboard_playback.play_stream(KEYBOARD_CLICKS.pick_random())
func play_ui_click():
	ui_player.stream = UI_CLICK
	ui_player.play()
