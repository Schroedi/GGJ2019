extends Node2D

# how many seconds to reload
export var turnSpeed = 10
# shots per second
export var fireRate:float = 1.0
export var BaseDmg = 10

var reloadTimeReamining = 0
var targetReady = false

# how much energy does this weapon pull per second in normal operation
export var consumptionPerShot:float = 0

const Helpers = preload("res://Scripts/Helpers.gd")

export var Bullet:PackedScene = preload("res://Scenes/Projectiles/Bullet.tscn")
export var _playerOwned = true setget set_player_owned

var _currentEnemy:WeakRef = null

# we a re in a socket, so the parent of the socket is a tile
onready var tile = get_parent().get_parent()
onready var canonEnd = get_node("Barrel/Muzzle")
onready var barrel = get_node("Barrel")


func get_consumption():
	return consumptionPerShot * fireRate


func set_player_owned(v):
	_playerOwned = v
	# this can be called before the scene's children where initialized (loading)
	if has_node("ShootArea"):
		var sa = $ShootArea
		sa.set_collision_mask_bit(0, not _playerOwned)
		sa.set_collision_mask_bit(1, _playerOwned)

# Calculate complete damage for a given tile lebel
# returns: {"HullDmg":42, "ShieldDmg": 24}
func CalcDamage() -> float:
	var dmg = BaseDmg + Stats.CurrentStats["damage"]
	var crit =Stats.CurrentStats["crit"];
	if(crit>0 and randf()>(1-crit)):
		crit *= (Stats.CurrentStats["critMulti"]+1)		
	return dmg


func _shoot():
	if targetReady:
		# parent is socket and his parent is the ship tile
		var targetChance = Stats.CurrentStats["multiTarget"]
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
			get_node("/root/GameLevel"))
			
		reloadTimeReamining = 1 / (fireRate * Stats.CurrentStats["speed"])
	else:
		#print("aiming")
		pass


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
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	reloadTimeReamining -= delta
	_targeting()
	
	# look at enemy
	if _hasTarget():
		var target = _currentEnemy.get_ref()
		var rot = target.global_position.angle_to_point(global_position)
		barrel.global_rotation = Helpers.lerp_angle(barrel.global_rotation, rot, delta * turnSpeed)
		if abs(barrel.global_rotation - rot) < 0.1:
			targetReady = true
		else: 
			targetReady = false
			
		if reloadTimeReamining <= 0:
			#print("shooting")
			_shoot()
		else:
			#print("reload", reloadTimeReamining, fireRate)
			pass
	else:
		barrel.global_rotation += 	delta * turnSpeed * 0.05


func Save():
	return {"filename": get_filename()}


func SetShowRange(visible:bool):
	$ShootArea/range.visible = visible

