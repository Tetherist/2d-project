extends CharacterBody2D
class_name Player

# variables
@onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var max_fall_speed = 900.0


@export var top_speed := 350.0
@export var start_speed := top_speed * 0.45
@export var acceleration := 1500.0
@export var friction := 2000.0

@export var jump_velocity := -450.0
@export var max_jumps = 2
@export var jump_count = 0

@export var dash_duration := 0.2
@export var dash_strength := 700

@export var particle_offset_amount = 90
# references
@onready var animated_sprite = $AnimatedSprite2D
@onready var coyote_timer = $CoyoteTimer
@onready var run_particles = $RunParticles
@onready var jump_particles = $JumpParticles
@onready var dash_cooldown_timer = $DashCooldownTimer

	


	
