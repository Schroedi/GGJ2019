extends Node

var ItemStats = []
var ItemLvl:int = 0

func GetText() -> String:
	var text = ""
	for s in ItemStats:
		text += s.GetText() + "\n"
	
	return text


func GetName() -> String:
	return "BaseItem"