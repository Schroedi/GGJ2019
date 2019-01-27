extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format(["%.1f"%(value*100)] )

func GetTextItem() -> String:
	return "[color=black][color=red]+{0}%[/color][color=black]to find higher stat items[/color]".format(["%.1f"%(value*100)] )
	
func _init():
	Id = "dropQuality"
	value = 0.1
	defaultValue = 0
	IconId = [1,6]