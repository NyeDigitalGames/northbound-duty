extends EncounterDialog

@onready var north_button: Button = $"../Dialog/VBoxContainer/Spacer/NorthButton"


func run() -> void:
	super()
	speaker.visible=false
	dialog_container.visible=false
	v_box_choices.visible=false
	north_button.visible = true
	north_button.pressed.connect (next_scene)
	
func next_scene()->void:
	north_button.pressed.disconnect(next_scene)
	north_button.visible=false
	done()
	
