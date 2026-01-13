extends CharacterBody2D

# variables
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

# references
@onready var sprite = $AnimatedSprite2D

# states
enum States {
	IDLE,
	RUNNING,
	JUMP,
	FALL
}

var current_state = States.IDLE

func _physics_process(delta: float) -> void:
	
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta

	# jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# horizontal movement
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# get state
	var next_state = pick_next_state()
	
	# change current_state to next_state only if next_state is a new state
	if next_state != current_state:
		current_state = next_state
		
	match current_state:
		States.IDLE:
			sprite.play("idle")
		States.RUNNING:
			sprite.play("run")
			
			if velocity.x < 0:
				sprite.flip_h = true
			elif velocity.x > 0:
				sprite.flip_h = false
	
func pick_next_state() -> int:
	# Priority order: 1. Jump, 2. Fall, 3. Run, 4. Idle
	if not is_on_floor():
		if velocity.y < 0:
			return States.JUMP
		else:
			return States.FALL
		
	if velocity.x != 0:
		return States.RUNNING
	
	return States.IDLE
	
