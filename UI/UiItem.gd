extends TextureButton

const BaseItem = preload("res://Items/BaseItem.gd")

onready var ItemInfo = get_node("/root/GameLevel/Hud/ItemInfo")
onready var Item:BaseItem setget setItem

func setItem(v):
	Item = v
	updateVis()
	v.connect("upgraded", self, "updateVis")

func updateVis():
	var stars = Item.ItemTier
	var starID = min(stars - 1, 4)
	$Star.texture = GameState.StarTex[starID]
	
	var tier = min(Item.ItemLvl, 5) - 1
	texture_normal = GameState.ItemTexTiers[tier]
	$icon.texture = GameState.Icons[Item.Icon]

func IsSelected()->bool:
	return $Highlight.visible


func get_drag_data(position):
    set_drag_preview(self.duplicate())
    return self


func _on_UiItem_mouse_entered():
	ItemInfo.ShowItem(self)


func _on_UiItem_mouse_exited():
	ItemInfo.Unshow()


func unselect():
	if IsSelected():
		ItemInfo.unselect()
		$Highlight.visible = false

func _on_UiItem_pressed():
	$Highlight.visible = not $Highlight.visible
	if IsSelected():
		ItemInfo.select(self)
	else:
		ItemInfo.unselect()
