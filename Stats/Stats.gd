extends Node

var CurrentStats = {}

var AlltStats = []
var DropWeights = []
var StatIds = []
var _equipped = []

func _init():
	_equipped = []
	AlltStats = []
	DropWeights = []
	StatIds = []
	loadAllStats("res://Stats/Available/")
	
func loadAllStats(path):
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			var stat = load(path+file)
			AlltStats.append(stat)
			var statInst = stat.new()
			DropWeights.append(statInst.dropWeight)
			StatIds.append(statInst.Id)
			CurrentStats[statInst.Id] = statInst.defaultValue
	dir.list_dir_end()

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
