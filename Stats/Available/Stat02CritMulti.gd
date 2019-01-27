extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format( ["%.2f" %(value*100)]  )
	
func GetTextItem() -> String:
	return "[color=red]+{0}%[/color][color=black] critical damage[/color]".format( ["%.2f" %(value*100)]  )
	
	
func GetName() ->String:
	return "Critical damage"
	
func _init():
	Id = "critMulti"
	value = 0.1
	defaultValue =0
	IconId = [5,12]
	MainName = ["Cheese","Stiletto"]
	