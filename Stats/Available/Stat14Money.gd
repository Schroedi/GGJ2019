extends "res://Stats/BaseStat.gd"
func GetText() -> String:
	return "{0}".format( ["%.1f"%value] )
	
func GetTextItem() -> String:
	return "[color=black]Targets drop [color=red]{0}[/color][color=black] more gold[/color]".format( ["%.1f"%value])	
	
	

func GetName() ->String:
	return "Additional gold dropped by targets"
	
func _init():
	Id = "money"
	multi = 10
	defaultValue = 0 
	IconId = [3]
	MainName = ["Bunny","Rabbit","Mammal","Pika","Furry","Predator","Chipmunk","Fairy"]
	Prefix = ["Robbing","Pickpocketing","Bandit","Hacking","Stalking","Assassinating","Shoplifting","Polishing","Refurbishing","Reselling","Expensive"]
	LevelUp()