extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format(["%.2f"%(value*100)] )

func GetTextItem() -> String:
	return "[color=black][color=red]+{0}%[/color][color=black] to find higher stat items[/color]".format(["%.2f"%(value*100)] )

func GetName() ->String:
	return "Higher quality item chance"

	
func _init():
	Id = "dropQuality"
	multi = 1/100.0
	defaultValue = 0
	IconId = [4]
	MainName = ["Hat","Cowboyhat","Helmet","Cap","Beanie"]
	Prefix = ["Earning","Depleating","Inflational","Silver","Gold","Copper","Debtful","Burdened","Cashless"]
	LevelUp()