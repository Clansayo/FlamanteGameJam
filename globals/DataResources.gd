extends Node
## Esta clase es un singleton global que contiene los archivos de datos json cargados
## a diccionarios.

const DATA_PATH: String = "gameData/"

var options_data_map: Dictionary
var notifications_data_map: Dictionary

const BOTON_NO_DISPONIBLE_TEXTURE = preload("uid://d03swvk63a4kc")
const BOTON_PRESIONADO_TEXTURE = preload("uid://c5f2u3himp0gi")
const BOTON_NORMAL_TEXTURE = preload("uid://bsxqvc5whho57")

## Array de referencias a cada uno de los botones de la clase Opcion
var decision_options_button_list: Array = []

func _ready() -> void:
	print("**** LOADING GAME DATA FILES ****")
	options_data_map = FileManager.load_json(DATA_PATH + "opciones.json")
	notifications_data_map = FileManager.load_json(DATA_PATH + "notifications.json")
