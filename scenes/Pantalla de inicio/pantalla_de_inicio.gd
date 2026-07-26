extends Control

@onready var creditos: CanvasLayer = $Creditos
@onready var canvas_layer: CanvasLayer = $CanvasLayer
var start_size = 1
var end_size = 1.04

func _ready() -> void:
	AudioManager.stop_music()
	AudioManager.play_song(1)
	AudioManager.set_layer(AudioManager.nc_drums, false)

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


func _on_salir_mouse_entered() -> void:
	var tween: Tween = create_tween()
	tween.tween_property($CanvasLayer/Salir,"scale", Vector2(end_size, end_size), 0.4)
	tween.set_trans(Tween.TRANS_BOUNCE)
	
func _on_salir_mouse_exited() -> void:
	var tween: Tween = create_tween()
	tween.tween_property($CanvasLayer/Salir,"scale", Vector2(start_size, start_size), 0.4)
	tween.set_trans(Tween.TRANS_BOUNCE)

func _on_creditos_mouse_entered() -> void:
	var tween: Tween = create_tween()
	tween.tween_property($CanvasLayer/Creditos,"scale", Vector2(end_size, end_size), 0.4)
	tween.set_trans(Tween.TRANS_BOUNCE)
	
func _on_creditos_mouse_exited() -> void:
	var tween: Tween = create_tween()
	tween.tween_property($CanvasLayer/Creditos,"scale", Vector2(start_size, start_size), 0.4)
	tween.set_trans(Tween.TRANS_BOUNCE)
	
func _on_iniciar_mouse_entered() -> void:
	var tween: Tween = create_tween()
	tween.tween_property($CanvasLayer/Iniciar,"scale", Vector2(end_size, end_size), 0.4)
	tween.set_trans(Tween.TRANS_BOUNCE)

func _on_iniciar_mouse_exited() -> void:
	var tween: Tween = create_tween()
	tween.tween_property($CanvasLayer/Iniciar,"scale", Vector2(start_size, start_size), 0.4)
	tween.set_trans(Tween.TRANS_BOUNCE)
