extends Control

@onready var dialogue_player: CanvasLayer = $DialoguePlayer
@onready var dialogue_area: DialogueArea = $DialogueArea
@onready var time_to_change_scene: Timer = $TimeToChangeScene
const MAIN_SCENE = "res://scenes/Main/MainScene.tscn"


func _ready() -> void:
	TranslationServer.set_locale("es")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		SignalBus.display_dialogue.emit(dialogue_area)


func _on_dialogue_player_dialogue_ended() -> void:
	dialogue_area.queue_free()
	dialogue_player.queue_free()
	time_to_change_scene.start()


func _on_time_to_change_scene_timeout() -> void:
		get_tree().change_scene_to_file(MAIN_SCENE)
