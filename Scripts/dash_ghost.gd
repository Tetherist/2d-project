extends Sprite2D

func _ready():
	# setup tween
	var tween = create_tween()
	
	tween.tween_property(self, "modulate:a", 0.0, 0.4)
	
	tween.tween_callback(queue_free)
