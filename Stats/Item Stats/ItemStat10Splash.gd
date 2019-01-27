extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "Hit every tartet in [color=red]{0}[/color] radius".format( [value])
	
func _init():
	Id = "splash"
	value = 10
	defaultValue = 0