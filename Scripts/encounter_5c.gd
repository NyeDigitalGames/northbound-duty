extends EncounterDialog

@export var endings : Array[Node] = []

var ending : int = 0

func run() -> void:
	await super()
	choice_1.pressed.disconnect (choice_1_pressed)
	choice_2.pressed.disconnect (choice_2_pressed)
	choice_3.pressed.disconnect (choice_3_pressed)
	speaker.visible=false
	dialog_container.visible=false
	v_box_choices.visible=false
	evaluate_ending()
	
func next_scene()->void:
	endings[ending].run()
	pass
	
func evaluate_ending() -> void:
	print ("catastrophe_level: ", str(GameManager.catastrophe_level))
	print ("package_condition: ", str(GameManager.package_condition))
	if GameManager.catastrophe_level >= 9 and GameManager.check_for_flag('delivery_honest') and GameManager.check_for_flag('reindeer_knows_truth'):
		ending = 3
		GameManager.end_title = 'WELCOME TO MANAGEMENT.'
		GameManager.ending_number=4
	elif GameManager.catastrophe_level <=4 and GameManager.package_condition >= 3:
		ending = 0
		GameManager.end_title = 'YOU DELIVERED THE NORTH.'
		GameManager.ending_number=1
	elif GameManager.catastrophe_level <=7 and GameManager.package_condition >= 1:
		ending = 1
		GameManager.end_title = 'THE NORTH ADAPTS.'
		GameManager.ending_number=2
	elif GameManager.catastrophe_level >= 8 or GameManager.package_condition <=0:
		ending = 2
		GameManager.end_title = 'RETURN TO SENDER (METAPHYSICALLY).'
		GameManager.ending_number=3
	next_scene()
