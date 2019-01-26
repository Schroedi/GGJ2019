extends Node

const BaseItem = preload("res://Items/BaseItem.gd")


func CreateItem()->BaseItem:
	var i = BaseItem.new()
	
	var stat = Stats.AlltStats[randi() % Stats.AlltStats.size()]
	
	
	i.ItemStats.append(stat.new())
	return i