extends Node
const GameLevel = preload("res://Scenes/GameLevel.gd")
onready var _level:GameLevel = get_node("/root/GameLevel")
const BaseEnemy = preload("res://Scenes/BaseEnemy.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var WaveDuration = 30
var WaveEnemyCount = 10
var WaveSpawnDistance = 1.5
var WaveMovementSpeed = 20
var WaveLifeBaseLife = 10
var WaveGoldBase = 10

var WaveLifeScaling =1.1
var WaveMovementScaling = 1.05
var WaveGoldScaling = 1.05

var currentWaveGold = WaveGoldBase
var currentWaveLife = WaveLifeBaseLife
var currentWaveMovementSpeed = WaveMovementSpeed
var currentWave = 0
var currentWaveSpawnsLeft = WaveEnemyCount
var currentWaveDuration = WaveDuration
var lastSpawn = 0


var Enemies = Array()
 

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


func StartSpawn():
	set_process(true)


func StopSpawn():
	set_process(false)


func spawnEnemy():
	var s = BaseEnemy.instance()
	var offset = Vector2()	
	s.offset= rand_range(0,10)
	s.global_position = Vector2(-300+s.offset,0)+Vector2(960,350)
	s.linear_velocity =  Vector2(0,0)
	s.circlePos = 0
	
	s.life = currentWaveLife
	s.movementSpeed = currentWaveMovementSpeed
	s.wave = currentWave
	s.goldValue = currentWaveGold
	_level.playerLifes-=1
	#s.Owner = _level.owner
	Enemies.append(s)
	_level.add_child(s)
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#advance enemy positions

	
	lastSpawn += delta
	#spawn wave enemies
	if(currentWaveSpawnsLeft>0 && lastSpawn > WaveSpawnDistance):
		spawnEnemy()
		currentWaveSpawnsLeft -= 1
		lastSpawn = 0
		
	#advance wave
	if(currentWaveDuration<0):
		currentWave += 1
		currentWaveLife *= WaveLifeScaling
		currentWaveMovementSpeed *= WaveMovementScaling
		currentWaveGold *= WaveGoldScaling
		currentWaveSpawnsLeft += WaveEnemyCount
		currentWaveDuration = WaveDuration
	
	
	#remove stale enemies
	
	currentWaveDuration -= delta		
	pass
