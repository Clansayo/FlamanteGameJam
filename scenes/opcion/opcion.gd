extends Button
class_name Option

@onready var title: Label = $VBoxContainer/Title
@onready var cost: Label = $VBoxContainer/Cost

signal option_selected(option: Option)
@onready var effect_description_timer: Timer = $effect_description_timer
@onready var effect_description_label: RichTextLabel = $EffectDescriptionLabel
@onready var v_box_container: VBoxContainer = $VBoxContainer

@export var option_key: String #optionkey es una variable que se pasa por el editor

var data : Dictionary 

func _ready():
	effect_description_label.visible = false
	data = DataResources.options_data_map[option_key] #Los datos serán los que saque del mapa, que coincidan con su option_key
	title.text = data.title #El título será el que ela de los datos
	cost.text = "%d @" % data.cost #El coste ídem
	
	effect_description_label.text = ""
	
	var effect: Dictionary = data.effect
	var points: int = 0
	const UMBRAL_MUY_MALO = 20
	if effect.has("add_dollars"):
		points = effect.add_dollars
		if points > 0:
			effect_description_label.text += "+%s M$\n" % effect.add_dollars
		else:
			effect_description_label.text += "%s M$\n" % effect.add_dollars
	if effect.has("add_email_points"):
		points = effect.add_email_points
		if points > 0:
			effect_description_label.text += "+%s @\n" % effect.add_dollars
		else:
			effect_description_label.text += "%s @\n" % effect.add_dollars
	if effect.has("add_earth_points"):
		points = effect.add_earth_points
		if points > UMBRAL_MUY_MALO:
			effect_description_label.text += "TERRIBLE para el medio ambiente\n"
		elif points > 0:
			effect_description_label.text += "Malillo para el medio ambiente\n"
		else:
			effect_description_label.text += "Bueno para el medio ambiente\n"
	if effect.has("add_boss_points"):
		points = effect.add_boss_points
		if points > UMBRAL_MUY_MALO:
			effect_description_label.text += "Al jefe no le mola nada esto\n"
		elif points > 0:
			effect_description_label.text += "Malillo para el medio ambiente\n"
		else:
			effect_description_label.text += "Bueno para el medio ambiente\n"
	
	if effect.has("add_dollars_modifier"):
		points = effect.add_dollars_modifier
		if points > 0:
			effect_description_label.text += "+%s M$/segundo\n" % effect.add_dollars
		else:
			effect_description_label.text += "%s M$/segundo\n" % effect.add_dollars

func _on_pressed() -> void:
	option_selected.emit(self)

func activate_option():
	self.modulate = Color(0.716, 0.0, 0.422, 1.0)

func deactivate_option():
	self.modulate = Color(1.0, 1.0, 1.0, 1.0)

func _on_effect_description_timer_timeout() -> void:
	effect_description_label.visible = true
	v_box_container.visible = false

func _on_mouse_entered() -> void:
	effect_description_timer.start()

func _on_mouse_exited() -> void:
	effect_description_timer.stop()
	effect_description_label.visible = false
	v_box_container.visible = true
