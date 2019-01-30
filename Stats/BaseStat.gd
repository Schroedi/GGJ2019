extends Node

var Id:String
var value = 0
var multi = 10
var add = 0
var expo = 0.8
var defaultValue = 0
var dropWeight = 1
var Level = 0
var IconId = [0]
var Prefix = ["Pref"]
var MainName = ["Main"]

func GetText() -> String:
	return str(Id, value)
	
func GetTextItem() -> String:
	return str(Id, value)	

func GetName() ->String:
	return Id

func LevelUp(dir=1):
	# 10% more, override for non numeric or more complex stats
	Level += 1 * dir
	# todo does not work for vector
	value = pow(Level, expo) * multi + add

func LevelDown():
	if Level <= 1:
		return
	LevelUp(-1)

func Equip():
	Stats.CurrentStats[Id] += value

func Unequip():
	Stats.CurrentStats[Id] -= value