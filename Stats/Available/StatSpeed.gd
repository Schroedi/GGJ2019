extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Speed[/b]:\nAttack speed is [color=red]{0}%[/color] faster".format( [value*100])
	
func _init():
	Id = "speed"
	value = 0.1
	defaultValue = 1
