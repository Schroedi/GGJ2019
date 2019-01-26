extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	var v1 = floor(value)
	var v2 = (value-v1)*100
	
	return ("[b]Multi Target[/b]:\nAttacks fire at [color=red]{0y[/color] additional targets\n "\
	+ "[color=red]{1}%[/color] chance to attack one more target").format( [v1,v2])
	
func _init():
	Id = "multiTarget"
	value = 0.1
	defaultValue = 0