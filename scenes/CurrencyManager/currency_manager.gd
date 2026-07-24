extends Node
class_name CurrencyManager

# Dollars
var dollar_float: float = 0
var dollar_int: int = 0
var dollar_modifier: float = 1 # Segundo

# Earth
var earth_points: float = 0
var earth_points_modifier: float = 0 # Segundo

# Email
var emails_points: float = 0
var emails_points_modifier: float = 0.1 # Segundo


func _process(delta: float) -> void:
	dollar_float += (dollar_modifier * delta)
	if dollar_float > 10.0:
		dollar_int += int(dollar_float)
		dollar_float -= int(dollar_float)

func get_dollar() -> int:
	return dollar_int + dollar_float
