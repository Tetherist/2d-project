extends Node

# PLAYER
signal on_health_changed(current_hp: int, max_hp: int)
signal on_player_hit(damage_amount: int)
signal on_health_updated(current_health)

# COLLECTIBLES
signal on_coin_collected(total_coins: int)
