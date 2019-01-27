extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "Hits slow targets by [color=red]{0}%[/color]" .format( [value.x,value.y])
	

func _init():
	Id = "slow"
	value = Vector2(1,4)
	defaultValue = Vector2(0,0)