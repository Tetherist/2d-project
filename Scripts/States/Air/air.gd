extends State

func enter():
	# if rising
	if player.velocity.y < 0:
		player.animated_sprite.play("rising")
	# if falling
	elif player.velocity.y > 0:
		player.animated_sprite.play("falling")
		player.coyote_timer.start()
	
		
	
func physics_update(delta: float):
	if Input.is_action_just_pressed("jump"):
		# if coyote timer not over, allow player to jump
		if not player.coyote_timer.is_stopped():
			state_machine.transition_to("jump")
		# double jump
		elif player.jump_count < player.max_jumps:
			if player.jump_count == 0:
				player.jump_count = 1
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
	
	if player.velocity.y > 0:
		player.animated_sprite.play("falling")
		# clamp player's fall speed when going down at high speeds
		player.velocity.y = min(player.velocity.y, player.max_fall_speed)
	else:
		player.animated_sprite.play("rising")
	
	# horizontal movement in the air
	var direction = Input.get_axis("move_left", "move_right")
	if direction != 0:
		player.velocity.x = move_toward(player.velocity.x, direction * player.top_speed, player.acceleration * delta)
		player.animated_sprite.flip_h = direction < 0
	else:
		player.velocity.x = move_toward(player.velocity.x, 0.0, player.friction * delta)
		
	player.move_and_slide()
	
	# transitions
	if player.is_on_floor():
		state_machine.transition_to("land")
	elif Input.is_action_just_pressed("dash") and player.dash_cooldown_timer.is_stopped():
		state_machine.transition_to("dash")
