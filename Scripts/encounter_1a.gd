extends EncounterDialog

func choice_1_pressed() -> void:
	GameManager.add_item(GameManager.ITEMS.MAP)
	GameManager.add_flag('has_map')
	GameManager.add_flag('map_confidence')
	GameManager.update_catastrophe(1)
	super()
	pass
	
func choice_2_pressed() -> void:
	GameManager.add_item(GameManager.ITEMS.COMPASS)
	GameManager.add_flag('has_compass')
	GameManager.add_flag('existential_compass')
	GameManager.update_catastrophe(1)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_item(GameManager.ITEMS.THERMOS)
	GameManager.add_flag('has_thermos')
	GameManager.add_flag('glitter_spill')
	GameManager.update_catastrophe(-1)
	GameManager.update_package(-1)
	super()
	pass
