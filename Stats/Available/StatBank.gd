extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "[b]Bank[/b]:\ngenerates [color=red]{1} gold[/color]  per [color=red]{0} seconds[/color]".format(value)
	
func _init():
	Id = "bank"
	value = [5,1]

func Equip():
	Stats.CurrentStats[Id][0] += value[0]
	Stats.CurrentStats[Id][1] += value[1]

func Unequip():
	Stats.CurrentStats[Id][0] -= value[0]
	Stats.CurrentStats[Id][1] -= value[1]
