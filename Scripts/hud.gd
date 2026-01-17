extends CanvasLayer

@onready var dash_bar = $TextureProgressBar

var cooldown_timer : Timer

func _ready():
	var player = get_tree().get_first_node_in_group("Player")
	
	if player:
		cooldown_timer = player.dash_cooldown_timer

func _process(delta):
	if cooldown_timer:
		
		# Calculate percentage (0.0 to 1.0)
		var ratio = 0.0
		
		if not cooldown_timer.is_stopped():
			# (1.0 - remaining / total) means it starts empty and fills up
			ratio = 1.0 - (cooldown_timer.time_left / cooldown_timer.wait_time)
		else:
			# if stopped we are fully ready
			ratio = 1.0
			
		dash_bar.value = ratio * 100
