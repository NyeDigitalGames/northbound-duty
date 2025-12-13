extends EncounterDialog

func choice_1_pressed() -> void:
	if GameManager.check_for_flag('blizzard_neutral'):
		#Blizzard agrees to push you forward
		GameManager.update_catastrophe(-1)
	elif GameManager.check_for_flag('blizzard_offended'):
		#Blizzard “helps” by throwing you off course
		GameManager.update_catastrophe(1)
	elif GameManager.check_for_flag('blizzard_attached'):
		#Blizzard pushes you too fast
		GameManager.update_package(-1)
	super()
	pass
	
func choice_2_pressed() -> void:
	if GameManager.check_for_flag('has_thermos'):
		#Blizzard becomes delighted
		GameManager.add_flag('blizzard_friendly')
		GameManager.update_catastrophe(-2)
	elif GameManager.check_for_flag('has_map'):
		#Blizzard mocks you but lets you pass
		pass
	elif GameManager.check_for_flag('has_compass'):
		#Blizzard becomes introspective
		GameManager.add_flag('blizzard_philosophical')
		GameManager.update_catastrophe(-1)
	super()
	pass
	
func choice_3_pressed() -> void:
	GameManager.add_flag('blizzard_avoids_you')
	GameManager.update_catastrophe(-1)
	super()
	pass
