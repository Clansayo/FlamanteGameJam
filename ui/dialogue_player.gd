extends CanvasLayer

@export_file("*.json") var scene_text_file: String
@export_range(1, 300) var speech_speed: int = 30
@export_range(1, 20) var speech_speed_multiplayer = 6

var scene_text: Dictionary = {}
var paged_text: PackedStringArray
var page_bbcode: String = ""
var speaker_name: String = ""
var in_progress = false
var is_writing = false
var skip_page = false

# Pagination:
var current_displayed_page: int = 0

var fixed_visible_char: float = 0

@export_range(2, 15) var lines_per_page: int = -1

@export var page_skip_sequence: String = "[NEXT_PAGE]"

@onready var background: TextureRect = $TextBox/Background
@onready var text_label: RichTextLabel = $TextBox/TextLabel
@onready var speaker_name_label: RichTextLabel = $TextBox/SpeakerName


var current_dialogue_area: DialogueArea

func _ready() -> void:
	text_label.text = ""
	speaker_name_label.text = ""
	await text_label.draw
	
	background.visible = false
	text_label.scroll_following_visible_characters
	scene_text = load_scene_text()
	SignalBus.display_dialogue.connect(on_display_dialogue)

func _process(delta: float) -> void:
	if in_progress and is_writing:
		fixed_visible_char += (speech_speed * delta * speech_speed_multiplayer) if skip_page else (speech_speed * delta)
		text_label.visible_characters = int(fixed_visible_char)
		if text_label.visible_characters >= text_label.get_parsed_text().length():
			is_writing = false
			skip_page = false
			print("end writing")

func paging(text: String, autopaging: bool = true) -> PackedStringArray:
	print("Starts paging")
	var pages: PackedStringArray = PackedStringArray()
	var end_char = text.length() - 1
	print("end char: ", end_char)
	var last_char = -1
	
	if !autopaging:
		for sub in text.split(page_skip_sequence):
			pages.append(sub)
		print("Pages sin autopaging:", pages)
		return pages
		
	while end_char >= last_char:
		text_label.text = text
		
		last_char = get_chars_in_page() - 1
		
		for sub in text.substr(0, last_char + 1).split(page_skip_sequence):
			if sub.length() > 0:
				pages.append(sub)
		text = text.substr(last_char + 1).strip_edges()
		end_char = text.length() - 1
	
	for sub in text.split(page_skip_sequence):
		if sub.length() > 0:
			pages.append(sub)
	
	print(pages)
	return pages

func strip_bbcode(txt: String) -> Array:
	txt = txt.strip_edges()
	if txt.length() < 1: return ["", ""]
	var i: int = 0
	var bbcode_start: String = ""
	var clean_text: String = ""
	
	while i < txt.length() and txt[i] == "[":
		while i < txt.length() and txt[i] != "]":
			bbcode_start += txt[i]
			i += 1
		bbcode_start += txt[i]
		i += 1

	clean_text = txt.substr(i)
	
	return [clean_text, bbcode_start]

func on_display_dialogue(dialogue_area: DialogueArea):
	var dialogue_key = dialogue_area.dialogue_key
	var dialogue_index = dialogue_area.dialogue_index
	current_dialogue_area = dialogue_area
	
	print("on_display_dialogue(%s, %s)" % [dialogue_key, dialogue_index])
	
	# Comprobaciones de seguridad
	if !scene_text.has(dialogue_key):
		print("ERROR: No existe esta dialogue_key: %s" % dialogue_key)
		return
	if dialogue_index >= scene_text[dialogue_key]["messeges"].size(): 
		print("ERROR: No existe este dialogue_index: %s" % dialogue_index)
		return

	if in_progress:
		if is_writing:
			skip_page = true
			return
		next_page()
	else:
		background.visible = true
		in_progress = true
		is_writing = true
		current_displayed_page = 0
		var text = tr(scene_text[dialogue_key]["messeges"].get(dialogue_index))
		speaker_name = tr(scene_text[dialogue_key].get("speaker", ""))

		print("Speaker: ", speaker_name)
		var strip_arr = strip_bbcode(text)
		page_bbcode = strip_arr[1]
		#print("Clean: <", strip_arr[0], ">\nBBcode: <", strip_arr[1], ">")
		paged_text = paging(strip_arr[0], scene_text[dialogue_key].get("autopaging", true))

		show_text()

func show_text():
	text_label.text = page_bbcode + paged_text.get(current_displayed_page)
	text_label.visible_characters = 0
	speaker_name_label.text = speaker_name

func next_page():
	text_label.visible_characters = 0
	fixed_visible_char = 0
	is_writing = true
	current_displayed_page += 1
	if current_displayed_page < paged_text.size():
		show_text()
	else:
		finish()

func finish():
	text_label.text = ""
	speaker_name_label.text = ""
	background.visible = false
	in_progress = false
	page_bbcode = ""
	current_dialogue_area.on_dialogue_ended()
	print("##### FINISH #######")

func load_scene_text() -> Variant: # variant porque puede devolver tanto un diccionario como una lista por el json
	var file = FileAccess.open(scene_text_file, FileAccess.READ)
	if file: # No es null
		return JSON.parse_string(file.get_as_text())
	return null

func get_line_length(line: int) -> int:
	var range: Vector2i = text_label.get_line_range(line)
	return range.y - range.x

func get_chars_in_page() -> int:
	var chars: int = -1
	for i in range(lines_per_page):
		chars += get_line_length(i) + 1
	return chars
