extends Node
class_name CurrencyManager

# Dollars
var dollar_float: float = 0
var dollar_int: int = 0
var dollar_modifier: float = 2

# Earth
var earth_points_float: float = 0
var earth_points_int: int = 0
var earth_points_modifier: float = 0

# Email
var emails_points_float: float = 0
var emails_points_int: int = 0
var emails_points_modifier: float = 0.1

## Los puntos aumentan con el tiempo usando delta time (dt) para que el ratio sea
## de x por segundo. Pero luego la variable real que almacena el valor es un int. 
## Entonces cuando el float está lo suficientemente lleno (umbral)
## vuelca su parte entera en el int
const UMBRAL: float = 100000000.0

func _process(delta: float) -> void:
	dollar_float += (dollar_modifier * delta)
	if dollar_float > UMBRAL:
		dollar_int += int(dollar_float)
		dollar_float -= int(dollar_float)
	
	earth_points_float += (earth_points_float * delta)
	if earth_points_float > UMBRAL:
		earth_points_int += int(earth_points_float)
		earth_points_float -= int(earth_points_float)
	
	emails_points_float += (emails_points_float * delta)
	if emails_points_float > UMBRAL:
		emails_points_int += int(emails_points_float)
		emails_points_float -= int(emails_points_float)

func add_dollars(x: int) -> void:
	dollar_int += x

func add_earth_points(x: int) -> void:
	earth_points_int += x

func add_email_points(x: int) -> void:
	emails_points_int += x

func get_dollar() -> int:
	return dollar_int + dollar_float

func get_earth_points() -> int:
	return earth_points_int + earth_points_float

func get_emails_points() -> int:
	return emails_points_int + emails_points_float
