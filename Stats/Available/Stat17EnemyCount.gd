extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return ("{0}").format( ["%.2f" %value])
	
func GetTextItem() -> String:
	return ("[color=black]Waves have [color=red]{0}[/color][color=black] additional targets[/color]").format(["%.2f" %value])

func GetName() ->String:
	return "Get additional targets"

		
func _init():
	Id = "enemyCount"
	multi = 1/10.0
	IconId = [1]
	MainName = ["Sweetboi","Gum Bear","Dong","Beef","Willy","Tool","Rod","Discostick","Captain","Cucumber","Soldier","Candle"]
	Prefix = ["Attractive","Pleasant","Charismatic","Magnetic","Handsome","Photogenic","Beautiful","Hypnotic","Seductive"]
	LevelUp()