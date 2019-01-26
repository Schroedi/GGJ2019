extends RichTextLabel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	bbcode_text = ""
	for statObj in Stats.AlltStats:
		var stat =statObj.new()
		stat.value = Stats.CurrentStats[stat.Id]
		bbcode_text+= stat.GetText()+"\n"	
	pass # Replace with function body.
