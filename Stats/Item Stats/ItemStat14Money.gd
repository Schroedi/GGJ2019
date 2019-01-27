extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "Targets drop [color=red]{0}[/color] more gold".format( [value] )
	
func _init():
	Id = "money"
	value = 0.1
	defaultValue = 0 