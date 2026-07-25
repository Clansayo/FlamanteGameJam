extends Button
@onready var title: Label = $MarginContainer/VBoxContainer/Title
@onready var cost: Label = $MarginContainer/VBoxContainer/Cost


@export var option_key: String #optionkey es una variable que se pasa por el editor

var data : Dictionary 

func _ready():
	data = DataResources.options_data_map[option_key] #Los datos serán los que saque del mapa, que coincidan con su option_key
	print ("Datos:")
	print(data)
	title.text = data.title #El título será el que ela de los datos
	cost.text = str(data.cost) + " @s" #El coste ídem
