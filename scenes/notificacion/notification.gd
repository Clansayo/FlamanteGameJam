extends PanelContainer

var data: Dictionary

@export var notification_key: String

@onready var title: Label = $MarginContainer/Title
@onready var content_label: RichTextLabel = $MarginContainer/VBoxContainer/MarginContainer/ContentLabel
@onready var image: TextureRect = $MarginContainer/VBoxContainer/Image

const IMAGE_BASE_PATH = "res://resources/notification_images/"

func _ready() -> void:
	data = DataResources.notifications_data_map[notification_key]
	title.text = "Nota del Jefe" if data.type == "boss" else "Últimas Noticias"
	content_label.text = data.message
	if data.has("image"):
		image.texture = load(IMAGE_BASE_PATH + data.image)
	
