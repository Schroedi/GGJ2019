extends Node

const BaseItem = preload("res://Items/BaseItem.gd")

# for debugging
const ItemVis = preload("res://Items/ItemVis.tscn")

func CreateItem(quality)->BaseItem:
	var i = BaseItem.new()
	
	var statcount = min(max(1, int(quality / 10)), 5)
	for sc in statcount:
		var stati = WeightRng.WeightedRng(Stats.DropWeights)
		var stat = Stats.AlltStats[stati]
		i.ItemStats.append(stat.new())
	
	var targetPower = max(1, quality)
	Stats.adjustToPower(i, targetPower)
	
	return i

func _ready():
	return
	for i in range(10):
		var vis = ItemVis.instance()
		vis.global_position = Vector2(600, 250)
		vis.item = ItemGen.CreateItem(25)
		get_node("/root/GameLevel").add_child(vis)