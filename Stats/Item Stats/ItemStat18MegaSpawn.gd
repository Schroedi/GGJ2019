extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	var v1 = floor(value)
	var v2 = (value-v1)*100
	
	return ("[color=red]{1}%[/color] to spawn double additional targets").format([v1,v2])
func _init():
	Id = "enemyCount"
	value = 0.1