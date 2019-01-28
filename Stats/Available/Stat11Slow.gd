extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "{0}%" .format( ["%.2f" %value.x])
	
func GetTextItem() -> String:
	return "[color=black]Slows targets by [/color][color=red]{0}%[/color]".format(["%.2f" %value.x])	
	

func GetName() ->String:
	return "Target slowdown on hit"
	
func _init():
	Id = "slow"
	value = Vector2(1,2)
	defaultValue = Vector2(0,0)
	IconId = [17]
	MainName = ["Sleep","Bedtime","Yawning","Nap","Powernap"]
	Prefix = ["Sleeping","Boring","Tired","Naping","Barely Awake","Comatous","Relaxing","Hibernating","Lazy","Frosting","Freezing","Dazzling"]
	
	