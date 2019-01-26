extends Node

const GameLevel = preload("res://Scenes/GameLevel.gd")
var ItemStats = []
var ItemLvl:int = 0
# higher tier items are more expensive to level
# based on number of stats?
var ItemTier:int = 1

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
	if (GameState.Level.playerGold < cost):
		print("out of gold")
		return
	GameState.Level.playerGold -= cost
	for s in ItemStats:
		s.LevelUp()
	ItemLvl += 1