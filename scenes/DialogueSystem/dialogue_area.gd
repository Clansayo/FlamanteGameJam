extends Area2D
class_name DialogueArea

@export var dialogue_key = ""
@export_range(0, 15) var dialogue_index: int
@export_range(-1, 15) var last_dialogue_index: int = -1
var area_active = false

@onready var first_dialogue_index: int = dialogue_index

func _input(event: InputEvent) -> void:
	if area_active && event.is_action_pressed("click"):
		SignalBus.display_dialogue.emit(self)

func _on_area_entered(area: Area2D) -> void:
	area_active = true
	print("ENTERED")

func _on_area_exited(area: Area2D) -> void:
	area_active = false
	print("EXITED")

func on_dialogue_ended() -> void:
	dialogue_index += 1
	print("###############_on_dialogue_ended############ ")
	if last_dialogue_index >= 0:
		if dialogue_index > last_dialogue_index:
			dialogue_index = first_dialogue_index
