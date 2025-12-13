extends EncounterDialog

func run() -> void:
	await super()
	done()

func done() -> void:
	get_tree().change_scene_to_file("res://end_screen.tscn")
