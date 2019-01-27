extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	var v1 = floor(value)
	var v2 = (value-v1)*100
	
	return ("{0}").format([v1,v2])
	
func GetTextItem() -> String:
	var v1 = floor(value)
	var v2 = (value-v1)*100
	
	return ("[color=black]Waves have [color=red]{0}[/color][color=black] additional targets[/color]").format([v1,v2])
	
func _init():
	Id = "enemyCount"
	value = 0.1