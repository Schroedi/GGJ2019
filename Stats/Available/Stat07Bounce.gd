extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	
	return ("{0}").format(["%.2f" %value] )
	
func GetTextItem() -> String:	
	return ("[color=black]Attacks bounce [/color][color=red]{0}[/color][color=black] times[/color]").format( ["%.2f" %value] )	
	
func GetName() ->String:
	return "Bounce to nearby targets"
	
func _init():
	Id = "bounce"
	value = 1
	defaultValue = 0
	IconId = [6,16]
	MainName = ["Spiker","Annoyer"]
	Prefix = ["suspended","rebound","jumping","leaping","trampoline","moving","flying","aviated","winged"]