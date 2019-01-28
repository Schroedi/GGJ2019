extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "{0}s".format(  ["%.2f" %value.y])
	
func GetTextItem() -> String:
	return "[color=black]Hits random every [/color][color=red]{0}[/color][color=black] seconds[/color]".format( ["%.2f" %value.y])	
	
func GetName() ->String:
	return "Random damage every"
		
func _init():
	Id = "randomDamage"
	# damage, seconds
	value = Vector2(10,10)
	defaultValue = Vector2(0,0)
	IconId = [15]
	MainName = ["Wig Tower"]
	Prefix = ["Unfair","Fakenew","Random","Political","Dishonest","Biased","Cheating","Untrue","Ridiculous","Incompetent","Arrogant","Idiotic","Ignorant","Racist"]

func LevelUp(dir=1):
	# 10% more, override for non numeric or more complex stats
	value.x *= 1.1 * dir
	value.y /= 1.1 * dir
	Level += 1 * dir
	