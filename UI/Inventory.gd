extends Control

const BaseItem = preload("res://Items/BaseItem.gd")
const UiItem = preload("res://UI/UiItem.tscn")

func AddItem(item:BaseItem):
	var ui = UiItem.instance()
	ui.Item = item
	$ScrollContainer/ItemContainer.add_child(ui)
	GameState.ItemCount += 1

