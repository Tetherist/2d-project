extends State

func enter():
	player.animated_sprite.play("punch")
	await player.animated_sprite.animation_finished
	state_machine.transition_to("idle")
