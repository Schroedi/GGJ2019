extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}" .format( [value] )
	
func GetTextItem() -> String:
	return "[color=red]+{0}[/color][color=black] additional base damage[/color]" .format( [value] )
	
func _init():
	Id = "damage"
	value = 1
	defaultValue = 0