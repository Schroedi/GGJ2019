extends Node
const GameLevel = preload("res://Scenes/GameLevel.gd")
onready var _level:GameLevel = get_node("/root/GameLevel")
const BaseEnemy = preload("res://Scenes/BaseEnemy.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const bounceRange = 200
const ElipseA = 350
const ElipseB = 200
const ElipseCenter =Vector2(960,400)

var WaveDuration = 30
var WaveEnemyCount = 10
var WaveSpawnDistance = 1
var WaveMovementSpeed = 50
var WaveLifeBaseLife = 30
var WaveGoldBase = 10
var WaveBossLifeMultiplier = 5

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

func findEnemiesInRange(var enemy, var dist):
	var enemies = []
	for en in Enemies:
		if(en != enemy and (en.global_position-enemy.global_position).length()<dist):
			enemies.append(en)
	return enemies

func StopSpawn():
	set_process(false)


func spawnEnemy():
	var s = BaseEnemy.instance()
	s.offset= rand_range(0,10)
	var x = (EnemyManager.ElipseA + s.offset) * cos(deg2rad(0));
	var y = (EnemyManager.ElipseB + s.offset) * sin(deg2rad(0));
	s.global_position = Vector2(x,y)+ElipseCenter
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
	if(currentWave%10 ==0 ):
		if(currentWaveSpawnsLeft==5):
			s.life = currentWaveLife*WaveBossLifeMultiplier
			s.set_scale(2)
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
		currentWaveSpawnsLeft += WaveEnemyCount + Stats.CurrentStats["enemyCount"]
		currentWaveDuration = WaveDuration
		if(currentWaveSpawnsLeft*WaveSpawnDistance)>WaveDuration:
			WaveSpawnDistance =  WaveDuration / (currentWaveSpawnsLeft+2)
	
	
	#remove stale enemies
	
	currentWaveDuration -= delta		
	pass
