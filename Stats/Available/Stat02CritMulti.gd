extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[color=red]{0}%[/color] of base damage".format( [value*100] )
	
func _init():
	Id = "critMulti"
	value = 0.1
	defaultValue =0