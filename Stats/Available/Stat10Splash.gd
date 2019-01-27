extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[color=red]{0}[/color] radius hits targets".format( [value])
	
func _init():
	Id = "splash"
	value = 10
	defaultValue = 0