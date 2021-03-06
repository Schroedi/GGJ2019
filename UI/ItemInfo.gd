extends Control

const UiItem = preload("res://UI/UiItem.gd")
var selected:WeakRef

func VisItem(item:UiItem):
	visible = true
	$Name.bbcode_text = item.Item.GetName()
	$Descr.bbcode_text = item.Item.GetTextItem()
	$Upgrade/Cost.text = "%d" % int(item.Item.getCost())
	# tier BG
	var tier = min(item.Item.ItemTier, 5) - 1
	$"Background Tier".texture = GameState.InfoTexTiers[tier]
	# icon
	$Icon.texture = GameState.InfoboxIcons[item.Item.Icon]
	ShowStars(item.Item.ItemStats.size())

func ShowStars(count):
	for i in range(5):
		var s = get_node("Star"+String(i+1))
		s.visible = i < count

func Unshow():
	# hide if no valid selection -> was hover
	visible = hasValidSelection()

func ShowItem(item:UiItem):
	# ignore hover infos if an item is fixed
	if selected:
		return
	VisItem(item)

func unselect():
	visible = false
	$Upgrade.disable()
	
	selected = null

func hasValidSelection():
	return selected and selected.get_ref()

func select(item:UiItem):
	if hasValidSelection():
		selected.get_ref().unselect()
	selected = weakref(item)
	$Upgrade.enable()
	VisItem(item)