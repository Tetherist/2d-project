extends State

func enter():
	# if rising
	if player.velocity.y < 0:
		player.animated_sprite.play("rising")
	# if falling
	elif player.velocity.y > 0:
		player.animated_sprite.play("falling")
	
func physics_update(delta: float):
	var current_gravity = player.gravity

	# variable jump height
	if player.velocity.y < 0 and not Input.is_action_pressed("jump"):
		current_gravity *= 2.0
	
	# if player going down, increase gravity
	if player.velocity.y > 0:
		current_gravity *= 1.5
	
	# gravity
	player.velocity.y += current_gravity * delta
	
	
	
	# horizontal movement in the air
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
