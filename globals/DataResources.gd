extends Node
## Esta clase es un singleton global que contiene los archivos de datos json cargados
## a diccionarios.

const DATA_PATH: String = "gameData/"

var options_data_map: Dictionary
var notifications_data_map: Dictionary

func _ready() -> void:
	print("**** LOADING GAME DATA FILES ****")
	options_data_map = FileManager.load_json(DATA_PATH + "opciones.json")
	notifications_data_map = FileManager.load_json(DATA_PATH + "notifications.json")
