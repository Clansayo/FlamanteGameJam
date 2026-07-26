extends PanelContainer
class_name Notification

var data: Dictionary

var notification_key: String = "PLANET_NOTIFICATION_1"
var start_size = 1
var end_size = 1.04

@onready var quit_button: Button = $QuitButton
@onready var title: Label = $MarginContainer/Title
@onready var content_label: RichTextLabel = $MarginContainer/VBoxContainer/MarginContainer/ContentLabel
@onready var image: TextureRect = $MarginContainer/VBoxContainer/Image
@onready var background: TextureRect = $Background

const IMAGE_BASE_PATH = "res://resources/sprites/Notificaciones/"
var path_tipo: String



func load_data() -> void:
	data = DataResources.notifications_data_map[notification_key]
	if data.type == "boss":
		title.text = "Nota del Jefe"
		path_tipo = "Jefe/"
		background.texture = DataResources.FONDO_NOTI_JEFE
		title.add_theme_color_override("font_color", Color.WHITE)
		content_label.add_theme_color_override("default_color", Color.WHITE)
	else:
		title.text = "Últimas Noticias"
		path_tipo = "Naturaleza/"
		background.texture = DataResources.FONDO_NOTI_NATURALEZA
		title.add_theme_color_override("font_color", Color.BLACK)
		content_label.add_theme_color_override("default_color", Color.BLACK)

	content_label.text = data.message

	if data.has("image"):
		print("Path: %s" % IMAGE_BASE_PATH + path_tipo + data.image)
		image.texture = load(IMAGE_BASE_PATH + path_tipo + data.image)


func _on_quit_button_pressed() -> void:
	self.visible = false
	AudioManager.play_discard_notification()
	self.queue_free()
	



func _on_mouse_entered() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self,"scale", Vector2(end_size, end_size), 0.4)
	tween.set_trans(Tween.TRANS_BOUNCE)
	

func _on_mouse_exited() -> void:
	var tween: Tween = create_tween()
	tween.tween_property(self,"scale", Vector2(start_size, start_size), 0.4)
	tween.set_trans(Tween.TRANS_BOUNCE)
