extends Node

const song_change = 50
const song_1_intervals = [15,25,35]
const song_2_intervals = [60,70,80,90]

var current_song := -1
var current_interval := -1

var timer_refresh_rate: Timer

#Canciones
const NC_DRUMS = preload("uid://cdpp06himlxcu")
const NC_LEAD = preload("uid://bdbun5gl0f02b")
const NC_PAD = preload("uid://c3wc023y70w1d")
const NC_BASS = preload("uid://qp8lfef0gagj")


func _ready():
	timer_refresh_rate = Timer.new()
	timer_refresh_rate.wait_time = 1
	timer_refresh_rate.one_shot = false
	timer_refresh_rate.timeout.connect(refresh)
	add_child(timer_refresh_rate)

	timer_refresh_rate.start()

	refresh()

func get_interval_index(interval: Array, value: int) -> int:
	var index := 0
	for e in interval:
		if value < e:
			return index
		index += 1
	return index

func refresh():
	var earth = CurrencyManager.get_earth_points()
	
	var song = 1
	if earth > song_change:
		song = 2
		
	var interval: int
	if song == 1:
		interval = get_interval_index(song_1_intervals, earth)
	else:
		interval = get_interval_index(song_2_intervals, earth)
		
	if song != current_song:
		change_song(song)
		current_song = song
	
	if interval != current_interval:
		change_layers(song, interval)
		current_interval = interval
		
func change_song(song: int):
	AudioManager.play_song(song)
	
func change_layers(song:int, interval:int):
	print("Cancion: ", song, " Intervalo: ", interval) 
	AudioManager.set_music_state(song,interval)
