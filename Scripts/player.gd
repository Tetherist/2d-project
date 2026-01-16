extends CharacterBody2D

# variables
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var speed := 350.0
@export var acceleration := 1500.0
@export var friction := 2000.0

@export var jump_velocity := -450.0
@export var max_jumps = 2
@export var jump_count = 0


# references
@onready var animated_sprite = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer

	


	
