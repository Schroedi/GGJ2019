extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "[b]Random Damage[/b]:\nDeal[color=red]{x}x[/color] attack damage to a random Enemy every [color=red]{y}[/color]seconds ".format(  value)
	
func _init():
	Id = "randomDamage"
	# damage, seconds
	value = Vector2(10,10)
	defaultValue = Vector2(0,0)
