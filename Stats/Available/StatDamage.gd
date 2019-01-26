extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Damage[/b]:\nAttacks deal [color=red]{0}[/color] additional damage" .format( [value] )
	
func _init():
	Id = "damage"
	value = 1
	defaultValue = 0