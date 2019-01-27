extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}" .format( [value] )
	
func GetTextItem() -> String:
	return " " .format( [value] )	
	
func _init():
	Id = "dps"
	value = 1
	defaultValue = 0