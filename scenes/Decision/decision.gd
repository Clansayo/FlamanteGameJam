extends Control

const OPTION_SCENE = preload("res://scenes/opcion/opcion.tscn") #Precargo la escena opcion
@onready var container: HBoxContainer = $HBoxContainer #container va a ser el hbox
@export var option_keys : Array[String]
var active_option : int = -1

signal option_selected_effects(effect: Dictionary) #Declaro la señal de que se emitirá cuando pulse el boton, y que emite un diccionario

func on_option_press(option : Option):
	option_selected_effects.emit(option.data.effect) #Que es emitir lo que tiene en su campo de efecto

func _ready():
	for esta_optionkey in option_keys : #Recorro el array (se lo he pasado por el editor)
		#print(esta_optionkey) ESTO ES PARA PRUEBAS
		var option: Option = OPTION_SCENE.instantiate() #Me creo una instancia de opcion
		option.option_key = esta_optionkey #Le paso que su optionkey será la de esta iteración de array

		option.option_selected.connect(on_option_press)
		
		container.add_child(option) #añado la opción como hijo al hbox
		
