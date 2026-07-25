extends PanelContainer

var data: Dictionary

@export var notification_key: String

func _ready() -> void:
	data = DataResources.notifications_data_map[notification_key]
	print(data)
