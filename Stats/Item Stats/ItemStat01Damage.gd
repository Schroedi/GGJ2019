extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "+color=red]{0}[/color] additional base damage" .format( [value] )
	
func _init():
	Id = "damage"
	value = 1
	defaultValue = 0