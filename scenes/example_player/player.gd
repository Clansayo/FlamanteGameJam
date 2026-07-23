extends CharacterBody2D

@export var speed: float = 400

func _physics_process(delta: float) -> void:
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_direction.length_squared() == 0: return
	#print(input_direction)
	self.velocity = input_direction * speed
	
	move_and_slide()
