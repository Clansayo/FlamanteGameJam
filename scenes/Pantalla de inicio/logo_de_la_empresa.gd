extends Sprite2D

var x_start_position = 1368
var y_start_position = 254
var x_end_position = 1380
var y_end_position = 260

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self, "position", Vector2(x_end_position, y_end_position), 1)
	
