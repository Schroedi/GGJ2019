extends TextureButton


func _on_Upgrade_pressed():
	var ItemInfo = get_node("..")
	if not ItemInfo.selected or not ItemInfo.selected.get_ref():
		return
	var selected = ItemInfo.selected.get_ref()
	selected.Item.LevelUp()
	ItemInfo.VisItem(selected)

func enable():
	disabled = false

func disable():
	disabled = true
