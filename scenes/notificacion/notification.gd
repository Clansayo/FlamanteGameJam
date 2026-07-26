extends PanelContainer
class_name Notification

var data: Dictionary

var notification_key: String = "PLANET_NOTIFICATION_1"

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
	self.queue_free()
