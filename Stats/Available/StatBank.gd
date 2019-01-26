extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Bank[/b]:\nGenerates [color=red]{0} gold[/color]  per [color=red]{1} seconds[/color]".format([value.x,value.y])
	
func _init():
	Id = "bank"
	# Seconds, gold
	value = Vector2(5,1)
	defaultValue = Vector2(5,0)