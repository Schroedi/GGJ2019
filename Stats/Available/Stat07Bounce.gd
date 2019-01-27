extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	
	return ("{0}").format(["%.2f" %value] )
	
func GetTextItem() -> String:
	
	return ("[color=black]Attacks bounce [/color][color=red]{0}[/color][color=black] times[/color]").format( ["%.2f" %value] )	
	
func _init():
	Id = "bounce"
	value = 0.1
	defaultValue = 0