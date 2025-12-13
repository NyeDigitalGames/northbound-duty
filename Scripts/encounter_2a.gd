extends EncounterDialog
@onready var main: Control = $".."

func run() -> void:
	main.change_snow(5.0)
	super()
	
	
func choice_1_pressed() -> void:
	GameManager.add_flag('blizzard_neutral')
	main.change_snow(3.0)
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.add_flag('blizzard_attached')
	GameManager.update_catastrophe(1)
	main.change_snow(1.0)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('blizzard_offended')
	GameManager.update_catastrophe(2)
	main.change_snow(10.0)
	super()
	pass
