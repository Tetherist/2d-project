extends State

func enter():
	player.animated_sprite.play("idle")

func _physics_process(delta: float):
	player.velocity.x = 0
	# transition
	if Input.is_action_just_pressed("move_left") or Input.is_action_just_pressed("move_right"):
		state_machine.transition_to("run")
		
