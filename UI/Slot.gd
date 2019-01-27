extends Control

func can_drop_data(position, data):
	return true


func drop_data(position, data):
	# do we have an item already?
	if get_child_count() > 0:
		var old_item = get_child(0)
		Stats.UnEquipItem(old_item.Item)
		data.get_parent().add_child(old_item)
		remove_child(old_item)
	
	data.get_parent().remove_child(data)
	data.unselect()
	data.rect_position = Vector2()
	add_child(data)
	Stats.EquipItem(data.Item)
	GameState.ItemCount -= 1
	
	var slotId = get_parent().SlotId
	var weapon = GameState.Level.get_node("Weapon")
	# it could have been equiped
	weapon.unequip(data.Item)
	weapon.equip(data.Item, slotId)
	