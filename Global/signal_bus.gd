extends Node

# PLAYER
signal on_health_changed(current_hp: int, max_hp: int)

# COLLECTIBLES
signal on_coin_collected(total_coins: int)
