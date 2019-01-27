extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format(["%.1f"%(value*100)] )
	
func GetTextItem() -> String:
	return "[color=black]Items drop [color=red]{0}%[/color][color=black] more often[/color]".format(["%.1f"%(value*100)] )

func GetName() ->String:
	return "Item drop chance"
	
func _init():
	Id = "dropRate"
	value = 1
	defaultValue = 0
	IconId = [4,16]
	MainName = ["Hat","Clock"]
	Prefix = ["sniffing","searching","hunting","examining","seeking","investigating","scanning","tracking"]