extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "[b]Slow[/b]:\nHits slow enemies by [color=red]{x}%[/color] for [color=red]{y}%[/color] seconds" .format( value)
	

func _init():
	Id = "slow"
	value = Vector2(1,4)
	defaultValue = Vector2(0,0)