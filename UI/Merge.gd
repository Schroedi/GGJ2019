extends Control

onready var Inventory = get_node("/root/GameLevel/Hud/Inventory")
onready var ItemContainer = get_node("/root/GameLevel/Hud/Merge/GridContainer")

const BaseItem = preload("res://Items/BaseItem.gd")
var rng = RandomNumberGenerator.new()

func getMergeItems():
	var mergeSlots = ItemContainer.get_children()
	var selected = []
	for i in mergeSlots:
		if i.get_child_count() > 0:
			var item = i.get_child(0)
			selected.append(item)
	return selected

func updateMergeable():
	$Merge.disabled = getMergeItems().size() < 2


func _on_Merge_pressed():
	var selected = getMergeItems()
	# do we have items to merge?
	if selected.size() < 2:
		return
	
	# count how often stats appear in items to weight selection
	var weights = Stats.DropWeights.duplicate()
	var levels = {}
	var oldStatCount = 0
	var oldLevelSum = 0
	for i in selected:
		for s in i.Item.ItemStats:
			oldLevelSum += s.Level
			var stati = Stats.StatIds.find(s.Id)
			# sum stat levels per stat type
			if levels.has(s.Id):
				levels[s.Id] += s.Level
			else:
				oldStatCount += 1
				levels[s.Id] = s.Level
			weights[stati] += 1
	
	# create new item and add it
	var item = BaseItem.new()
	var minStats = min(max(1, oldStatCount / 2), 5)
	var maxStats = max(minStats, min(oldStatCount, 5))
	# min half of old stat count, max old stat count + 1
	var statCount = rng.randi_range(minStats, maxStats)
	for i in statCount:
		var stati = WeightRng.WeightedRng(weights)
		weights[stati] = 0
		item.ItemStats.append(Stats.AlltStats[stati].new())

	# copy stat levels selected from previous items
	for sn in item.ItemStats:
		if levels.has(sn.Id):
			for i in levels[sn.Id]:
				sn.LevelUp()

	# Get sum of current newly created item levels
	var newSum = 0
	for sn in item.ItemStats:
		newSum += sn.Level

	var targetSum = int(rng.randf_range(oldLevelSum, oldLevelSum * 1.1))
	# new item's stats should have same level as average of all old items
	targetSum = targetSum / oldStatCount * statCount
	print ("oldSum: %.2f, targetSum: %.2f" % [oldLevelSum, targetSum])
	# add random levels until we reach our target power
	while newSum < targetSum:
		var id = randi() % statCount
		item.ItemStats[id].LevelUp()
		newSum += 1
	# is the new item too strong?
	while newSum > targetSum:
		var id = randi() % statCount
		item.ItemStats[id].LevelDown()
		newSum -= 1
	

	# set item level as sum of old levels
	item.ItemLvl = 1
	item.ItemTier = statCount
	
	# remove merged items
	var Iteminfo = GameState.Level.get_node("Hud/ItemInfo")
	Iteminfo.unselect()
	for i in selected:
		GameState.ItemCount -= 1
		i.queue_free()
	
	# add new item
	Inventory.AddItem(item)

