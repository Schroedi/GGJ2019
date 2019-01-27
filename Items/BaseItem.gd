extends Node

const popup = preload("res://Scenes/pop_label.tscn")

var ItemStats = []
var ItemLvl:int = 0
# higher tier items are more expensive to level
# based on number of stats?
var ItemTier:int = 1

func GetTextItem() -> String:
	var text = ""
	for s in ItemStats:
		text += s.GetTextItem() + "\n\n"
	
	return text


func GetName() -> String:
	return "Legendary epic greatsword of Item, AKA Base Item"

func getCost():
	var baseCost = ItemTier * 10
	var cost = pow(baseCost, ItemLvl)
	return cost

func LevelUp():
	var cost = getCost()
	if (GameState.Level.playerGold < cost):
		var pl = popup.instance()
		pl.global_position = Vector2(340,600)
		pl.setColor(Color.red)
		pl.setLabel("Not enough Gold")	
		GameState.Level.add_child(pl)
		return
	GameState.Level.playerGold -= cost
	for s in ItemStats:
		s.LevelUp()
	ItemLvl += 1