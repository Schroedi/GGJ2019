extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}".format( ["%.1f"%value] )
	
func GetTextItem() -> String:
	return "[color=black]Targets drop [color=red]{0}[/color][color=black] more gold[/color]".format( ["%.1f"%value])	
	
	

func GetName() ->String:
	return "Additional gold dropped by targets"
	
func _init():
	Id = "money"
	value = 1
	defaultValue = 0 
	IconId = [0,12]
	MainName = ["Phishing Rod","Stiletto"]
	Prefix = ["earning","depleating","inflational","silver","gold","copper","debtful","burdened","cashless"]
	