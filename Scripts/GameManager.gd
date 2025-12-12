extends Node

enum ITEMS {NONE, MAP, COMPASS, THERMOS}

var item : ITEMS = ITEMS.NONE
var flags : Array[String] = []
var catastrophe_level : int = 0
var package_condition : int = 5

func _ready() -> void:
	reset_values()
	
func reset_values() -> void:
	item = ITEMS.NONE
	flags = []
	catastrophe_level = 0
	package_condition = 5
	
func add_item ( _item : ITEMS ) -> void:
	item = _item

func add_flag (flag : String) -> void:
	flags.append(flag)
	
func check_for_flag ( flag : String ) -> bool:
	if flags.has(flag):
		return true
	return false
	
func update_package ( value_delta : int ) -> void:
	package_condition += value_delta
	
func update_catastrophe ( value_delta : int ) -> void:
	catastrophe_level += value_delta
