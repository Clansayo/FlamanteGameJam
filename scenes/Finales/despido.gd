extends Control
class_name ControlCinematica

@onready var dialogue_player: CanvasLayer = $DialoguePlayer
@onready var dialogue_area: DialogueArea = $DialogueArea
@onready var canvas_layer: CanvasLayer = $CanvasLayer

signal dialogue_ended

var is_enabled: bool = false

func _ready() -> void:
	TranslationServer.set_locale("es")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		SignalBus.display_dialogue.emit(dialogue_area)

func disable():
	is_enabled = false
	canvas_layer.visible = false
	dialogue_player.visible = false
	

func enable():
	is_enabled = true
	canvas_layer.visible = true
	dialogue_player.visible = true

func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Pantalla de inicio/pantalla de inicio.tscn")


func _on_dialogue_player_dialogue_ended() -> void:
	dialogue_ended.emit()
	
var blip_counter := 0
func _on_dialogue_player_letter_typed() -> void:
	if !is_enabled: return
	blip_counter += 1
	if blip_counter % 4 == 0:
		AudioManager.play_dialogue_blip(0.5)
