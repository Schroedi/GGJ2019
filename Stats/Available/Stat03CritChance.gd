extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "{0}%".format(  [value*100])
	
func GetTextItem() -> String:
	return "[color=red]+{0}%[/color][color=black] chance to hit critical[/color]".format(  [value*100])
	
func _init():
	Id = "crit"
	value = 0.1
	defaultValue = 0