extends Control

const BaseItem = preload("res://Items/BaseItem.gd")

func ShowItem(item:BaseItem):
	$Name.bbcode_text = item.GetName()
	$Descr.bbcode_text = item.GetTextItem()
	

