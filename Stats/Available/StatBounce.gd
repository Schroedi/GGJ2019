extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	var v1 = floor(value)
	var v2 = (value-v1)*100
	
	return "[b]Bounce[/b]:\nAttacks bounce to [color=red]{0}[/color] additional targets\n "\
	+ "color=red]{1}%[/color] chance to bounce one more time".format( [v1,v2])
	
func _init():
	Id = "bounce"
	value = 0.1
	defaultValue = 0