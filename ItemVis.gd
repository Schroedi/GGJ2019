extends Node2D

const BaseItem = preload("res://Items/BaseItem.gd")

var item:BaseItem

func _ready():
	$Seek2D.Target = weakref(get_node("/root/GameLevel/Weapon"))
