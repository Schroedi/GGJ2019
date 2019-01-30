extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}/s".format(["%.1f" % value])
	
func GetTextItem() -> String:
	return "[color=black]Generates [/color][color=red]{0} gold[/color][color=black] per second[/color]".format(["%.1f" % value])
	
func _init():
	Id = "bank"
	multi = 1
	add = 0
	defaultValue = 0
	IconId = [7]
	MainName = ["Businessmanswear","Tie","Necktie","Straight-Bowtie"]
	Prefix = ["Overpaid","Investing","Piggy-Banking","Funding","Exploiting","Utilising","Overworked","Manipulated","Commercialized","Manipulating"]
	LevelUp()
	
func GetName() ->String:
	return "Investment"
	
