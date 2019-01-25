extends Node

var Stats:Array
var ItemLvl:int = 0

func GetText() -> String:
	var text = ""
	for s in Stats:
		text += s.GetText() + "\n"
	
	return text


func GetName() -> String:
	return "BaseItem"