extends State

var timer = 0.0

func enter():
	player.dash_cooldown_timer.start()
	player.animated_sprite.play("dash")
	
	# remove gravity
	player.velocity.y = 0
	timer = player.dash_duration
	
	var direction = Input.get_axis("move_left", "move_right")
	# dash in direction sprite is facing
	if direction == 0:
		direction -1 if player.animated_sprite.flip_h else 1
	player.velocity.x = player.dash_strength * direction
	
	
func physics_update(delta: float):
	timer -= delta
	
	player.move_and_slide()
	
	if timer <= 0:
		state_machine.transition_to("air")
		
func exit():
	pass
