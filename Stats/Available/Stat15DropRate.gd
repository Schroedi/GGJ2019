extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format(["%.2f"%(value*100)] )
	
func GetTextItem() -> String:
	return "[color=black]Items drop [color=red]{0}%[/color][color=black] more often[/color]".format(["%.2f"%(value*100)] )

func GetName() ->String:
	return "Item drop chance"
	
func _init():
	Id = "dropRate"
	multi = 1 / 100.0
	defaultValue = 0
	IconId = [8]
	MainName = ["Microphone","Amplifyer","Loudspeaker","Megaphone","Emenem","Rapper","Gangster","Micdrop","Mic","Mickey"]
	Prefix = ["Sniffing","Rapping","Searching","Hunting","Examining","Seeking","Investigating","Scanning","Tracking","Fast Speaking","Rap-Batteling"]
	LevelUp()
