extends TextureButton

onready var Inventory = get_node("/root/GameLevel/Hud/Inventory")
onready var ItemContainer = get_node("/root/GameLevel/Hud/Inventory/ScrollContainer/ItemContainer")

const BaseItem = preload("res://Items/BaseItem.gd")

func _on_Upgrade_pressed():
	var items = ItemContainer.get_children()
	var selected = []
	for i in items:
		if i.IsSelected():
			selected.append(i)
	
	for i in selected:
		i.Item.LevelUp()