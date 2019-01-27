extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}/s".format([value.x,value.y])
	
func GetTextItem() -> String:
	return "[color=black]Generates [/color][color=red]{0} gold[/color][color=black] per second[/color]".format([value.x,value.y])	
	
func _init():
	Id = "bank"
	# Seconds, gold
	value = Vector2(5,1)
	defaultValue = Vector2(0,0)