extends Control

@onready var label: Label = $Label
@onready var currency_manager: CurrencyManager = $CurrencyManager
@onready var label_2: Label = $Label2
@onready var timer: Timer = $Timer
@onready var label_3_time: Label = $Label3Time

func _process(delta: float) -> void:
	label.text = "dollars: %s" % currency_manager.get_dollar()
	label_2.text = str(currency_manager.dollar_float)
	label_3_time.text = "timer: %s" % [int(2000 - timer.time_left)]
