extends Control

onready var Inventory = get_node("/root/GameLevel/Hud/Inventory")
onready var ItemContainer = get_node("/root/GameLevel/Hud/Inventory/ScrollContainer/ItemContainer")

const BaseItem = preload("res://Items/BaseItem.gd")
var rng = RandomNumberGenerator.new()

func _on_Merge_pressed():
	var items = ItemContainer.get_children()
	var selected = []
	for i in items:
		if i.IsSelected():
			selected.append(i)
	
	# count how often stats appear in items to weight selection
	var weights = Stats.DropWeights.duplicate()
	for i in selected:
		for s in i.Item.ItemStats:
			var stati = Stats.StatIds.find(s.Id)
			weights[stati] += 1
	
	# TODO create new item and add it
	var item = BaseItem.new()
	var statCount = rng.randi_range(1,4)
	for i in statCount:
		var stati = WeightRng.WeightedRng(weights)
		weights[stati] = 0
		item.ItemStats.append(Stats.AlltStats[stati].new())

	# TODO set stat level

	# TODO set item level
	
	# remove merged items
	for i in selected:
		i.queue_free()
	
	# add new item
	Inventory.AddItem(item)

