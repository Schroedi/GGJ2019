extends Control

onready var ItemContainer = get_node("../Inventory/Panel/ScrollContainer/ItemContainer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Merge_pressed():
	var items = ItemContainer.get_children()
	var selected = []
	for i in items:
		if i.IsSelected():
			selected.append(i)
	
	# count how often stats appear in items to weight selection
	var weights = Stats.DropWeights.duplicate()
	for i in selected:
		for s in i.ItemStats:
			var stati = Stats.StatIds.find(s.Id)
			weights[stati] += 1
	
	# TODO create new item and add it
	
	# remove merged items
	for i in selected:
		i.queue_free()
