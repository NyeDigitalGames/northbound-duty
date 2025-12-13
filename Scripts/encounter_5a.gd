extends EncounterDialog

func choice_1_pressed() -> void:
	GameManager.add_flag('delivery_formal')
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.add_flag('delivery_casual')
	if GameManager.package_condition <= 2:
		GameManager.update_catastrophe(1)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('delivery_honest')
	GameManager.update_catastrophe(-1)
	super()
	pass
