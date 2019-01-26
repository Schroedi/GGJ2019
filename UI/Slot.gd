extends Control

func can_drop_data(position, data):
	return true


func drop_data(position, data):
	# do we have an item already?
	var old_item = get_child(0)
	if old_item:
		Stats.UnEquipItem(old_item.Item)
		data.get_parent().add_child(old_item)
		remove_child(old_item)
	
	data.get_parent().remove_child(data)
	data._on_Item_toggled(false)
	data.rect_position = Vector2()
	add_child(data)
	Stats.EquipItem(data.Item)
	