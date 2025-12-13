extends Node

# Audio players
var music_player: AudioStreamPlayer
var sfx_player: AudioStreamPlayer

# Export variables for audio files (to be assigned in editor)
@export var background_music: AudioStream
@export var music_tracks: Array[AudioStream] = []  # Array of music tracks for selection

# Volume levels
var music_volume: float = 0.1
var sfx_volume: float = 0.8

# Music track selection
var current_track_index: int = 0

# Pitch variation settings
var pitch_variation_enabled: bool = true
var pitch_variation_range: float = 0.15  # ±15% pitch variation

func _ready():
	# Create audio players
	music_player = AudioStreamPlayer.new()
	music_player.name = "MusicPlayer"
	add_child(music_player)
	
	sfx_player = AudioStreamPlayer.new()
	sfx_player.name = "SFXPlayer"
	add_child(sfx_player)
	
	# Apply initial volumes
	update_volumes()

func play_music(stream: AudioStream = null):
	# Don't restart if music is already playing
	if music_player.playing:
		return
	
	if stream:
		music_player.stream = stream
	elif music_tracks.size() > 0:
		# Use selected track from array
		music_player.stream = music_tracks[current_track_index]
	elif background_music:
		music_player.stream = background_music
	
	if music_player.stream:
		music_player.play()

func stop_music():
	music_player.stop()

func play_sfx(stream: AudioStream, pitch_variation: bool = true):
	if stream:
		sfx_player.stream = stream
		
		# Apply random pitch variation if enabled
		if pitch_variation and pitch_variation_enabled:
			var pitch_offset = randf_range(-pitch_variation_range, pitch_variation_range)
			sfx_player.pitch_scale = 1.0 + pitch_offset
		else:
			sfx_player.pitch_scale = 1.0
		
		sfx_player.play()

func set_music_volume(volume: float):
	music_volume = clamp(volume, 0.0, 1.0)
	update_volumes()

func set_sfx_volume(volume: float):
	sfx_volume = clamp(volume, 0.0, 1.0)
	update_volumes()

func update_volumes():
	# Convert linear volume to decibels
	if music_volume > 0:
		music_player.volume_db = linear_to_db(music_volume)
	else:
		music_player.volume_db = -80  # Mute
	
	if sfx_volume > 0:
		sfx_player.volume_db = linear_to_db(sfx_volume)
	else:
		sfx_player.volume_db = -80  # Mute

func next_track():
	"""Cycle to the next music track"""
	if music_tracks.size() == 0:
		return
	
	current_track_index = (current_track_index + 1) % music_tracks.size()
	# Stop current music and play the new track
	music_player.stop()
	play_music()

func get_current_track_name() -> String:
	"""Get the name of the currently selected track"""
	if music_tracks.size() == 0:
		return "No Tracks"
	
	var track = music_tracks[current_track_index]
	if track:
		# Get filename without extension
		var path = track.resource_path
		var filename = path.get_file().get_basename()
		return filename
	
	return "Track " + str(current_track_index + 1)
