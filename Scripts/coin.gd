extends Area2D

@export var value = 1

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		SignalBus.on_coin_collected.emit(value)
		Globals.score += value
		queue_free()
