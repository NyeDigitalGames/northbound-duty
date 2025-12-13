extends EncounterDialog
@onready var main: Control = $".."

func run() -> void:
	$"../Dialog/VBoxContainer/Location/LocationLabel".text = 'Random Toll Booth'
	main.change_snow_layers(40)
	main.change_snow(2.0)
	super()
	
func choice_1_pressed() -> void:
	GameManager.add_flag('penguins_tolerate_you')
	super()
	pass
	
func choice_2_pressed() -> void:
	if GameManager.check_for_flag('has_thermos'):
		GameManager.update_package(-1)
		GameManager.add_flag('penguins_distracted')
	elif GameManager.check_for_flag('has_map'):
		GameManager.add_flag('penguins_confused')
	elif GameManager.check_for_flag('has_compass'):
		GameManager.add_flag('penguins_existential_crisis')
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('penguins_suspicious')
	GameManager.update_catastrophe(1)
	super()
	pass
