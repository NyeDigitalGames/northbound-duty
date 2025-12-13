extends Control

@onready var dialog: Label = $Dialog/VBoxContainer/MarginContainer/DialogContainer/Dialog
@onready var next_button: Button = $Dialog/VBoxContainer/MarginContainer/NextButton
@onready var timer: Timer = $Timer

@export var opening_text : Array[String]
@export var text_speed : float = 0.02

var text_length : int = 0
var text_in_progress : bool = false

func _ready() -> void:
	# Play menu music
	if AudioManager:
		AudioManager.play_music()

	dialog.text = ''
	next_button.visible=false
	run()
	
func run() -> void:
	timer.timeout.connect(_on_timer_timeout)
	for line in opening_text:
		dialog.visible_characters=0
		set_dialog_text(line)
		await get_tree().create_timer(4.0).timeout
		
	next_button.visible=true
	next_button.pressed.connect (start_game)
	
func start_game() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func set_dialog_text ( _d : String) -> void:
	dialog.text = _d
	dialog.visible_characters=0
	text_length = dialog.get_total_character_count()
	text_in_progress = true
	start_timer()
	pass

func start_timer()->void:
	timer.wait_time = text_speed
	var _char = dialog.visible_characters -1
	timer.start()
	pass
	
func _on_timer_timeout() -> void:
	dialog.visible_characters += 1
	if dialog.visible_characters <= text_length:
		start_timer()
	else:
		text_in_progress = false
	pass
