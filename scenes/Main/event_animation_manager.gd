extends Node

const boss_intervall = [20, 40, 60, 80]
const boss_animations = ["Muy contento", "Vacaciones", "Idle", "Enfadao", "Muy enfadao"]
var current_boss_intervall_index: int
# Indices de [0, 4]
# Si está entre 0-20 es 0, 20-40 es 1....

const tux_intervall = [20, 40, 60, 80]
const tux_animations = ["default", "Regula", "Tux Busca Piso", "jodido en el metro", "Muerto"]
var current_tux_intervall_index: int

var timer_refresh_rate: Timer

@onready var tux_sprite: AnimatedSprite2D = $"../UI/TuxSprite"
@onready var ferran_sprite: AnimatedSprite2D = $"../UI/FerranSprite"

func _ready() -> void:
	timer_refresh_rate = Timer.new()
	timer_refresh_rate.wait_time = 1
	timer_refresh_rate.one_shot = false
	timer_refresh_rate.timeout.connect(refresh)
	self.add_child(timer_refresh_rate)
	
	timer_refresh_rate.start()
	
	current_boss_intervall_index = get_interval_index(boss_intervall, CurrencyManager.get_boss_points())
	print("FIRST CURRENT BOSS INTERVAL: %s" % current_boss_intervall_index)
	
	current_tux_intervall_index = get_interval_index(tux_intervall, CurrencyManager.get_earth_points())
	print("FIRST CURRENT TUX INTERVAL: %s" % current_tux_intervall_index)

func get_interval_index(interval: Array, value: int) -> int:
	var index: int = 0
	for e in interval:
		if value < e:
			return index
		index += 1
	return index

func refresh():
	current_boss_intervall_index = get_interval_index(boss_intervall, CurrencyManager.get_boss_points())
	current_tux_intervall_index = get_interval_index(tux_intervall, CurrencyManager.get_earth_points())
	
	ferran_sprite.play(boss_animations[current_boss_intervall_index])
	tux_sprite.play(tux_animations[current_tux_intervall_index])
	
	for option_button: Option in DataResources.decision_options_button_list:
		if CurrencyManager.get_emails_points() < option_button.data.cost:
			option_button.texture_normal = DataResources.BOTON_NO_DISPONIBLE_TEXTURE
		else:
			option_button.texture_normal = DataResources.BOTON_PRESIONADO_TEXTURE if option_button.is_active else DataResources.BOTON_NORMAL_TEXTURE
