extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "[color=red]{0}[/color] seconds until random hit".format(  [value.x,value.y])
	
func _init():
	Id = "randomDamage"
	# damage, seconds
	value = Vector2(10,10)
	defaultValue = Vector2(0,0)
