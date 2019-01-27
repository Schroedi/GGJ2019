extends Node

onready var Level = get_node("/root/GameLevel") 

# How many Items does the player have
var ItemCount = 0
var MaxItemCount = 20

var ItemTexTiers = [load("res://Assets/icons/tier0.png"), 
	load("res://Assets/icons/tier1.png"),
	load("res://Assets/icons/tier2.png"),
	load("res://Assets/icons/tier3.png"),
	load("res://Assets/icons/tier4.png"),
	load("res://Assets/icons/tier5.png")]