extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	
	return ("{0}").format(["%.2f" %value] )
	
func GetTextItem() -> String:	
	return ("[color=black]Attacks bounce [/color][color=red]{0}[/color][color=black] times[/color]").format( ["%.2f" %value] )	
	
func GetName() ->String:
	return "Bounce to nearby targets"
	
func _init():
	Id = "bounce"
	multi = 1/5.0
	add = 0
	defaultValue = 0
	IconId = [6]
	MainName = ["Spiker","Annoyer","Cactus","Spikething","Plant","Hedgehogplant","Desert Tree","Vulture Seat"]
	Prefix = ["Suspended","Rebound","Jumping","Leaping","Trampoline","Moving","Flying","Aviated","Winged","Piercing","Spiked","Pointed"]
	LevelUp()