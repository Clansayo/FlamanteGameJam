extends Control

const OPTION_SCENE = preload("res://scenes/opcion/opcion.tscn") #Precargo la escena opcion
@onready var container: HBoxContainer = $HBoxContainer #container va a ser el hbox
@export var option_keys : Array[String]

func _ready() :
	for esta_optionkey in option_keys : #Recorro el array (se lo he pasado por el editor)
		#print(esta_optionkey) ESTO ES PARA PRUEBAS
		var option = OPTION_SCENE.instantiate() #Me creo una opcion
		option.option_key = esta_optionkey #Le paso que su optionkey será la de esta iteración de array
		container.add_child(option) #Se la añado como hijo al hbox
		
