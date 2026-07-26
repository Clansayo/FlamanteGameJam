extends RefCounted
class_name Currency

var v_float: float = 0
var v_int: int = 0
var v_modifier: float = 0

const UMBRAL: float = 10000.0

func _init(initial_value: int) -> void:
	v_int = initial_value

func update(delta: float):
	v_float += (v_modifier * delta)
	if v_float > UMBRAL:
		v_int += int(v_float)
		v_float -= int(v_float)

func add(x: int) -> void:
	v_int += x

func sett(x: int) -> void:
	v_int = 0
	v_float = 0.0

func add_modifier(x: int) -> void:
	v_modifier += x

func get_total() -> int:
	return v_int + v_float
