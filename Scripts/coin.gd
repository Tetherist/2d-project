extends Area2D

@export var value = 1

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		SignalBus.on_coin_collected.emit(value)
		AudioManager.play_sfx("coin", 0.1)
		Globals.score += value
		queue_free()
