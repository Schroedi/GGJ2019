extends Panel

func can_drop_data(position, data):
	return true


func drop_data(position, data):
	print (data)
	data.get_parent().remove_child(data)
	data._on_Item_toggled(false)
	add_child(data)
	