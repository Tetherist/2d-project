extends State

func enter():
	player.animated_sprite.play("run")
	player.run_particles.emitting = true

func exit():
	player.run_particles.emitting = false

var last_frame = -1

func physics_update(delta: float):
	# gravity (in case we create slopes)
	player.velocity.y += player.gravity * delta
	
	var direction = Input.get_axis("move_left", "move_right")

	# move player horizontally 
	if direction != 0:
		player.run_particles.emitting = true
		# flip sprite
		player.animated_sprite.flip_h = direction < 0
		player.run_particles.direction.x = -direction 
		
		player.run_particles.position.x = -direction * player.particle_offset_amount
		
		if abs(player.velocity.x) < player.start_speed or sign(player.velocity.x) != direction:
			
			# snap velocity to 50% of max speed when first accelerating to make it feel less icy
			player.velocity.x = direction * player.start_speed
		else:
			# accelerate toward full speed
			player.velocity.x = move_toward(player.velocity.x, direction * player.top_speed, player.acceleration * delta)
	
	player.move_and_slide()
	
	
	# footstep sound effect
	var current_frame = player.animated_sprite.frame
	
	if current_frame != last_frame:
		if current_frame == 1 or current_frame == 5:
			AudioManager.play_sfx("footstep", 0.2, -12.0)
	last_frame = current_frame
	
	
	# transitions
	if not player.is_on_floor():
		state_machine.transition_to("Air")
	elif Input.is_action_just_pressed("jump"):
		state_machine.transition_to("jump")
	elif direction == 0:
		state_machine.transition_to("idle")
	elif Input.is_action_just_pressed("dash") and player.dash_cooldown_timer.is_stopped():
		state_machine.transition_to("dash")
	elif Input.is_action_just_pressed("punch"):
		state_machine.transition_to("punch")
