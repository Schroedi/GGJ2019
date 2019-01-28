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
	IconId = [1,17]
	MainName = ["Bait","Nap"]
	Prefix = ["sleeping","boring","tired","naping","barely awake","comatous","relaxing","hibernating","lazy","frosting","freezing","dazzling"]
	
	