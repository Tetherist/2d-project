extends Area2D

@export var spike_dmg = 1

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		SignalBus.on_player_hit.emit(spike_dmg)
