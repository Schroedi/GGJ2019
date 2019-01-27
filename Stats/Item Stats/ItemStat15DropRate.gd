extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "Items drop [color=red]{0}%[/color] more often".format([ value*100] )
	
func _init():
	Id = "dropRate"
	value = 0.1
	defaultValue = 0