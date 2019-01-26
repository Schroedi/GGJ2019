extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	var v1 = floor(value)
	var v2 = (value-v1)*100
	
	return "[b]Enemy Count[/b]:\nWaves spawn [color=red]{0}[/color] additional enemies\n "\
	+ "color=red]{1}%[/color] chance spawn an additional enemy".format([v1,v2])
func _init():
	Id = "enemyCount"
	value = 0.1