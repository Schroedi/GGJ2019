extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "Generates [color=red]{0} gold[/color] per second".format([value.x,value.y])
	
func _init():
	Id = "bank"
	# Seconds, gold
	value = Vector2(5,1)
	defaultValue = Vector2(5,0)