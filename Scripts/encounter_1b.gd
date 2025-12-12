extends EncounterDialog

func choice_1_pressed() -> void:
	GameManager.add_flag('believes_north_is_place')
	GameManager.update_catastrophe(1)
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.add_flag('suspects_north_is_person')
	GameManager.add_flag('unsettling_insight')
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('avoids_existential_questions')
	GameManager.update_catastrophe(-1)
	super()
	pass
