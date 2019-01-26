extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Crit Multi[/b]:\nCrits deal [color=red]{0}%[/color] additional damage".format( [value*100] )
	
func _init():
	Id = "critMulti"
	value = 0.1
	defaultValue =0