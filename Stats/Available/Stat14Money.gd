extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}".format( [value] )
	
func GetTextItem() -> String:
	return "[color=black]Targets drop [color=red]{0}[/color][color=black] more gold[/color]".format( [value] )	
	
func _init():
	Id = "money"
	value = 0.1
	defaultValue = 0 