extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}m".format( [value])
	
func GetTextItem() -> String:
	return "[color=black]Hits tartets in [/color][color=red]+{0}[/color][color=black] radius[/color]".format( [value])	
	
func _init():
	Id = "splash"
	value = 10
	defaultValue = 0