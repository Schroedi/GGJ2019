extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format( [(value-1)*100])
	
func GetTextItem() -> String:
	return "[color=red]+{0}%[/color][color=black] faster attacks[/color]".format( [(value-1)*100])
	
func _init():
	Id = "speed"
	value = 0.1
	defaultValue = 1