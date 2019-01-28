extends TextureRect

func has_item():
	return get_child_count() > 0

func can_drop_data(position, data):
	return not has_item()


func drop_data(position, data):
	Stats.UnEquipItem(data.Item)
	data.get_parent().remove_child(data)
	data.unselect()
	data.rect_position = Vector2(-6, -6)
	add_child(data)
	var weapon = GameState.Level.get_node("Weapon")
	weapon.unequip(data.Item)