extends CharacterBody2D

# variables
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

# references
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	move_and_slide()

	


	
