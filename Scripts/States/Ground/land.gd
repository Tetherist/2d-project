extends State

func enter():
	player.animated_sprite.play("land")
	player.jump_count = 0
	
func physics_update(delta: float):
	# transitions

	if player.velocity.x == 0:
		state_machine.transition_to("idle")
	else:
		state_machine.transition_to("run")
