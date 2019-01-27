extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}m".format( ["%.2f" %value])
	
func GetTextItem() -> String:
	return "[color=black]Hits tartets in [/color][color=red]{0}[/color][color=black] radius[/color]".format( ["%.2f" %value])	

func GetName() ->String:
	return "Splash damage radius"
		
func _init():
	Id = "splash"
	value = 10
	defaultValue = 0
	IconId = [5,11,16]
	MainName = ["Cheese","Umbrella","Clock"]
	Prefix = ["sloshy","splashy","puddled","spraying","sparkling","wetting","trhilling","soaking","dripping","slippery","slick","wet","bumpy","twisty","greasy"]