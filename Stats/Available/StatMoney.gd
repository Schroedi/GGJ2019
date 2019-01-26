extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Cash[/b]:\nEnemies drop [color=red]{0}[/color] aditional gold".format( [value] )
	
func _init():
	Id = "money"
	value = 0.1