extends Button


func _on_mouse_entered() -> void:
	var animaciao: Tween= create_tween()
	animaciao.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	animaciao.tween_property(self,"size", Vector2(850,250), 1)
	
	print("hellow")

func _on_mouse_exited() -> void:
	var animaciao: Tween= create_tween()
	animaciao.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
	animaciao.tween_property(self,"size", Vector2(800,200), 1)
