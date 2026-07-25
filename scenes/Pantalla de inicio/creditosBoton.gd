extends TextureButton
@onready var canvas_creditos: CanvasLayer = $Creditos

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_pressed() -> void:
	canvas_creditos.visible = true	
