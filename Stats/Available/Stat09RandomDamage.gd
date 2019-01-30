extends "res://Stats/BaseStat.gd"

# random dmg = BaseDmg() * rand_range(0.1, 1) * value * DamageLevelMulti
const DamageLevelMulti = 1000
const BaseSeconds = 30

func GetText() -> String:
	return "{0}s".format(  ["%.2f" % (BaseSeconds - value)])
	
func GetTextItem() -> String:
	return "[color=black]Hits random every [/color][color=red]{0}[/color][color=black] seconds[/color]".format( ["%.2f" % (BaseSeconds - value)])
	
func GetName() ->String:
	return "Random damage every"
		
func _init():
	Id = "randomDamage"
	# damage, seconds
	multi = 1/10.0
	defaultValue = 0
	IconId = [15]
	MainName = ["Wig Tower"]
	Prefix = ["Unfair","Fakenews","Random","Political","Dishonest","Biased","Cheating","Untrue","Ridiculous","Incompetent","Arrogant","Idiotic","Ignorant","Racist"]
	LevelUp()

func LevelUp(dir=1):
	.LevelUp(dir)
	# clamp to once per second
	value = max(1, value)