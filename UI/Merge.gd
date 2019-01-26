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
	
	# TODO collect stats
	
	# TODO create new item and add it
	
	# remove merged items
	for i in selected:
		i.queue_free()
