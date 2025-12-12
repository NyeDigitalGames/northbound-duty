extends Control

@onready var background: TextureRect = $Background
@onready var speaker_label: Label = $Dialog/VBoxContainer/Speaker/SpeakerLabel
@onready var north_button: Button = $Dialog/VBoxContainer/Spacer/NorthButton
@onready var dialog_container: PanelContainer = $Dialog/VBoxContainer/MarginContainer/DialogContainer
@onready var next_button: Button = $Dialog/VBoxContainer/MarginContainer/DialogContainer/Dialog/NextButton
@onready var v_box_choices: VBoxContainer = $Dialog/VBoxContainer/Choices/VBoxChoices
@onready var choice_1: Button = $Dialog/VBoxContainer/Choices/VBoxChoices/Choice1
@onready var choice_2: Button = $Dialog/VBoxContainer/Choices/VBoxChoices/Choice2
@onready var choice_3: Button = $Dialog/VBoxContainer/Choices/VBoxChoices/Choice3

@export var encounters : Array[Node]

func _ready() -> void:
	speaker_label.text = ''
	north_button.visible=false
	dialog_container.visible=false
	v_box_choices.visible=false
	GameManager.reset_values()
	start_game()
	
func start_game() -> void:
	for i in encounters.size():
		encounters[i].run()
		await encounters[i].dialog_done
	
