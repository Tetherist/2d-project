extends State

func enter():
	AudioManager.play_sfx("jump_landing", 0.1)
	player.jump_count = 0
	
func physics_update(delta: float):
	# transitions

	if player.velocity.x == 0:
		state_machine.transition_to("idle")
	else:
		state_machine.transition_to("run")
