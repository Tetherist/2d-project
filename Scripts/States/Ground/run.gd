extends State

func enter():
	player.animated_sprite.play("run")
	
func physics_update(delta: float):
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		player.velocity.x = direction * player.SPEED
		player.animated_sprite.flip_h = direction < 0
	
	player.move_and_slide()
	
	# transitions
	if not player.is_on_floor():
		state_machine.transition_to("Air")
	elif Input.is_action_just_pressed("jump"):
		state_machine.transition_to("jump")
	elif direction == 0:
		state_machine.transition_to("idle")
