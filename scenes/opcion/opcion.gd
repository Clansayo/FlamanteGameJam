extends TextureButton
class_name Option


@onready var cost: Label = $MarginContainer/Cost
@onready var title_label: RichTextLabel = $TitleLabel

signal option_selected(option: Option)
@onready var effect_description_timer: Timer = $effect_description_timer
@onready var effect_description_label: RichTextLabel = $EffectDescriptionLabel

@export var option_key: String #optionkey es una variable que se pasa por el editor

var data : Dictionary 

func _ready():
	data = DataResources.options_data_map[option_key] #Los datos serán los que saque del mapa, que coincidan con su option_key
	title_label.text = data.title #El título será el que ela de los datos
	cost.text = "%d @" % data.cost #El coste ídem
	effect_description_label.visible = false

func _on_pressed() -> void:
	option_selected.emit(self)
	AudioManager.play_ui_click()

func activate_option():
	self.modulate = Color(0.716, 0.0, 0.422, 1.0)

func deactivate_option():
	self.modulate = Color(1.0, 1.0, 1.0, 1.0)

func _on_effect_description_timer_timeout() -> void:
	effect_description_label.visible = true
	title_label.visible = false
	cost.visible = false

func _on_mouse_entered() -> void:
	effect_description_timer.start()

func _on_mouse_exited() -> void:
	effect_description_timer.stop()
	effect_description_label.visible = false
	title_label.visible = true
	cost.visible = true
