extends RigidBody2D

var damage = 0
export var velocity = 1000
var dir = Vector2(1, 0)
var inflictsDamage = true
var Target:WeakRef
var Source:WeakRef
var targetBounce = 0
var splash = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_linear_velocity(linear_velocity + dir * velocity)
	$Seek2D.Target = Target
	# orientate along velocity
	rotation = linear_velocity.angle()
	$Seek2D.connect("TargetReached", self, "arrived")

func arrived():
	if Target.get_ref():
		Target.get_ref().BulletHit(self)
	else:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
