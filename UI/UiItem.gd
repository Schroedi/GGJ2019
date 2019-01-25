extends TextureButton



func _on_Item_toggled(button_pressed):
	$Highlight.visible = button_pressed


func IsSelected()->bool:
	return $Highlight.visible