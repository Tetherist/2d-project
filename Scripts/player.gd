extends CharacterBody2D

# variables
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var SPEED = 400.0
@export var JUMP_VELOCITY = -400.0

# references
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	move_and_slide()

	


	
