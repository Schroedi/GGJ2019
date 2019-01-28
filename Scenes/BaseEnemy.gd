extends RigidBody2D
const DamageHelper = preload("res://Scripts/Damage.gd")
const Helpers = preload("res://Scripts/Helpers.gd")
const GameLevel = preload("res://Scenes/GameLevel.gd")
const ItemVis = preload("res://Items/ItemVis.tscn")
const popup = preload("res://Scenes/pop_label.tscn")
const Bullet = preload("res://Scenes/Projectiles/Bullet.tscn")

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

func set_scale(scale):
	# Override behaviour only if it is a RigidBody2D and do not touch other nodes
	if self is RigidBody2D:
		for child in self.get_children():
			if not "scale" in child:
				# skip ui elements for now
				continue
			if not child.has_meta("original_scale"):
				# save original scale and position as a reference for future modifications
				child.set_meta("original_scale",child.scale)
				child.set_meta("original_pos",child.position)
			var original_scale = child.get_meta("original_scale")
			var original_pos = child.get_meta("original_pos")
			# When scaled, position also has to be changed to keep offset
			child.position = original_pos * scale
			child.scale = original_scale * scale
	else:
		.set_scale(scale)

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
	if randf() < 0.2 * (1+Stats.CurrentStats["dropRate"]):
		var vis = ItemVis.instance()
		vis.global_position = global_position
		vis.item = ItemGen.CreateItem()
		GameState.Level.add_child(vis)

func _die():
	# spawn scrap
	goldValue += Stats.CurrentStats["money"]
	GameState.Level.addGold(goldValue) #todo scale on increased gold
	var pl = popup.instance()
	pl.global_position = global_position+Vector2(rand_range(-50,50),rand_range(-50,50))
	pl.setColor(Color.gold)
	pl.setLabel(String(goldValue)+"g")
	
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
	_damage(bullet.damage)
	if bullet.splash > 0:
		var enms = EnemyManager.findEnemiesInRange(self, bullet.splash)
		for en in enms:
			var isLast = en == bullet.Source.get_ref()
			var isNotEnemy = not (en.get_class() == self.get_class())
			if  isLast or isNotEnemy :
				continue
			else:
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
		var slowstat = min(0.9, Stats.CurrentStats["slow"].x)
		slow = 1 - slowstat / 100.0 
	circlePos += movementSpeed * delta *slow
	var x = (EnemyManager.ElipseA+offset) * cos(deg2rad(circlePos));
	var y = (EnemyManager.ElipseB+offset) * sin(deg2rad(circlePos));
	global_position = Vector2(x,y)+EnemyManager.ElipseCenter
	slowtimer-=delta


func _damage(dmg):
	if life < 0:
		return
	life-=dmg
	var pl = popup.instance()
	pl.global_position = global_position+Vector2(rand_range(-50,50),rand_range(-50,50))
	pl.setColor(Color.red)
	pl.setLabel(dmg)
	GameState.Level.call_deferred("add_child", pl)
	#Level.add_child(pl)
	$LifeBar.value = life
	#slow
	if Stats.CurrentStats["slow"].x>0:
		slowtimer = Stats.CurrentStats["slow"].y
	GameState.DamageSeconds += dmg
	if life < 0:
		_die()
