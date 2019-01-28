extends Node

var CurrentStats = {}

var AlltStats = [load("res://Stats/Available/Stat01BaseDamage.gd"), load("res://Stats/Available/Stat02CritMulti.gd"), load("res://Stats/Available/Stat03CritChance.gd"), load("res://Stats/Available/Stat04Speed.gd"), load("res://Stats/Available/Stat05MultiTarget.gd"), load("res://Stats/Available/Stat07Bounce.gd"), load("res://Stats/Available/Stat09RandomDamage.gd"), load("res://Stats/Available/Stat10Splash.gd"), load("res://Stats/Available/Stat11Slow.gd"), load("res://Stats/Available/Stat13Bank.gd"), load("res://Stats/Available/Stat14Money.gd"), load("res://Stats/Available/Stat15DropRate.gd"), load("res://Stats/Available/Stat16DropQuality.gd"), load("res://Stats/Available/Stat17EnemyCount.gd")]

var DropWeights = []
var StatIds = []
var _equipped = []

func _init():
	_equipped = []
	DropWeights = []
	StatIds = []
	loadAllStats()
	
func loadAllStats():
	for stat in AlltStats:
		var statInst = stat.new()
		DropWeights.append(statInst.dropWeight)
		StatIds.append(statInst.Id)
		CurrentStats[statInst.Id] = statInst.defaultValue

func GetAllStats():
	return AlltStats

func EquipItem(item):
	_equipped.append(item)
	for s in item.ItemStats:
		s.Equip()

func UnEquipItem(item):
	if _equipped.has(item):
		_equipped.erase(item)
		for s in item.ItemStats:
			s.Unequip()
