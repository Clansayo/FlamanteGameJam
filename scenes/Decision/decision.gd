extends Control
class_name Decision

const OPTION_SCENE = preload("res://scenes/opcion/opcion.tscn") # Precargo la escena opcion
var active_option: Option = null

signal option_selected_data(data: Dictionary) # Declaro la señal de que se emitirá cuando pulse el boton, y que emite un diccionario

@onready var container: HBoxContainer = $HBoxContainer # container va a ser el hbox

@export var option_keys_list: PackedStringArray


func _ready():
	for esta_optionkey in option_keys_list : #Recorro el array (se lo he pasado por el editor)
		#print(esta_optionkey) ESTO ES PARA PRUEBAS
		var option: Option = OPTION_SCENE.instantiate() #Me creo una instancia de opcion
		option.option_key = esta_optionkey #Le paso que su optionkey será la de esta iteración de array

		option.option_selected.connect(on_option_press)
		
		container.add_child(option) #añado la opción como hijo al hbox

func on_option_press(option: Option):
	if option == active_option:
		print("Esta opción ya es la que está seleccionada (no se puede volver a comprar si ya está activa)")
		return
	
	if option.data.cost > CurrencyManager.get_emails_points():
		print("No tenemos lereles para comprar esta opcion")
		return
	
	# Asumimos que la hemos posido seleccionar
	option_selected_data.emit(option.data) #Que es emitir lo que tiene en su campo de efecto
	option.activate_option()
	
	# Si había ya una opcion seleccionada entonces la desactivamos
	if active_option:
		active_option.deactivate_option()
	
	active_option = option
