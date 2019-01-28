extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}" .format( ["%.2f" %value]  )
	
func GetTextItem() -> String:
	return "[color=red]+{0}[/color][color=black] additional base damage[/color]" .format(["%.2f" %value] )
	
func GetName() ->String:
	return "Base damage"
	
func _init():
	Id = "damage"
	value = 1
	defaultValue = 0
	IconId = [14]
	Prefix = ["Hurting","Sharpened","Wounding","Slashing","Brutal","Rough","Spiked","Strong","Hard","Robust","Solid","Powerfull","Full Metal","Wooden","Copper"]
	MainName = ["Cleaver","Dagger","Sword","Broadsword","Weapon"]