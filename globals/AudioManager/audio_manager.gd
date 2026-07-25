extends Node

const KEYBOARD_CLICKS = [
	preload("res://globals/AudioManager/SFX/CLick1.mp3"),
	preload("res://globals/AudioManager/SFX/CLick2.mp3"),
	preload("res://globals/AudioManager/SFX/CLick3.mp3"),
	preload("res://globals/AudioManager/SFX/CLick4.mp3"),
	preload("res://globals/AudioManager/SFX/CLick5.mp3"),
]
@onready var keyboard_player: AudioStreamPlayer = $KeyboardPlayer

func play_keyboard_click() :
	keyboard_player.stream = KEYBOARD_CLICKS.pick_random()
	keyboard_player.play()
