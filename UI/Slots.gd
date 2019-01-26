extends Panel


onready var ItemContainer = get_node("/root/GameLevel/Hud/Inventory/ScrollContainer/ItemContainer")

func _process(delta):
	var items = ItemContainer.get_children()
	var selected = []
	for i in items:
		if i.IsSelected():
			selected.append(i)
	if selected.size() == 1:
		for slot in get_children():
			#$Slot1.get_stylebox("Panel").border_color = Color.pink #"#45ff5e"
			#slot.custom_style.panel.border_color = 
			print("equip now")
