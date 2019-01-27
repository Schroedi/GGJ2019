extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "{0}s".format(  [value.x,value.y])
	
func GetTextItem() -> String:
	return "[/color=black]Hits random every [/color][color=red]{0}[/color][/color=black] seconds[/color]".format(  [value.x,value.y])	
	
func _init():
	Id = "randomDamage"
	# damage, seconds
	value = Vector2(10,10)
	defaultValue = Vector2(0,0)
