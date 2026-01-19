extends State

var dash_duration_timer = 0.0

# preload ghost of player scene
var ghost_scene = preload("res://Scenes/dash_ghost.tscn")
var ghost_timer = 0.0
var ghost_interval = 0.04 # lower = smoother, higher = less copies

func enter():
	player.dash_cooldown_timer.start()
	player.animated_sprite.play("dash")
	AudioManager.play_sfx("dash")
	
	# remove gravity
	player.velocity.y = 0
	dash_duration_timer = player.dash_duration
	
	var direction = Input.get_axis("move_left", "move_right")
	# dash in direction sprite is facing
	if direction == 0:
		direction = -1 if player.animated_sprite.flip_h else 1
	player.velocity.x = player.dash_strength * direction
	
	
func physics_update(delta: float):
	# subtract time from the timer
	dash_duration_timer -= delta
	
	player.move_and_slide()
	
	# spawn ghost player every interval
	ghost_timer -= delta
	if ghost_timer <= 0:
		ghost_timer = ghost_interval
		spawn_ghost()
	
	# switch to air cuz if on the ground, the air state transitions to the ground states anyway
	if dash_duration_timer <= 0:
		state_machine.transition_to("air")
		
func exit():
	pass
	
func spawn_ghost():
	var ghost = ghost_scene.instantiate()
	get_tree().current_scene.add_child(ghost)
	
	# copy position of player
	ghost.global_position = player.global_position
	
	# copy scale cuz player has a scale of 0.35
	ghost.scale = player.scale
	
	# copy animated_sprite frame
	var sprite = player.animated_sprite
	ghost.texture = sprite.sprite_frames.get_frame_texture(sprite.animation, sprite.frame)
	
	# copy flip
	ghost.flip_h = sprite.flip_h
	
	# set the ghost to a semi-transparent blue
	ghost.modulate = Color(0.5, 0.8, 1.0, 0.6)
