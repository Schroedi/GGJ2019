extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}/s".format(["%.1f"%value.y])
	
func GetTextItem() -> String:
	return "[color=black]Generates [/color][color=red]{0} gold[/color][color=black] per second[/color]".format(["%.1f"%value.y])	
	
func _init():
	Id = "bank"
	# Seconds, gold
	value = Vector2(1,1)
	defaultValue = Vector2(0,0)
	IconId = [7]
	MainName = ["Businessmanswear","Tie","Necktie","Straight-Bowtie"]
	Prefix = ["Overpaid","Investing","Piggy-Banking","Funding","Exploiting","Utilising","Overworked","Manipulated","Commercialized","Manipulating"]
	
func GetName() ->String:
	return "Investment"
		
func LevelUp(dir=1):
	# 10% more, override for non numeric or more complex stats
	value.y *= 1.1 * dir
	Level += 1
	
