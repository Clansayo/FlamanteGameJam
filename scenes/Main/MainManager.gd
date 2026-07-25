extends Node

@onready var label_dinero: Label = $UI/VBoxContainer/LabelDinero
@onready var label_emails: Label = $UI/VBoxContainer/LabelEmails
@onready var label_planeta: Label = $UI/VBoxContainer/LabelPlaneta
@onready var decision_container: VBoxContainer = $UI/DecisionContainer

const DECISION_SCENE = preload("res://scenes/Decision/decision.tscn")

var click_value: int = 1

func _ready() -> void:
	CurrencyManager.dollar_modifier = 1
	CurrencyManager.emails_points_modifier = 0
	CurrencyManager.add_email_points(1000)
	
	# Conectar la signal emitidas por las decisiones:
	for decision: Decision in decision_container.get_children():
		decision.option_selected_data.connect(_on_decision_selected)

func _process(delta: float) -> void:
	label_dinero.text = "dinero: %s M$\n$/s: %s\n" % [CurrencyManager.get_dollar(), CurrencyManager.dollar_modifier]
	label_emails.text = "emails: %s\ne/s: %s\n" % [CurrencyManager.get_emails_points(), CurrencyManager.emails_points_modifier]
	label_planeta.text = "planet_points: %s\np/s: %s\n" % [CurrencyManager.get_earth_points(), CurrencyManager.earth_points_modifier]

func _on_teclado_pressed() -> void:
	CurrencyManager.add_email_points(click_value)

func _on_decision_selected(data: Dictionary) -> void:
	print("Se ha seleccionado una decision con el siguiente efecto: %s" % data.effect)
	CurrencyManager.add_email_points(-data.cost)
	
	for effect_key: String in data.effect.keys():
		CurrencyManager.call(effect_key, data.effect[effect_key])
