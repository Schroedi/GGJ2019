extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "[b]Slow[/b]:\nHits slow enemies by [color=red]{0}%[/color]" .format( [value])
	

func _init():
	Id = "slow"
	value = 1