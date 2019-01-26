extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Bank[/b]:\ngenerates [color=red]{1} gold[/color]  per [color=red]{0} seconds[/color]".format(value)
	
func _init():
	Id = "bank"
	# Seconds, gold
	value = Vector2(5,1)
	defaultValue = Vector2(5,0)