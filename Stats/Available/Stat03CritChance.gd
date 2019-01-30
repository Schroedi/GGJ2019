extends "res://Stats/BaseStat.gd"

func GetText() -> String:
	return "{0}%".format(   ["%.2f" %(value*100)] )
	
func GetTextItem() -> String:
	return "[color=red]+{0}%[/color][color=black] chance to hit critical[/color]".format(   ["%.2f" %(value*100)] )
		
func GetName() ->String:
	return "Critical hit chance"
	
func _init():
	Id = "crit"
	multi = 1/100.0
	add = 0.05
	defaultValue = 0
	IconId = [9]
	MainName = ["Antenna","Radar","Scanner","Radio","Transmitter","Sensor"]
	Prefix = ["Exakt","Precise","Homing","Aiming","Targeting","Aiding","Corrected","Refined","Fortune Telling"]
	LevelUp()