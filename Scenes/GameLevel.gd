extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerLifesMax = 40
var playerLifes = 40

var playerGold = 0

var dpsMeter =0

# Called when the node enters the scene tree for the first time.
func _ready():			
	GameState.Level = self
	playerLifes = 40
	playerGold = 0
	EnemyManager.reset()
	Stats._init()
	EnemyManager.StartSpawn()
	Stats.GetAllStats()
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(dpsMeter>1):
		GameState.DPS = (GameState.DPS+GameState.DamageSeconds)/2
		GameState.DamageSeconds = 0
		GameState.DPSmax = max(GameState.DPSmax ,GameState.DPS)
		dpsMeter=0
	dpsMeter+=delta
	pass
	
func addGold(var g):
	playerGold +=g
