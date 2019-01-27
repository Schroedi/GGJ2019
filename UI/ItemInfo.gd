extends Control

const BaseItem = preload("res://Items/BaseItem.gd")
var selected = null

func VisItem(item:BaseItem):
	$Name.bbcode_text = item.GetName()
	$Descr.bbcode_text = item.GetTextItem()

func ShowItem(item:BaseItem):
	# ignore hover infos if an item is fixed
	if selected:
		return
	VisItem(item)

func unselect():
	selected = null

func select(item:BaseItem):
	selected = item
	VisItem(selected)