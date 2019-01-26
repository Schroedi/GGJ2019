extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Drop Rate[/b]:\n[color=red]{0}%[/color] chance to drop Aditional Items".format([ value*100] )
	
func _init():
	Id = "dropRate"
	value = 0.1