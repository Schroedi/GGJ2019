extends Node2D

export (Vector2) var final_scale = Vector2(1.5, 1.5)
export (float) var distance = 100
export (float) var duration = 0.25

func setColor(var col):
	$label.add_color_override("font_color",col)
func setLabel(var txt):
	$label.text = String(txt)
	pass

func _ready():
	pop()
	
func pop():
	$tween.interpolate_property(self, "scale", scale, final_scale, duration, Tween.TRANS_BACK, Tween.EASE_IN_OUT)
	
	$tween.start()
	yield($tween, "tween_completed")
	
	$tween.interpolate_property(self, "position", position, position + Vector2(0, -distance), duration, Tween.TRANS_SINE, Tween.EASE_IN)
	
	var transparent = modulate
	transparent.a = 0
	$tween.interpolate_property(self, "modulate", modulate, transparent, duration, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$tween.start()
	yield($tween, "tween_completed")
	queue_free()