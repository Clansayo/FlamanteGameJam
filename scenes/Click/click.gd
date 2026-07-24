extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pivot_offset = size/2
	

func _on_mouse_entered() -> void:
	var teclado: Tween= create_tween()
	teclado.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SPRING)
	teclado.tween_property(self,"scale", Vector2(1.05, 1.05), 1)
	
	print("hellow")
	
func _on_mouse_exited() -> void:
	var teclado: Tween= create_tween()
	teclado.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SPRING)
	teclado.tween_property(self,"scale", Vector2(1, 1), 1)

func _on_button_down() -> void:
	var teclado: Tween= create_tween()
	teclado.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	teclado.tween_property(self,"scale", Vector2(0.96, 0.96), 0.7)


func _on_button_up() -> void:
	var teclado: Tween= create_tween()
	teclado.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	teclado.tween_property(self,"scale", Vector2(1.05, 1.05), 0.7)
