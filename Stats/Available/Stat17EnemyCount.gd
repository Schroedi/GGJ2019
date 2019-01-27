extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return ("{0}").format( ["%.2f" %value])
	
func GetTextItem() -> String:
	return ("[color=black]Waves have [color=red]{0}[/color][color=black] additional targets[/color]").format(["%.2f" %value])
	
func _init():
	Id = "enemyCount"
	value = 0.1