extends Node2D

const RngDmg = preload("res://Stats/Available/Stat09RandomDamage.gd")

# how many seconds to reload
export var turnSpeed = 10
# shots per second
export var fireRate:float = 1.0

var reloadTimeReamining = 0

var bankTimer = 0
var randomDamageTimer = 0

# how much energy does this weapon pull per second in normal operation
export var consumptionPerShot:float = 0

const Helpers = preload("res://Scripts/Helpers.gd")

export var Bullet:PackedScene = preload("res://Scenes/Projectiles/Bullet.tscn")
export var _playerOwned = true setget set_player_owned

const popup = preload("res://Scenes/pop_label.tscn")
const GameLevel = preload("res://Scenes/GameLevel.gd")

var _currentEnemy:WeakRef = null

# we a re in a socket, so the parent of the socket is a tile
onready var tile = get_parent().get_parent()
onready var canonEnd = get_node("Barrel/Muzzle")
onready var barrel = get_node("Barrel")

var IconObjects = []
var slotVis = {}


func get_consumption():
	return consumptionPerShot * fireRate


func _ready():
	IconObjects = []
	IconObjects.append($Barrel/Panel/ANGEL)
	IconObjects.append($Barrel/Panel/GUMMIBAER)
	IconObjects.append($Barrel/Panel/GUN)
	IconObjects.append($Barrel/Panel/HASE)
	IconObjects.append($Barrel/Panel/HUT)
	IconObjects.append($Barrel/Panel/KAESE)
	IconObjects.append($Barrel/Panel/KAKTUS)
	IconObjects.append($Barrel/Panel/KRAWATTE)
	IconObjects.append($Barrel/Panel/MIC)
	IconObjects.append($Barrel/Panel/RADAR)
	IconObjects.append($Barrel/Panel/ROCKET)
	IconObjects.append($Barrel/Panel/SCHIRM)
	IconObjects.append($Barrel/Panel/SCHUH2)
	IconObjects.append($Barrel/Panel/SCHUH)
	IconObjects.append($Barrel/Panel/SWORD)
	IconObjects.append($Barrel/Panel/TROWER)
	IconObjects.append($Barrel/Panel/WECKER)
	IconObjects.append($Barrel/Panel/ZZZ)

func set_player_owned(v):
	_playerOwned = v
	# this can be called before the scene's children where initialized (loading)
	if has_node("ShootArea"):
		var sa = $ShootArea
		sa.set_collision_mask_bit(0, not _playerOwned)
		sa.set_collision_mask_bit(1, _playerOwned)

# Calculate complete damage for a given tile lebel
func CalcDamage():
	var dmg = Stats.CurrentStats["damage"]
	var crit = min(Stats.CurrentStats["crit"], 1)
	var isCrit = crit > 0 and randf() >= (1 - crit)
	if isCrit:
		dmg += dmg * Stats.CurrentStats["critMulti"]
	return [dmg, isCrit]


func _shoot():
	# parent is socket and his parent is the ship tile
	var targetChance = floor(Stats.CurrentStats["multiTarget"])
	var targets = floor(targetChance)
	var bounceChance = Stats.CurrentStats["bounce"]
	var bounce = floor(bounceChance)
	targetChance -= targets
	if(randf()>1-targetChance):
		targets+=1
	targets+=1
	if(randf()>1-targetChance):
		bounce+=1
	for i in range(targets):
		if(i>=EnemyManager.Enemies.size()):
			break			
		Helpers.fireProjectile(weakref(canonEnd),weakref( EnemyManager.Enemies[i]),
		CalcDamage(),
		bounce, 
		Stats.CurrentStats["splash"]
		,Bullet,
		GameState.Level)
		
	reloadTimeReamining = 1 / (fireRate * Stats.CurrentStats["speed"])


func _hasTarget():
	return _currentEnemy != null and _currentEnemy.get_ref() 


func _select_enemy(bodies):
	""" Select enemy from targets in range """
	var idx = randi() % bodies.size()
	return bodies[idx]


func _targeting():	
# pick a new enemy
	if(EnemyManager.Enemies.size() >0):
		var enemy = EnemyManager.Enemies.front()
		if enemy:
			_currentEnemy = weakref(enemy)
	else:
		_currentEnemy = null
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	reloadTimeReamining -= delta
	_targeting()
	if reloadTimeReamining <= 0:
		#print("shooting")
		_shoot()
	barrel.global_rotation += delta * turnSpeed * 0.05
		
		
	#banking
	if Stats.CurrentStats["bank"] > 0:
		if bankTimer > 1:
			var gold = Stats.CurrentStats["bank"]
			GameState.Level.addGold(gold)
			var pl = popup.instance()
			pl.global_position = global_position+Vector2(rand_range(-50,50),rand_range(-50,50))
			pl.setColor(Color.gold)
			pl.setLabel("%.2f g" % gold)
			GameState.Level.add_child(pl)
			bankTimer = 0
	bankTimer+=delta

	#random Damage
	if Stats.CurrentStats["randomDamage"] > 0:
		var baseSeconds = RngDmg.BaseSeconds
		var multi = RngDmg.DamageLevelMulti
		if(randomDamageTimer > baseSeconds - Stats.CurrentStats["randomDamage"]):
			var dmg = CalcDamage()[0] * rand_range(0.1, 1) * Stats.CurrentStats["randomDamage"] * multi
			if EnemyManager.Enemies.size() > 0:
				var enm = randi()%EnemyManager.Enemies.size()
				var en = EnemyManager.Enemies[enm]
				en._damage([dmg, true])
				randomDamageTimer = 0
	randomDamageTimer+=delta

func Save():
	return {"filename": get_filename()}


func SetShowRange(visible:bool):
	$ShootArea/range.visible = visible

func equip(item, slotId):
	var iconId = item.Icon
	var vis = IconObjects[iconId].duplicate()
	vis.rect_rotation = 360 / 5 * slotId
	vis.visible = true
	$Barrel/Panel.add_child(vis)
	slotVis[item] = vis

func unequip(item):
	if slotVis.has(item):
		var it= slotVis[item]
		slotVis.erase(item)
		it.queue_free()
