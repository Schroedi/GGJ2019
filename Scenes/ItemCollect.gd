extends Area2D

onready var Inventory = get_node("/root/GameLevel/Hud/Inventory")

func _on_ItemCollect_body_entered(body):
	if "item" in body:
		Inventory.AddItem(body.item)
		body.queue_free()
