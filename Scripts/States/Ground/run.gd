extends State

func enter():
	player.animated_sprite.play("run")
	
func physics_update(delta: float):
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction != 0:
		player.velocity.x = direction * player.SPEED
		player.animated_sprite.flip_h = direction < 0
	
	player.move_and_slide()
	
	# transition
	if !Input.is_action_pressed("move_left") and !Input.is_action_pressed("move_right"):
		state_machine.transition_to("idle")
