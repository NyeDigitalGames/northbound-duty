extends EncounterDialog

func choice_1_pressed() -> void:
	GameManager.add_flag('reindeer_hopeful')
	GameManager.update_catastrophe(-1)
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.remove_item(GameManager.item)
	GameManager.add_flag('reindeer_bribed')
	if GameManager.check_for_flag('has_thermos'):
		GameManager.update_package(-1)
	GameManager.update_catastrophe(1)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('reindeer_knows_truth')
	GameManager.update_catastrophe(1)
	GameManager.update_package(-2)
	super()
	pass
