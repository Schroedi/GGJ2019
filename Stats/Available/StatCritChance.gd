extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "[b]Crit chance[/b]:\n[color=red]{0}%[/color]  chance to crit".format(  [value*100])
	
func _init():
	Id = "crit"
	value = 0.1
	defaultValue = 0