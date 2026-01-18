extends Area2D

@export var spike_dmg = 10

func _on_body_entered(body: Node2D) -> void:
	# if player collision detected, emit on_player_hit signal
	if body is Player:
		SignalBus.on_player_hit.emit(spike_dmg)
