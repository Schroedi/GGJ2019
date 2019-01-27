extends NinePatchRect

func has_item():
	return get_child_count() > 0

func can_drop_data(position, data):
	return not has_item()


func drop_data(position, data):
	data.get_parent().remove_child(data)
	data._on_Item_toggled(false)
	data.rect_position = Vector2()
	add_child(data)