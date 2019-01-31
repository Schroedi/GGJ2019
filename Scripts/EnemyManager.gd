extends Node
const GameLevel = preload("res://Scenes/GameLevel.gd")
const BaseEnemy = preload("res://Scenes/BaseEnemy.tscn")

const popup = preload("res://Scenes/pop_label.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const bounceRange = 300
const ElipseA = 350
const ElipseB = 200
const ElipseCenter = Vector2(969.331,563)

var WaveDuration = 30
var WaveEnemyCount = 10
var WaveSpawnDistance = 1
var WaveMovementSpeed = 50
var WaveLifeBaseLife = 19
var WaveGoldBase = 10
var WaveBossLifeMultiplier = 5

var WaveLifeScaling =1.3
var WaveMovementScaling = 1.05
var WaveGoldScaling = 1.3

var currentWaveGold = WaveGoldBase
var currentWaveLife = WaveLifeBaseLife
var currentWaveMovementSpeed = WaveMovementSpeed
var currentWave = 0
var currentWaveSpawnsLeft = WaveEnemyCount
var currentWaveDuration = WaveDuration
var currentWaveSpawnDistance = WaveSpawnDistance

var lastSpawn = 0


var Enemies = Array()
 
func gameOver():
	StopSpawn()
	Enemies = Array()
	print(get_tree().change_scene("res://UI/GameOver.tscn"))

func reset():
	currentWaveGold = WaveGoldBase
	currentWaveLife = WaveLifeBaseLife
	currentWaveMovementSpeed = WaveMovementSpeed
	currentWave = 1
	currentWaveSpawnsLeft = WaveEnemyCount
	currentWaveDuration = WaveDuration	
	currentWaveSpawnDistance = WaveSpawnDistance

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.


func StartSpawn():
	set_process(true)

func findEnemiesInRange(var enemy, var dist):
	var enemies = []
	for en in Enemies:
		if en != enemy and en.life > 0 and (en.global_position-enemy.global_position).length() <= dist:
			enemies.append(en)
	return enemies

func StopSpawn():
	set_process(false)


func spawnEnemy():
	var s = BaseEnemy.instance()
	s.offset= rand_range(0,10)
	var bosswave = currentWave%10 ==0 and currentWaveSpawnsLeft==5
	var x = (EnemyManager.ElipseA + s.offset) * cos(deg2rad(0));
	var y = (EnemyManager.ElipseB + s.offset) * sin(deg2rad(0));
	s.global_position = Vector2(x,y)+ElipseCenter
	s.circlePos = 0
	s.life = currentWaveLife
	s.movementSpeed = currentWaveMovementSpeed
	s.wave = currentWave
	s.goldValue = currentWaveGold
	GameState.Level.playerLifes-=1
	#s.Owner = _level.owner
	Enemies.append(s)
	if bosswave:		
		s.life = currentWaveLife*WaveBossLifeMultiplier
	
	GameState.Level.add_child(s)
	
	if bosswave:
			s.Texture.rect_scale = Vector2(2,2)
			
	if GameState.Level.playerLifes <0:
		gameOver()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#advance enemy positions

	
	lastSpawn += delta
	#spawn wave enemies
	if(currentWaveSpawnsLeft>0 && lastSpawn > currentWaveSpawnDistance):
		spawnEnemy()
		currentWaveSpawnsLeft -= 1
		lastSpawn = 0
		
	#advance wave
	if(currentWaveDuration<0):
		currentWave += 1
		
		var pl = popup.instance()
		pl.global_position = ElipseCenter-Vector2(150,100)
		pl.setColor(Color.green)
		pl.setLabel("Wave %.0f started"%currentWave)
		pl.makeLargePopup()	
		GameState.Level.add_child(pl)
		
		
		currentWaveLife *= WaveLifeScaling
		currentWaveMovementSpeed *= WaveMovementScaling
		# limit speed
		currentWaveMovementSpeed = min(currentWaveMovementSpeed, 180)
		currentWaveGold *= WaveGoldScaling
		var encount = Stats.CurrentStats["enemyCount"]
		#spawn up to 39 enemies so we don't die instantly
		currentWaveSpawnsLeft += min(WaveEnemyCount + encount, 39)
		currentWaveDuration = WaveDuration
		if(currentWaveSpawnsLeft*currentWaveSpawnDistance)>WaveDuration:
			currentWaveSpawnDistance =  WaveDuration / (currentWaveSpawnsLeft+2)
	
	
	#remove stale enemies
	
	currentWaveDuration -= delta		
	pass
