extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}" .format( ["%.2f" %value]  )
	
func GetTextItem() -> String:
	return "[color=red]+{0}[/color][color=black] additional base damage[/color]" .format(["%.2f" %value] )
	
func _init():
	Id = "damage"
	value = 1
	defaultValue = 0
	IconId = 2