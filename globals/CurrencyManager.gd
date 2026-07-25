extends Node

var dollar: Currency = Currency.new(0)
var earth: Currency = Currency.new(0)
var email: Currency = Currency.new(0)
var boss: Currency = Currency.new(0)


## Los puntos aumentan con el tiempo usando delta time (dt) para que el ratio sea
## de x por segundo. Pero luego la variable real que almacena el valor es un int. 
## Entonces cuando el float está lo suficientemente lleno (umbral)
## vuelca su parte entera en el int
const UMBRAL: float = 100000000.0

func _process(delta: float) -> void:
	dollar.update(delta)
	earth.update(delta)
	email.update(delta)
	boss.update(delta)

func add_dollars(x: int) -> void:
	dollar.add(x)

func add_earth_points(x: int) -> void:
	earth.add(x)

func add_email_points(x: int) -> void:
	email.add(x)

func add_boss_points(x: int) -> void:
	boss.add(x)

func add_dollars_modifier(x: int) -> void:
	dollar.add_modifier(x)

func add_email_points_modifier(x: int) -> void:
	email.add_modifier(x)

func add_earth_points_modifier(x: int) -> void:
	earth.add_modifier(x)

func add_boss_points_modifier(x: int) -> void:
	boss.add_modifier(x)

func get_dollar() -> int:
	return dollar.get_total()

func get_earth_points() -> int:
	return earth.get_total()

func get_emails_points() -> int:
	return email.get_total()

func get_boss_points() -> int:
	return boss.get_total()

func get_dollar_modifier() -> float:
	return dollar.v_modifier

func get_earth_points_modifier() -> float:
	return earth.v_modifier

func get_email_points_modifier() -> float:
	return email.v_modifier

func get_boss_points_modifier() -> float:
	return boss.v_modifier
