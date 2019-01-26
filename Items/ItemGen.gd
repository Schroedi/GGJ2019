extends Node

const BaseItem = preload("res://Items/BaseItem.gd")


func CreateItem()->BaseItem:
	var i = BaseItem.new()
	
	var stati = WeightRng.WeightedRng(Stats.DropWeights)
	var stat = Stats.AlltStats[stati]
	
	
	i.ItemStats.append(stat.new())
	return i