extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return ("{0}").format( ["%.2f" %value])
	
func GetTextItem() -> String:
	return ("[color=black]Waves have [color=red]{0}[/color][color=black] additional targets[/color]").format(["%.2f" %value])

func GetName() ->String:
	return "Get additional targets"

		
func _init():
	Id = "enemyCount"
	value = 0.1
	IconId = [0,8,17]
	MainName = ["Bait Rod","Microphone","Sleep"]