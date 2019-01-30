extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}%".format( ["%.2f" %(value*100)]  )
	
func GetTextItem() -> String:
	return "[color=red]+{0}%[/color][color=black] critical damage[/color]".format( ["%.2f" %(value*100)]  )
	
	
func GetName() ->String:
	return "Critical damage"
	
func _init():
	Id = "critMulti"
	multi = 1/10.0
	add = 0
	defaultValue = 1
	IconId = [10]
	MainName = ["Bomb","Rocket","Missile","Peacemaker","Vehicle","Aircraft","Saturn V","Moonlander","Torpedo"]
	Prefix = ["Exploding","Hurting","Harmful","Destructing","Burning","Wounding","Poisoned","Breaking","Penetrating","Far Reaching"]
	LevelUp()