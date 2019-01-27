extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "Hit a random target every [color=red]{0}[/color] seconds ".format(  [value.x,value.y])
	
func _init():
	Id = "randomDamage"
	# damage, seconds
	value = Vector2(10,10)
	defaultValue = Vector2(0,0)
