extends Node

const BaseItem = preload("res://Items/BaseItem.gd")

# for debugging
const ItemVis = preload("res://Items/ItemVis.tscn")

func CreateItem()->BaseItem:
	var i = BaseItem.new()
	
	var stati = WeightRng.WeightedRng(Stats.DropWeights)
	var stat = Stats.AlltStats[stati]
	
	
	i.ItemStats.append(stat.new())
	i.Icon = randi()%GameState.Icons.size()
	return i

func _ready():
	pass
	#var vis = ItemVis.instance()
	#vis.global_position = Vector2(600, 250)
	#vis.item = ItemGen.CreateItem()
	#get_node("/root/GameLevel").add_child(vis)