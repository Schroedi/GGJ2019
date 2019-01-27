extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format( [value*100] )
	
func GetTextItem() -> String:
	return "[color=red]+{0}%[/color][color=black] critical damage[/color]".format( [value*100] )
	
func _init():
	Id = "critMulti"
	value = 0.1
	defaultValue =0