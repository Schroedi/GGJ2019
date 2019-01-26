extends Area2D



func _on_ItemCollect_body_entered(body):
	if "item" in body:
		# TODO add body.item to inventory
		body.queue_free()
