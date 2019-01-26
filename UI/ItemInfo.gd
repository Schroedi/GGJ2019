extends Control

const BaseItem = preload("res://Items/BaseItem.gd")

func ShowItem(item:BaseItem):
	$Panel/Name.bbcode_text = item.GetName()
	$Panel/Descr.bbcode_text = item.GetText()

