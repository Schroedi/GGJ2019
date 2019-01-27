extends TextureButton

const BaseItem = preload("res://Items/BaseItem.gd")

onready var ItemInfo = get_node("/root/GameLevel/Hud/ItemInfo")
onready var Item:BaseItem

func IsSelected()->bool:
	return $Highlight.visible


func get_drag_data(position):
    set_drag_preview(self.duplicate())
    return self


func _on_UiItem_mouse_entered():
	ItemInfo.ShowItem(Item)


func _on_UiItem_mouse_exited():
	pass # Replace with function body.


func unselect():
	if IsSelected():
		ItemInfo.unselect()
		$Highlight.visible = false

func _on_UiItem_pressed():
	# toggle highlight if in inventory
	# fix upgrade info if highlighted
	# unhighlight all other
	$Highlight.visible = not $Highlight.visible
	if IsSelected():
		ItemInfo.select(self.Item)
	else:
		ItemInfo.unselect()
