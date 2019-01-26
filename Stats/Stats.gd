extends Node

var CurrentStats = {}

var AlltStats = []
var DropWeights = []

func _init():
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
			DropWeights.append(stat.new().dropWeight)
	dir.list_dir_end()

func GetAllStats():
	return AlltStats

func _ready():
	CurrentStats["speed"] = 2