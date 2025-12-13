extends EncounterDialog

func choice_1_pressed() -> void:
	GameManager.add_flag('motivation_duty')
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.add_flag('motivation_responsibility')
	if GameManager.check_for_flag('reindeer_hopeful'):
		GameManager.update_catastrophe(-1)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('motivation_acceptance')
	super()
	pass
