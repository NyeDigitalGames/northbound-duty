extends Node

enum ITEMS {NONE, MAP, COMPASS, THERMOS}

var item : ITEMS = ITEMS.NONE
var flags : Array[String] = []
var catastrophe_level : int = 0
var package_condition : int = 5
var end_title : String = 'RETURN TO SENDER (METAPHYSICALLY).'
var ending_number : int = 0

func _ready() -> void:
	reset_values()
	
func reset_values() -> void:
	item = ITEMS.NONE
	flags = []
	catastrophe_level = 0
	package_condition = 5
	
func add_item ( _item : ITEMS ) -> void:
	item = _item

func remove_item ( _item : ITEMS ) -> void:
	if item == _item:
		item = ITEMS.NONE

func add_flag (flag : String) -> void:
	flags.append(flag)
	
func remove_flag (flag : String) -> void:
	flags.erase(flag)
	
func check_for_flag ( flag : String ) -> bool:
	if flags.is_empty():
		return false
	if flags.has(flag):
		return true
	return false
	
func update_package ( value_delta : int ) -> void:
	package_condition += value_delta
	
func update_catastrophe ( value_delta : int ) -> void:
	catastrophe_level += value_delta
