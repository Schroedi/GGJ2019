extends Node

var Id:String
var value
var defaultValue = 0
var dropWeight = 1
var Level = 0



func GetText() -> String:
	return str(Id, value)
	
func GetTextItem() -> String:
	return str(Id, value)	

func LevelUp():
	# 10% more, override for non numeric or more complex stats
	value *= 1.1
	Level += 1

func Equip():
	Stats.CurrentStats[Id] += value

func Unequip():
	Stats.CurrentStats[Id] -= value