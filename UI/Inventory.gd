extends Control

const BaseItem = preload("res://Items/BaseItem.gd")
const UiItem = preload("res://UI/UiItem.tscn")

func AddItem(item:BaseItem):
	var ui = UiItem.instance()
	ui.Item = item
	$Panel.add_child(ui)
