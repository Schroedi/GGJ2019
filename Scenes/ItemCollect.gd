extends Area2D

onready var Inventory = get_node("/root/GameLevel/Hud/Inventory")

func TryTakeItem(body):
	if "item" in body:
		if GameState.ItemCount < GameState.MaxItemCount:
			Inventory.AddItem(body.item)
			body.queue_free()

func _on_ItemCollect_body_entered(body):
	TryTakeItem(body)



func _on_TakeFloatingItemsTimer_timeout():
	for body in get_overlapping_bodies():
		TryTakeItem(body)
