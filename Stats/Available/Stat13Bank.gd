extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[color=red]{0}[/color] gold per second generated".format([value.x,value.y])
	
func _init():
	Id = "bank"
	# Seconds, gold
	value = Vector2(5,1)
	defaultValue = Vector2(0,0)