extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[color=red]{0}[/color] more gold dropped".format( [value] )
	
func _init():
	Id = "money"
	value = 0.1
	defaultValue = 0 