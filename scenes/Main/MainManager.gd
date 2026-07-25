extends Node

@onready var currency_manager: CurrencyManager = $CurrencyManager
@onready var label_dinero: Label = $UI/VBoxContainer/LabelDinero
@onready var label_emails: Label = $UI/VBoxContainer/LabelEmails
@onready var label_planeta: Label = $UI/VBoxContainer/LabelPlaneta
@onready var decision_container: VBoxContainer = $UI/VBoxContainer/DecisionContainer

const DECISION_SCENE = preload("res://scenes/Decision/decision.tscn")

var click_value: int = 1

func _ready() -> void:
	currency_manager.dollar_modifier = 1
	currency_manager.emails_points_modifier = 0

func _process(delta: float) -> void:
	label_dinero.text = "dinero: %s M$\n$/s: %s\n" % [currency_manager.get_dollar(), currency_manager.dollar_modifier]
	label_emails.text = "emails: %s\ne/s: %s\n" % [currency_manager.get_emails_points(), currency_manager.emails_points_modifier]
	label_planeta.text = "planet_points: %s\np/s: %s\n" % [currency_manager.get_earth_points(), currency_manager.earth_points_modifier]

func _on_teclado_pressed() -> void:
	currency_manager.add_email_points(click_value)
