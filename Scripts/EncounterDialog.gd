class_name EncounterDialog extends Node

signal dialog_done

@onready var speaker: PanelContainer = $"../Dialog/VBoxContainer/Speaker"
@onready var speaker_label: Label = $"../Dialog/VBoxContainer/Speaker/SpeakerLabel"
@onready var dialog_container: PanelContainer = $"../Dialog/VBoxContainer/MarginContainer/DialogContainer"
@onready var dialog: Label = $"../Dialog/VBoxContainer/MarginContainer/DialogContainer/Dialog"
@onready var next_button: Button = $"../Dialog/VBoxContainer/MarginContainer/DialogContainer/Dialog/NextButton"
@onready var v_box_choices: VBoxContainer = $"../Dialog/VBoxContainer/Choices/VBoxChoices"
@onready var choice_1: Button = $"../Dialog/VBoxContainer/Choices/VBoxChoices/Choice1"
@onready var choice_2: Button = $"../Dialog/VBoxContainer/Choices/VBoxChoices/Choice2"
@onready var choice_3: Button = $"../Dialog/VBoxContainer/Choices/VBoxChoices/Choice3"

@export var dialog_tree : Array[DialogLine] = []
@export var choice1 : String = ''
@export var choice1_tree : Array[DialogLine] = []
@export var choice2 : String = ''
@export var choice2_tree : Array[DialogLine] = []
@export var choice3 : String = ''
@export var choice3_tree : Array[DialogLine] = []

func run() -> void:
	dialog.text = ''
	v_box_choices.visible=false
	choice_1.text = choice1
	choice_2.text = choice2
	choice_3.text = choice3

	for line in dialog_tree:
		if line.check_flag=='':
			await show_dialog(line)
		else:
			print("Check for: ", line.check_flag)
			if GameManager.check_for_flag(line.check_flag):
				await show_dialog(line)
			else:
				print ("Flag not found")
	print (dialog_tree.size())
	next_button.visible=false
	v_box_choices.visible=true
	choice_1.pressed.connect (choice_1_pressed)
	choice_2.pressed.connect (choice_2_pressed)
	choice_3.pressed.connect (choice_3_pressed)

func show_dialog(line)->void:
	speaker_label.text = line.speaker
	speaker.visible=true
	dialog.text = line.dialog
	dialog_container.visible=true
	next_button.visible=true
	await next_button.pressed

func choice_1_pressed() -> void:
	followup(choice1_tree)
	pass
	
func choice_2_pressed() -> void:
	followup(choice2_tree)
	pass
	
func choice_3_pressed() -> void:
	followup(choice3_tree)
	pass

func followup( choice_tree : Array) -> void:
	v_box_choices.visible=false
	choice_1.pressed.disconnect (choice_1_pressed)
	choice_2.pressed.disconnect (choice_2_pressed)
	choice_3.pressed.disconnect (choice_3_pressed)
	
	if choice_tree.is_empty():
		done()
		return
	for line in choice_tree:
		if line.check_flag != '':
			print("Check for: ", line.check_flag)
			if !GameManager.check_for_flag(line.check_flag):
				continue
		speaker_label.text = line.speaker
		dialog.text = line.dialog
		dialog_container.visible=true
		next_button.visible=true
		await next_button.pressed
	done()
	pass

func done() -> void:
	dialog_done.emit()
