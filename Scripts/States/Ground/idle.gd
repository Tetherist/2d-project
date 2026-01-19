extends State

func enter():
	player.animated_sprite.play("idle")

func physics_update(delta: float):
	player.velocity.x = move_toward(player.velocity.x, 0, player.friction * delta)
	
	player.move_and_slide()
	
	# transitions
	if not player.is_on_floor():
		state_machine.transition_to("air")
	elif Input.is_action_just_pressed("jump"):
		state_machine.transition_to("jump")
	elif Input.get_axis("move_left", "move_right") != 0:
		state_machine.transition_to("run")
	elif Input.is_action_just_pressed("dash") and player.dash_cooldown_timer.is_stopped():
		state_machine.transition_to("dash")
	elif Input.is_action_just_pressed("punch"):
		state_machine.transition_to("punch")
		
