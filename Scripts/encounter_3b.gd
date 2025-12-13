extends EncounterDialog

func choice_1_pressed() -> void:
	GameManager.add_flag('penguins_respect_purpose')
	GameManager.update_catastrophe(-1)
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.update_catastrophe(1)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('penguins_respect_honesty')
	GameManager.update_catastrophe(-1)
	super()
	pass
