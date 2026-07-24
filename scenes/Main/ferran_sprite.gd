extends AnimatedSprite2D

var escala = 0.31
var escala2 = 0.232

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

func _on_area_2d_mouse_entered() -> void:
	var teclado: Tween= create_tween()
	teclado.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	teclado.tween_property(self,"scale", Vector2(escala, escala), 1)
	

func _on_area_2d_mouse_exited() -> void:
	var teclado: Tween= create_tween()
	teclado.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	teclado.tween_property(self,"scale", Vector2(escala2, escala2), 1)
