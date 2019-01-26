extends Control

const BaseItem = preload("res://Items/BaseItem.gd")
const UiItem = preload("res://UI/UiItem.tscn")

func AddItem(item:BaseItem):
	var ui = UiItem.instance()
	ui.Item = item
	$ScrollContainer/ItemContainer.add_child(ui)


func can_drop_data(position, data):
	return true

func drop_data(position, data):
	print (data)
	data.get_parent().remove_child(data)
	data._on_Item_toggled(false)
	add_child(data)