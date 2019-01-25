extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerLifesMax = 40
var playerLifes = 40

var playerGold = 0

# Called when the node enters the scene tree for the first time.
func _ready():		
	EnemyManager.StartSpawn()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func addGold(var g):
	playerGold +=g
