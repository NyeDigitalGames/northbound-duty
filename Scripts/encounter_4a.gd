extends EncounterDialog
@onready var main: Control = $".."

func run() -> void:
	$"../Dialog/VBoxContainer/Location/LocationLabel".text = 'Middle of the Road'
	main.change_snow(1.0)
	super()
	
func choice_1_pressed() -> void:
	GameManager.add_flag('reindeer_heard')
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.add_flag('reindeer_pressured')
	GameManager.update_catastrophe(1)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('reindeer_resistant')
	GameManager.update_catastrophe(2)
	super()
	pass
