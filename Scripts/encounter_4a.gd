extends EncounterDialog

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
