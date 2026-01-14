extends State

func enter():
	player.velocity.y = player.JUMP_VELOCITY
	player.animated_sprite.play("jump_start")
	state_machine.transition_to("Air")
