extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "[b]Random Damage[/b]:\nDeal[color=red]{0}x[/color] attack damage to a random Enemy every [color=red]{1}[/color]seconds ".format(  value)
	
func _init():
	Id = "randomDamage"
	value = [10,10]