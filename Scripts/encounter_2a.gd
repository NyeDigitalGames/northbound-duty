extends EncounterDialog

func choice_1_pressed() -> void:
	GameManager.add_flag('blizzard_neutral')
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.add_flag('blizzard_attached')
	GameManager.update_catastrophe(1)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('blizzard_offended')
	GameManager.update_catastrophe(2)
	super()
	pass
