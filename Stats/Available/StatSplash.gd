extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Splash[/b]:\nEnemies in [color=red]{0}[/color] radius around the target are also hit".format( [value])
	
func _init():
	Id = "splash"
	value = 10
	defaultValue = 0