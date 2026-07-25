extends Button
class_name Option
@onready var title: Label = $MarginContainer/VBoxContainer/Title
@onready var cost: Label = $MarginContainer/VBoxContainer/Cost
signal option_selected(option: Option)


@export var option_key: String #optionkey es una variable que se pasa por el editor

var data : Dictionary 

func _ready():
	data = DataResources.options_data_map[option_key] #Los datos serán los que saque del mapa, que coincidan con su option_key
	title.text = data.title #El título será el que ela de los datos
	cost.text = "%d @" % data.cost #El coste ídem

func _on_pressed() -> void:
	option_selected.emit(self)
