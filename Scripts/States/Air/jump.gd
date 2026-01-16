extends State

func enter():
	# move player up
	player.velocity.y = player.jump_velocity
	player.jump_count += 1
	print(player.jump_count)
	player.animated_sprite.play("jump_start")
	state_machine.transition_to("Air")
