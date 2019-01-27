extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	var v1 = floor(value)
	var v2 = (value-v1)*100
	
	return ("{1}%").format([v1,v2])
	
func GetTextItem() -> String:
	var v1 = floor(value)
	var v2 = (value-v1)*100
	
	return ("[color=red]+{1}%[/color][color=black] to spawn more additional targets[/color]").format([v1,v2])	
	
func _init():
	Id = "enemyCount"
	value = 0.1