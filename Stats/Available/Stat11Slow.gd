extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "{0}%" .format( ["%.2f" %value.x])
	
func GetTextItem() -> String:
	return "[color=black]Slows targets by [/color][color=red]{0}%[/color]".format(["%.2f" %value.x])	
	

func _init():
	Id = "slow"
	value = Vector2(1,4)
	defaultValue = Vector2(0,0)
	IconId = [1,17]
	
	