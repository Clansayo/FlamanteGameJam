extends Control

@onready var creditos: CanvasLayer = $Creditos
@onready var canvas_layer: CanvasLayer = $CanvasLayer

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
	
func _on_creditos_pressed() -> void:
	creditos.visible = true	
	canvas_layer.visible = false

func _on_salir_creditos_pressed() -> void:
	creditos.visible = false	
	canvas_layer.visible = true

func _on_salir_pressed() -> void:
	get_tree().quit()

func _on_iniciar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Pantalla de inicio/Tiburon.tscn")
