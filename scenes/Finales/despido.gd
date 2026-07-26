extends Control

@onready var dialogue_player: CanvasLayer = $DialoguePlayer
@onready var dialogue_area: DialogueArea = $DialogueArea

func _ready() -> void:
	TranslationServer.set_locale("es")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		SignalBus.display_dialogue.emit(dialogue_area)




func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Pantalla de inicio/pantalla de inicio.tscn")
