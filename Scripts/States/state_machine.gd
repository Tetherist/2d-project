class_name StateMachine
extends Node

@export var initial_state : State

var current_state : State
var states : Dictionary = {}

func _ready():
	await owner.ready
	
	# store node in dictionary if it's a state
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			
			# connect child to state machine and the player
			child.state_machine = self
			child.player = owner
	
	# first state
	if initial_state:
		initial_state.enter()
		current_state = initial_state

# bridge functions from this to the states
func _process(delta):
	if current_state:
		current_state.update(delta)
		
func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

# transitioning of states
func transition_to(target_state_name: String):
		# check if state exists
		var key = target_state_name.to_lower()
		if not states.has(key):
			return
		
		if current_state:
			current_state.exit()
			
		# swap
		current_state = states[key]
		
		# start new state
		current_state.enter()
