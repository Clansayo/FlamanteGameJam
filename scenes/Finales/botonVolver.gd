extends TextureButton

func _ready() -> void:
	self.visible = false

func _on_dialogue_player_dialogue_ended() -> void:
	self.visible = true
