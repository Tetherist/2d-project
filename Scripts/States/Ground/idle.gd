extends State

func enter():
	player.animated_sprite.play("idle")

func _physics_process(delta: float):
	player.velocity.x = 0
	# transition
	
	if not player.is_on_floor():
		state_machine.transition_to("air")
	elif Input.is_action_just_pressed("jump"):
		state_machine.transition_to("jump")
	elif Input.get_axis("move_left", "move_right") != 0:
		state_machine.transition_to("run")
		
