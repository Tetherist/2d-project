extends State

func enter():
	pass
	
func physics_update(delta: float):
	# gravity
	player.velocity += player.get_gravity() * delta
	
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		player.velocity.x = direction * player.SPEED
		player.animated_sprite.flip_h = direction < 0
		
	player.move_and_slide()
	
	# transitions
	if player.is_on_floor():
		if direction == 0:
			state_machine.transition_to("idle")
		else:
			state_machine.transition_to("run")
