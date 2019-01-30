extends "res://Stats/BaseStat.gd"
func GetText() -> String:	
	return ("{0}").format(["%.2f" %value] )
	
func GetTextItem() -> String:	
	return ("[color=black]Fires at [/color][color=red]{0}[/color][color=black] additional targets[/color]").format( ["%.2f" %value] )	

func GetName() ->String:
	return "Hit additional targets"
	
func _init():
	Id = "multiTarget"
	multi = 1/10.0
	add = 1
	defaultValue = 0
	IconId = [2]
	MainName = ["Cannon","Weapon","Firearm","Gun","Pistol","Revolver","Rifle","Handgun","Shotgun","Taser","Musket"]
	Prefix = ["Squinting","Doubling","Multidimensional","Complex","Dual","Multifunctional","Multiplying","Multi Barrel","Quickdraw"]
	LevelUp()