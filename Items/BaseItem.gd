extends Node

var ItemStats = []
var ItemLvl:int = 0
# higher tier items are more expensive to level
# based on number of stats?
var ItemTier:int = 0

func GetText() -> String:
	var text = ""
	for s in ItemStats:
		text += s.GetText() + "\n"
	
	return text


func GetName() -> String:
	return "BaseItem"

func LevelUp():
	var baseCost = ItemTier * 10
	var cost = pow(baseCost, ItemLvl)
	# TODO: check if enough money, inform otherwise
	# TODO: substract money
	for s in ItemStats:
		s.LevelUp()
	ItemLvl += 1