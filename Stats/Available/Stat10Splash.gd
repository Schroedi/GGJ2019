extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}m".format( ["%.2f" %value])
	
func GetTextItem() -> String:
	return "[color=black]Hits targets in [/color][color=red]{0}[/color][color=black] radius[/color]".format( ["%.2f" %value])

func GetName() ->String:
	return "Splash damage radius"
		
func _init():
	Id = "splash"
	multi = 10
	add = 0
	defaultValue = 0
	IconId = [5]
	MainName = ["Cheese","Mozarella","Mousehole","Food","Parmesan","Brie","Gouda","Feta","Cheddar","Fromage"]
	Prefix = ["Sloshy","Splashy","Puddled","Spraying","Sparkling","Wetting","Trhilling","Soaking","Dripping","Slippery","Slick","Wet","Bumpy","Twisty","Greasy","Stinky"]
	LevelUp()