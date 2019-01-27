extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "{1}%" .format( [value.x,value.y])
	
func GetTextItem() -> String:
	return "[color=black]Effects last for [color=red]+{1}%[/color][color=black] seconds[/color]" .format( [value.x,value.y])
	

func _init():
	Id = "slow"
	value = Vector2(1,4)
	defaultValue = Vector2(0,0)