extends Node

# DEBUG
@onready var label_dinero: Label = $UI/VBoxContainer/LabelDinero
@onready var label_emails: Label = $UI/VBoxContainer/LabelEmails
@onready var label_planeta: Label = $UI/VBoxContainer/LabelPlaneta
###

@onready var dollars_label: RichTextLabel = $UI/DisplayCurrency/DollarsLabel
@onready var emails_label: RichTextLabel = $UI/DisplayCurrency/EmailsLabel

@onready var decision_container: VBoxContainer = $UI/ScrollContainer/DecisionContainer
@onready var generador_notificaciones: NotificationGenerator = $UI/GeneradorNotificaciones
@onready var ui: CanvasLayer = $UI

@onready var gusano_escena: ControlCinematica = $GusanoEscena
@onready var duracion_gusano_escena_timer: Timer = $DuracionGusanoEscenaTimer
@onready var event_animation_manager: Node = $EventAnimationManager
@onready var max_mails_generator: Control = $UI/MaxMailsGenerator

var click_value: int = 1
const MAX_MAILS = preload("uid://nhsg6lg5jj8q")

func _ready() -> void:
	gusano_escena.disable()
	
	CurrencyManager.add_dollars_modifier(1)
	CurrencyManager.add_earth_points_modifier(0.15)
	CurrencyManager.add_email_points_modifier(0)
	CurrencyManager.add_email_points(0)
	#AudioManager.play_song(1)
	
	# Conectar la signal emitidas por las decisiones:
	for decision: Decision in decision_container.get_children():
		decision.option_selected_data.connect(_on_decision_selected)
		decision.option_deselected_data.connect(_on_decision_deselected)
	
	event_animation_manager.refresh()

func _process(delta: float) -> void:
	label_dinero.text = "dinero: %s M$\n$/s: %s\n" % [CurrencyManager.get_dollar(), CurrencyManager.get_dollar_modifier()]
	label_emails.text = "emails: %s\ne/s: %s\n" % [CurrencyManager.get_emails_points(), CurrencyManager.get_email_points_modifier()]
	label_planeta.text = "earth_points: %s\np/s: %s\n" % [CurrencyManager.get_earth_points(), CurrencyManager.get_earth_points_modifier()]
	
	dollars_label.text = "dinero: %s M$\t$/s: %s\t" % [CurrencyManager.get_dollar(), CurrencyManager.get_dollar_modifier()]
	emails_label.text = "emails: %s\te/s: %s\t" % [CurrencyManager.get_emails_points(), CurrencyManager.get_email_points_modifier()]

func _on_teclado_pressed() -> void:
	CurrencyManager.add_email_points(click_value)
	AudioManager.play_keyboard_click()
	
	var max_mail_new = MAX_MAILS.instantiate()
	max_mails_generator.add_child(max_mail_new)
	max_mail_new.global_position = max_mails_generator.global_position + Vector2(randf_range(-10, 10), randf_range(-10, 10))

func _on_decision_selected(data: Dictionary) -> void:
	print("Se ha seleccionado una decision con el siguiente efecto: %s" % data.effect)
	CurrencyManager.add_email_points(-data.cost)
	for effect_key: String in data.effect.keys():
		CurrencyManager.call(effect_key, data.effect[effect_key])

func _on_decision_deselected(data: Dictionary) -> void:
	print("Se ha deseleccionado una decision por lo que va a eliminarse sus modificadores dentro del siguiente efecto: %s" % data.effect)	
	for effect_key: String in data.effect.keys():
		if effect_key.ends_with("modifier"):
			CurrencyManager.call(effect_key, -data.effect[effect_key])


func _on_event_notification_manager_trigger_notification(notification_key: String) -> void:
	print("TRIGGER DE: %s" % notification_key)
	generador_notificaciones.generate(notification_key)


func _on_duracion_gusano_escena_timer_timeout() -> void:
	gusano_escena.disable()
	ui.visible = true


func _on_event_animation_manager_liberen_al_gusano() -> void:
	gusano_escena.enable()
	ui.visible = false


func _on_gusano_escena_dialogue_ended() -> void:
	duracion_gusano_escena_timer.start()
