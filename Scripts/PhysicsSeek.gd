extends Node2D

# expects to have a Body2D as parent (apply impulse)
# steers towards it

signal TargetReached

# will hold an object reference during runtime
var Target:WeakRef
export var TargetDistance = 500
export var MaxSpeed = 200
export var MaxAcc = 50

export var reachRadius = 20

onready var _parent = get_parent()
var _targetPos = null
onready var _tgtIndicator = $Debug/Tgt
onready var startPos = global_position
var accTime = 0

var debug = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if debug:
		# set the target indicator to global space
		var worldTrans = _tgtIndicator.global_transform
		$Debug.remove_child(_tgtIndicator)
		get_node("/root/Scene/Level").call_deferred("add_child", _tgtIndicator)
		_tgtIndicator.call_deferred("set", "global_transform", worldTrans)
		$Debug.visible = true
		
func _updateTarget():
	var tr = Target.get_ref()
	if not tr:
		_parent.queue_free()
		return
	
	_targetPos = tr.global_position
		# for non physics objects we do not need to retarget
	
	_tgtIndicator.global_position = _targetPos

	
func _physics_process(delta: float) -> void:
	accTime += delta
	if not _targetPos:
		return
	
	# seek
	var desired = _targetPos - global_position
	var d = desired.length()
	
	# are we close enough? div 2 to avoid jitter
	if d < reachRadius / 2:
		$Debug/Dist.text = "Dist: %0.2f / %0.2f" % [d, 0]
		emit_signal("TargetReached")
		return

	desired = desired.normalized()
	
	# arrive, slow down half the target distance before
	# s = v²/2a
	# This assumes we break with constant force
	var currSpeed = get_parent().linear_velocity.length()
	var slowDist = (currSpeed * currSpeed) / (2.0 * MaxAcc)
	$Debug/Dist.text = "Dist: %0.2f / %0.2f" % [d, slowDist]
	if d <= slowDist:
		desired = Vector2()
		$Debug/Slowing.text = "Slowing = True"
	else:
		desired *= MaxSpeed
		$Debug/Slowing.text = "Slowing = False"
	
	$Debug/Desired.text = "Desired: " + str(desired)
	$Debug/Vel.text = "Vel: " + str(_parent.linear_velocity)
	var steer = desired - _parent.linear_velocity
	
	## F = m * a
	# acceleration
	steer = steer / delta
	steer = steer.clamped(MaxAcc)
	# Force
	steer = steer * get_parent().mass
	$Debug/Steer.text = "Steer: " + str(steer)
	#_parent.applied_force = Vector2()
	#_parent.add_central_force(steer)
	_parent.apply_central_impulse(steer * delta)
	_parent.rotation = _parent.linear_velocity.angle()


func _process(delta) -> void:
	_updateTarget()
	pass # Replace with function body.


func _on_Seek2D_tree_exiting() -> void:
	_tgtIndicator.queue_free()
	pass # Replace with function body.
