extends RigidBody2D
const DamageHelper = preload("res://Scripts/Damage.gd")
const Helpers = preload("res://Scripts/Helpers.gd")
const GameLevel = preload("res://Scenes/GameLevel.gd")
const ItemVis = preload("res://Items/ItemVis.tscn")
const popup = preload("res://Scenes/pop_label.tscn")
const Bullet = preload("res://Scenes/Projectiles/Bullet.tscn")
onready var Level:GameLevel = get_node("/root/GameLevel") 

var EnemyIcons = []


func _init():
	loadAllStats("res://Assets/Scrap/")
	
func loadAllStats(path):
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with(".") and not file.ends_with(".import"):
			var stat = load(path+file)
			EnemyIcons.append(stat)
	dir.list_dir_end()


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

func SpawnMoney(value, parts, global_pos, target, owner):
	for i in range(parts):
		var offset = Vector2(rand_range(0, 5), rand_range(0, 5))		

func _spawnItem():
	var vis = ItemVis.instance()
	vis.global_position = global_position
	vis.item = ItemGen.CreateItem()
	Level.add_child(vis)

func _die():
	# spawn scrap
	goldValue += Stats.CurrentStats["money"]
	Level.addGold(goldValue) #todo scale on increased gold
	var pl = popup.instance()
	pl.global_position = global_position+Vector2(rand_range(-50,50),rand_range(-50,50))
	pl.setColor(Color.gold)
	pl.setLabel(String(goldValue)+"g")
	
	Level.add_child(pl)
	Level.playerLifes+=1
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
	
func _on_BaseEnemy_body_entered(body):
	
	if "damage" in body and body.damage > 0 and body.Target.get_ref()==self:
		_damage(body.damage)
		if("splash" in body and body.splash>0):
			var enms =EnemyManager.findEnemiesInRange(self,body.splash)
			for en in enms:
				var isLast = en == body.Source.get_ref()
				var isSelf =  en == self 
				var isNotEnemy = not (en.get_class() == self.get_class())
				if  isLast  or isSelf or isNotEnemy :	
					continue
				else:	
					en._damage(body.damage)
		if "targetBounce" in body and body.targetBounce>0:
			var enms =EnemyManager.findEnemiesInRange(self,EnemyManager.bounceRange)
			for en in enms:
				var isLast = en == body.Source.get_ref()
				var isSelf =  en == self 
				var isNotEnemy = not (en.get_class() == self.get_class())
				if  isLast  or isSelf or isNotEnemy :	
					continue
				else:	
					call_deferred("bounceProjectile",weakref(self),weakref(en),
					body.damage,
					body.targetBounce-1, 
					0
					,Bullet,
					Level)
					break
		
		# this projective cannot damage other bodies anymore
		body.damage = 0
		body.queue_free()
		
		
func UseEnergy(v):
	return true

# TODO: this is needed for the weapon. It needs it for dmg. calculation
func GetCombinedStats():
	return 0

func _process(delta):
	var slow = 1
	if slowtimer>0 :
		slow = 1-Stats.CurrentStats["slow"].x/100.0 
	circlePos += movementSpeed * delta *slow
	var x = (EnemyManager.ElipseA+offset) * cos(deg2rad(circlePos));
	var y = (EnemyManager.ElipseB+offset) * sin(deg2rad(circlePos));
	global_position = Vector2(x,y)+EnemyManager.ElipseCenter
	slowtimer-=delta
		

func _damage(dmg):
	life-=dmg	
	var pl = popup.instance()
	pl.global_position = global_position+Vector2(rand_range(-50,50),rand_range(-50,50))
	pl.setColor(Color.red)
	pl.setLabel(dmg)
	Level.call_deferred("add_child", pl)
	#Level.add_child(pl)
	$LifeBar.value = life
	#slow
	if Stats.CurrentStats["slow"].x>0:
		slowtimer = Stats.CurrentStats["slow"].y
	
	if life < 0:
		_die()
