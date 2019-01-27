extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}/s".format(["%.1f"%value.y])
	
func GetTextItem() -> String:
	return "[color=black]Generates [/color][color=red]{0} gold[/color][color=black] per second[/color]".format(["%.1f"%value.y])	
	
func _init():
	Id = "bank"
	# Seconds, gold
	value = Vector2(1,0.1)
	defaultValue = Vector2(0,0)
	
func LevelUp():
	# 10% more, override for non numeric or more complex stats
	value.y *= 1.1
	Level += 1
