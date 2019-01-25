extends RigidBody2D
const DamageHelper = preload("res://Scripts/Damage.gd")
onready var Level = get_node("/root/GameLevel")

var _target:WeakRef = null

export var life = 10
export var shield = 200
export var damage = {"HullDmg":50, "ShieldDmg": 0}
var inflictsDamage = true
export var _scrapValue = 50
export var _scrapParts = 4
export var circlePos = 0
export var movementSpeed =20
export var wave =0
export var offset = 10
var consumption = 0 

# TODO: this is needed for the weapon. It needs it for dmg. calculation
var TileLevel = 1

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
	set_scale(scale)
	$LifeBar.max_value = life
	$LifeBar.value = life

func SpawnMoney(value, parts, global_pos, target, owner):
	for i in range(parts):
		var offset = Vector2(rand_range(0, 5), rand_range(0, 5))		

func _die():
	# spawn scrap
	EnemyManager.Enemies.erase(self)
	queue_free()

func _on_BaseEnemy_body_entered(body):
	if "damage" in body :
		_damage(body.damage)
		body.queue_free()
		
func UseEnergy(v):
	return true

# TODO: this is needed for the weapon. It needs it for dmg. calculation
func GetCombinedStats():
	return 0

func _process(delta):
	circlePos += movementSpeed * delta
	global_position = Vector2(-300+offset,0).rotated(deg2rad(circlePos))+Vector2(960,350)
		

func _damage(dmg):
	life-=dmg
	$LifeBar.value = life
	if life < 0:
		_die()