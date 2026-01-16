extends CharacterBody2D

# variables
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var max_fall_speed = 900.0


@export var speed := 350.0
@export var start_speed := speed * 0.45
@export var acceleration := 1500.0
@export var friction := 2000.0

@export var jump_velocity := -450.0
@export var max_jumps = 2
@export var jump_count = 0

@export var particle_offset_amount = 90
# references
@onready var animated_sprite = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer
@onready var run_particles = $RunParticles
@onready var jump_particles = $JumpParticles

	


	
