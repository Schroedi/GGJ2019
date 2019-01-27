extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[color=red]{0}%[/color] chance to find higher stat items".format([value*100] )
	
func _init():
	Id = "dropQuality"
	value = 0.1
	defaultValue = 0