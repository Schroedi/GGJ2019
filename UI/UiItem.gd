extends TextureButton

const BaseItem = preload("res://Items/BaseItem.gd")

onready var ItemInfo = get_node("/root/GameLevel/Hud/ItemInfo")
var Item:BaseItem = BaseItem.new()

func _on_Item_toggled(button_pressed):
	ItemInfo.ShowItem(Item)
	$Highlight.visible = button_pressed


func IsSelected()->bool:
	return $Highlight.visible