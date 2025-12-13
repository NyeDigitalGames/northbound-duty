extends Control

@onready var end_title: Label = $"Dialog/VBoxContainer/End Title Card/VBoxContainer/End Title"
@onready var ending_number: Label = $"Dialog/VBoxContainer/End Title Card/VBoxContainer/EndingNumber"
@onready var replay_button: Button = $Dialog/VBoxContainer/Spacer/ReplayButton

func _ready() -> void:
	# Play menu music
	if AudioManager:
		AudioManager.play_music()


	end_title.text = GameManager.end_title
	ending_number.text = 'Ending '+str(GameManager.ending_number)+' of 4'
	replay_button.pressed.connect (replay)
	
func replay() -> void:
	get_tree().change_scene_to_file("res://opening_screen.tscn")
