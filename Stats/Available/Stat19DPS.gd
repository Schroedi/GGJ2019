extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[color=red]{0}[/color] damage per second" .format( [value] )
	
func _init():
	Id = "dps"
	value = 1
	defaultValue = 0