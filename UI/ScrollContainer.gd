extends ScrollContainer


func can_drop_data(position, data):
	return true

func drop_data(position, data):
	data.get_parent().remove_child(data)
	data.unselect()
	$ItemContainer.add_child(data)