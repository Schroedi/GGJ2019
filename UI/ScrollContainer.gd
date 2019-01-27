extends ScrollContainer


func can_drop_data(position, data):
	return true

func drop_data(position, data):
	Stats.UnEquipItem(data.Item)
	data.get_parent().remove_child(data)
	data.unselect()
	$ItemContainer.add_child(data)
	var weapon = GameState.Level.get_node("Weapon")
	weapon.unequip(data.Item)