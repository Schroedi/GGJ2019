extends Node

onready var _level = get_node("/root/Scene/Level")
onready var _player = get_node("/root/Scene/Level/Player")
onready var _hud = get_node("/root/Scene/HudLayer/HUD")

var playerDepth = 0
var _levels = {}
var _levelDepths = []
var _nextLevel = -1

func _loadLevels():
	var dir = Directory.new()
	var directory_path = "res://Levels"
	if dir.open(directory_path) == OK:
		dir.list_dir_begin()
		var filename = dir.get_next()
		while filename != "":
			if not dir.current_is_dir():
				var path = directory_path + "/" + filename
				# strip prefix to get lvl number
				var lvlN = filename.get_basename().right(3)
				var lvlDepth = lvlN.to_int()
				_levelDepths.append(lvlDepth)
				_levels[lvlDepth] = load(path)
			filename = dir.get_next()
	_levelDepths.sort()


func _loadNext():
	var lvl = _levels[_nextLevel].instance()
	_level.add_child(lvl)
	if _levelDepths.size() > 0:
		_nextLevel = _levelDepths.pop_front()
	else:
		_nextLevel = -1


# Called when the node enters the scene tree for the first time.
func _ready():
	_loadLevels()
	_nextLevel = _levelDepths.pop_front()


func _process(delta):
	playerDepth = _player.distance
	# -1 -> last level
	if _nextLevel != -1 and playerDepth >= _nextLevel:
		_hud.AnnounceLevel(_nextLevel)
		_loadNext()
