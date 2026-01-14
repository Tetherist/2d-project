extends State

func enter():
	pass
	
func physics_update(delta: float):
	player.velocity += player.get_gravity() * delta
	
	player.move_and_slide()
	
	# transitions
	if player.is_on_floor():
		if player.velocity.x == 0:
			state_machine.transition_to("idle")
		else:
			state_machine.transition_to("run")
