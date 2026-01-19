extends Node

# we'll preload it so that there is no lag when using sounds for the first time
var sounds = {
	# MUSIC FILES
	"bgm": preload("res://Audio/bgm.mp3"),
	
	# SFX FILES
	"coin": preload("res://Audio/coin.mp3"),
	"jump_takeoff": preload("res://Audio/jump_takeoff.mp3"),
	"jump_landing": preload("res://Audio/jump_landing.mp3"),
	"footstep": preload("res://Audio/footstep.mp3")
}

# we'll store audiostreamplayer in a var so we can loop and fade music.
var music_player = AudioStreamPlayer.new()


func _ready():
	# setup
	add_child(music_player)
	music_player.bus = "Music"	

# MUSIC
func play_music(key: String, volume_db: float = 0.0):
	# return if key is not in dict
	if not sounds.has(key):
		return
	
	# get the sound
	var stream = sounds[key]
	
	# don't restart the song if it's already playing	
	if music_player.stream == stream and music_player.playing:
		return
		
	music_player.volume_db = volume_db

	music_player.stream = stream
	music_player.play()

# SFX
func play_sfx(key: String, pitch_range: float = 0.0, volume_db: float = 0.0):
	# return if key is not in dict
	if not sounds.has(key):
		return
		
	var sfx_player = AudioStreamPlayer.new()
	add_child(sfx_player)
	
	sfx_player.stream = sounds[key]
	sfx_player.bus = "SFX"
	
	sfx_player.volume_db = volume_db
	
	if pitch_range > 0:
		var random_pitch = randf_range(1.0 - pitch_range, 1.0 + pitch_range)
		sfx_player.pitch_scale = random_pitch
		
	sfx_player.play()
	
	await sfx_player.finished
	sfx_player.queue_free()
