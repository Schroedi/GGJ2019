extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format(["%.1f"%(value*100)] )
	
func GetTextItem() -> String:
	return "[color=black]Items drop [color=red]{0}%[/color][color=black] more often[/color]".format(["%.1f"%(value*100)] )

func GetName() ->String:
	return "Item drop chance"
	
func _init():
	Id = "dropRate"
	value = 0.01
	defaultValue = 0
	IconId = [8]
	MainName = ["Microphone","Amplifyer","Loudspeaker","Megaphone","Emenem","Rapper","Gangster","Micdrop","Mic","Mickey"]
	Prefix = ["Sniffing","Rapping","Searching","Hunting","Examining","Seeking","Investigating","Scanning","Tracking","Fast Speaking","Rap-Batteling"]
