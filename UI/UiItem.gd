extends TextureButton

const BaseItem = preload("res://Items/BaseItem.gd")
const ItemGen = preload("res://Items/ItemGen.gd")

onready var ItemInfo = get_node("/root/GameLevel/Hud/ItemInfo")
onready var Item:BaseItem = ItemGen.CreateItem()	

func _on_Item_toggled(button_pressed):
	ItemInfo.ShowItem(Item)
	$Highlight.visible = button_pressed


func IsSelected()->bool:
	return $Highlight.visible