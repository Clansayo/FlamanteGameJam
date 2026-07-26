extends PanelContainer

var data: Dictionary

@export var notification_key: String

@onready var title: Label = $MarginContainer/Title
@onready var content_label: RichTextLabel = $MarginContainer/VBoxContainer/MarginContainer/ContentLabel
@onready var image: TextureRect = $MarginContainer/VBoxContainer/Image

const IMAGE_BASE_PATH = "res://resources/sprites/Notificaciones/"
var path_tipo: String

func _ready() -> void:
	data = DataResources.notifications_data_map[notification_key]
	if data.type == "boss":
		title.text = "Nota del Jefe"
		path_tipo = "Jefe/"
	else:
		title.text = "Últimas Noticias"
		path_tipo = "Naturaleza/"

	content_label.text = data.message

	if data.has("image"):
		print("Path: %s" % IMAGE_BASE_PATH + path_tipo + data.image)
		image.texture = load(IMAGE_BASE_PATH + path_tipo + data.image)
	
