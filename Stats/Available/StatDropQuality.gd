extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Drop Quality[/b]:\nItem drops have [color=red]{0}%[/color] chance to have higher stats".format([value*100] )
	
func _init():
	Id = "dropQuality"
	value = 0.1
	defaultValue = 0