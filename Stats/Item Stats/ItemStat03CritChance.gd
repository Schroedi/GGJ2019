extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "[color=red]{0}%[/color] chance to hit critical".format(  [value*100])
	
func _init():
	Id = "crit"
	value = 0.1
	defaultValue = 0