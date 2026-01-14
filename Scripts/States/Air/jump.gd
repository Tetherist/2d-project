extends State

func enter():
	player.velocity.y = player.JUMP_VELOCITY	
	state_machine.transition_to("Air")
