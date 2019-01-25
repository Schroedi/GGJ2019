extends Node

var Id:String
var value

func GetText() -> String:
	return str(Id, value)

func LevelUp():
	# 10% more, override for non numeric or more complex stats
	value *= 1.1
