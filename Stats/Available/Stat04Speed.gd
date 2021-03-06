extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format( ["%.2f" %(value*100)] )
	
func GetTextItem() -> String:
	return "[color=red]+{0}%[/color][color=black] faster attacks[/color]".format(  ["%.2f" %(value*100)] )

func GetName() ->String:
	return "Attack speed"
	
func _init():
	Id = "speed"
	multi = 1/100.0
	defaultValue = 1
	IconId = [12]
	MainName = ["Cowboy Boot","Sneaker","Shoe","Leather Sock","Trunk","Kikass"]
	Prefix = ["Quick","Oiled","Overworn","Speeding","Fast","Prompt","Agile","Swifty","Rushing","Boosted","Running","Climbing"]
	LevelUp()