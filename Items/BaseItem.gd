extends Node

const popup = preload("res://Scenes/pop_label.tscn")

var ItemStats = []
var ItemLvl:int = 1
# higher tier items are more expensive to level
# based on number of stats?
var ItemTier:int = 1
var Icon = -1 setget setIcon, getIcon
var _name = ""

signal upgraded

func setIcon(v):
	# should only be set by ourself
	print("icon set?!")
	Icon = v

func getIcon():
	if Icon < 0:
		Icon = iconType()
	return Icon

func iconType() -> int:
	var icon = 0
	var maxv = -1
	for s in ItemStats:
		if s.Level > maxv:
			var rid = randi() % s.IconId.size()
			icon = s.IconId[rid]
			maxv = s.Level
	return icon


func GetTextItem() -> String:
	var text = ""
	for s in ItemStats:
		text += s.GetTextItem() + "\n\n"
	
	return text


func GetName() -> String:
	if _name == "":
		var tier = min(ItemTier-1, 5)
		var prefix = NameGen.Tiers[tier][randi() % NameGen.Tiers[tier].size()]
		
		var MainStat = 0
		var maxv = -1
		for s in ItemStats:
			if s.Level > maxv:
				MainStat = s.MainName[randi() % s.MainName.size()]
				maxv = s.Level
		
		var preStat = ""
		if ItemStats.size() > 1:
			var prefixes = ItemStats[randi() % ItemStats.size()].Prefix
			preStat = prefixes[randi() % prefixes.size()]
		
		var randName = NameGen.Randoms[randi() % NameGen.Randoms.size()]
		_name = "%s %s %s %s" % [prefix, preStat, MainStat, randName]
	return _name
	
func getCost():
	var baseCost = ItemTier * 10
	var cost =baseCost *pow(2, ItemLvl-1)
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
	
	var equipped = Stats.IsEquipped(self)
	if equipped:
		Stats.UnEquipItem(self)
		
	for s in ItemStats:
		s.LevelUp()
	ItemLvl += 1
	if equipped:
		Stats.EquipItem(self)
	emit_signal("upgraded")