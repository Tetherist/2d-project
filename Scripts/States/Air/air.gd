extends State

func enter():
	# if rising
	if player.velocity.y < 0:
		player.animated_sprite.play("rising")
	# if falling
	elif player.velocity.y > 0:
		player.animated_sprite.play("falling")
	
	if player.velocity.y > 0:
		player.coyote_timer.start()
	
func physics_update(delta: float):
	
	if Input.is_action_just_pressed("jump"):
		if not player.coyote_timer.is_stopped():
			state_machine.transition_to("jump")
		elif player.jump_count < player.max_jumps:
			state_machine.transition_to("jump")
	
	var current_gravity = player.gravity

	# variable jump height
	if player.velocity.y < 0 and not Input.is_action_pressed("jump"):
		current_gravity *= 2.2
	
	# if player going down, increase gravity
	if player.velocity.y > 0:
		current_gravity *= 2.0
	
	# gravity
	player.velocity.y += current_gravity * delta
	
	
	
	# horizontal movement in the air
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		player.velocity.x = move_toward(player.velocity.x, direction * player.speed, player.acceleration * delta)
		player.animated_sprite.flip_h = direction < 0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0.0, player.friction * delta)
		
	player.move_and_slide()
	
	# transitions
	if player.is_on_floor():
		if direction == 0:
			state_machine.transition_to("idle")
		else:
			state_machine.transition_to("run")
