extends Node

var CurrentStats = {}

var AlltStats = []

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
			AlltStats.append(load(path+file))
	dir.list_dir_end()

func GetAllStats():
	return AlltStats

func _ready():
	CurrentStats["speed"] = 2