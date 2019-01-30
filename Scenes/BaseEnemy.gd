extends Node2D
const DamageHelper = preload("res://Scripts/Damage.gd")
const Helpers = preload("res://Scripts/Helpers.gd")
const GameLevel = preload("res://Scenes/GameLevel.gd")
const ItemVis = preload("res://Items/ItemVis.tscn")
const popup = preload("res://Scenes/pop_label.tscn")
const Bullet = preload("res://Scenes/Projectiles/Bullet.tscn")
const StatSlow = preload("res://Stats/Available/Stat11Slow.gd")

var EnemyIcons = []


func _init():
	EnemyIcons = GameState.scrap
	


var _target:WeakRef = null

export var life = 10
export var shield = 200
export var damage = {"HullDmg":50, "ShieldDmg": 0}
var inflictsDamage = true
export var goldValue =0
export var circlePos = 0
export var movementSpeed =20
export var wave =0
export var offset = 10
export var slowtimer =0
onready var Texture = $TextureRect

# Called when the node enters the scene tree for the first time.
func _ready():
	# physics currently are not really scalable, this is a workaround
	# https://godotengine.org/qa/3299/can-i-change-the-default-size-of-an-object-like-rigidbody2d
	var scrapid = randi()%EnemyIcons.size()
	$TextureRect.texture = EnemyIcons[scrapid]
	
	set_scale(scale)
	$LifeBar.max_value = life
	$LifeBar.value = life

func _spawnItem():
	if randf() < 0.25 * (1+Stats.CurrentStats["dropRate"]):
		var vis = ItemVis.instance()
		vis.global_position = global_position
		vis.item = ItemGen.CreateItem(Stats.CurrentStats["dropQuality"])
		GameState.Level.add_child(vis)

func _die():
	# spawn scrap
	goldValue += Stats.CurrentStats["money"]
	GameState.Level.addGold(goldValue) #todo scale on increased gold
	var pl = popup.instance()
	pl.global_position = global_position+Vector2(rand_range(-50,50),rand_range(-50,50))
	pl.setColor(Color.gold)
	pl.setLabel("%.1f g" % goldValue)
	
	GameState.Level.add_child(pl)
	GameState.Level.playerLifes+=1
	call_deferred("_spawnItem")
	EnemyManager.Enemies.erase(self)
	queue_free()

func bounceProjectile(var src, var target,var dmg,var bounceLeft,var splash, var bullet,var level):
	Helpers.fireProjectile(src,target,
					dmg,
					bounceLeft, 
					splash,
					bullet,
					level)

func BulletHit(bullet):
	if bullet.splash > 0:
		var enms = EnemyManager.findEnemiesInRange(self, bullet.splash)
		for en in enms:
			var isLast = en == bullet.Source.get_ref()
			if not isLast:
				en._damage(bullet.damage)
	if bullet.targetBounce > 0:
		var enms = EnemyManager.findEnemiesInRange(self, EnemyManager.bounceRange)
		for en in enms:
			var isLast = en == bullet.Source.get_ref()
			var isNotEnemy = not (en.get_class() == self.get_class())
			if  isLast or isNotEnemy:
				continue
			else:
				call_deferred("bounceProjectile", weakref(self), weakref(en),
				bullet.damage,
				bullet.targetBounce-1, 
				0
				,Bullet,
				GameState.Level)
				break
	
	_damage(bullet.damage)
	# this projective cannot damage other bodies anymore
	bullet.damage = 0
	bullet.queue_free()


func UseEnergy(v):
	return true

# TODO: this is needed for the weapon. It needs it for dmg. calculation
func GetCombinedStats():
	return 0

func _process(delta):
	var slow = 1
	if slowtimer>0 :
		# cap slow at 90%
		var slowstat = min(90, Stats.CurrentStats["slow"])
		slow = 1 - (slowstat / 100.0)
	circlePos += movementSpeed * delta * slow
	var x = (EnemyManager.ElipseA+offset) * cos(deg2rad(circlePos));
	var y = (EnemyManager.ElipseB+offset) * sin(deg2rad(circlePos));
	global_position = Vector2(x,y)+EnemyManager.ElipseCenter
	slowtimer-=delta


func _damage(dmg):
	if life < 0:
		return
	life-=dmg[0]
	
	# crit
	if dmg[1]:
		var pl = popup.instance()
		pl.global_position = global_position+Vector2(rand_range(-50,50),rand_range(-50,50))
		pl.setColor(Color.red)
		pl.setLabel("%.0f" % dmg[0])
		GameState.Level.add_child(pl)
	
	$LifeBar.value = life
	#slow
	if Stats.CurrentStats["slow"]>0:
		slowtimer = StatSlow.SlowTime
	GameState.DamageSeconds += dmg[0]
	if life < 0:
		_die()
