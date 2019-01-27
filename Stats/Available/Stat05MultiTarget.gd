extends "res://Stats/BaseStat.gd"
func GetText() -> String:	
	return ("{0}").format(["%.2f" %value] )
	
func GetTextItem() -> String:	
	return ("[color=black]Fires at [/color][color=red]{0}[/color][color=black] additional targets[/color]").format( ["%.2f" %value] )	

func GetName() ->String:
	return "Hit additional targets"
	
func _init():
	Id = "multiTarget"
	value = 1
	defaultValue = 0
	IconId = [8,9]