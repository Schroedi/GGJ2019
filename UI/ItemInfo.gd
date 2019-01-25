extends Control

const BaseItem = preload("res://Items/BaseItem.gd")

func ShowItem(item:BaseItem):
	$Panel/Name.text = item.GetName()
	$Panel/Descr.text = item.GetText()

