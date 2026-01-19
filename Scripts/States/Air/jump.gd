extends State

func enter():
	# move player up
	player.velocity.y = player.jump_velocity
	AudioManager.play_sfx("jump_takeoff", 0.1)
	player.jump_count += 1
	player.animated_sprite.play("jump_start")
	player.jump_particles.emitting = true
	state_machine.transition_to("Air")
