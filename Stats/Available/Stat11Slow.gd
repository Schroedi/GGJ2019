extends "res://Stats/BaseStat.gd"

# seconds
const SlowTime = 1.0

func GetText() -> String:
	return "{0}%" .format( ["%.2f" % value])
	
func GetTextItem() -> String:
	return "[color=black]Slows targets by [/color][color=red]{0}%[/color]".format(["%.2f" % value])
	

func GetName() ->String:
	return "Target slowdown on hit"
	
func _init():
	Id = "slow"
	multi = 1/2.0
	add = 0
	defaultValue = 0
	IconId = [17]
	MainName = ["Sleep","Bedtime","Yawning","Nap","Powernap"]
	Prefix = ["Sleeping","Boring","Tired","Naping","Barely Awake","Comatous","Relaxing","Hibernating","Lazy","Frosting","Freezing","Dazzling"]
	LevelUp()
