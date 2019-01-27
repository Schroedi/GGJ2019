extends Control

const UiItem = preload("res://UI/UiItem.gd")
var selected = null

func VisItem(item:UiItem):
	$Name.bbcode_text = item.Item.GetName()
	$Descr.bbcode_text = item.Item.GetTextItem()
	$Upgrade/Cost.text = "%d" % int(item.Item.getCost())
	# TODO tier BG
	var tier = min(item.Item.ItemTier, 5) - 1
	$"Background Tier".texture = GameState.InfoTexTiers[tier]
	# icon
	$Icon.texture = GameState.InfoboxIcons[item.Item.Icon]

func ShowItem(item:UiItem):
	# ignore hover infos if an item is fixed
	if selected:
		return
	VisItem(item)

func unselect():
	$Upgrade.disable()
	
	selected = null

func select(item:UiItem):
	if selected:
		selected.unselect()
	selected = item
	$Upgrade.enable()
	VisItem(selected)