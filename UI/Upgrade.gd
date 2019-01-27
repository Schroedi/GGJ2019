extends TextureButton


func _on_Upgrade_pressed():
	var ItemInfo = get_node("..")
	ItemInfo.selected.Item.LevelUp()
	ItemInfo.VisItem(ItemInfo.selected)