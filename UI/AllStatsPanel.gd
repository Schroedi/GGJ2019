extends Container

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
	$AllStatsPanel.bbcode_text = ""	
	$AllNamesPanel.bbcode_text = "[right][color=#55ffffff]"
	for statObj in Stats.AlltStats:
		var stat =statObj.new()
		stat.value = Stats.CurrentStats[stat.Id]
		$AllStatsPanel.bbcode_text+= stat.GetText()+"\n"	
		$AllNamesPanel.bbcode_text+= stat.GetName()+":\n"
	
	$AllStatsPanel.bbcode_text+=("%.0f"%GameState.DPS)+"\n"	
	$AllNamesPanel.bbcode_text+= "DPS:\n"
	$AllStatsPanel.bbcode_text+=("%.0f"%GameState.DPSmax)+"\n"	
	$AllNamesPanel.bbcode_text+= "Max. DPS:\n"
	
	$AllStatsPanel.bbcode_text+=("%.0f"%EnemyManager.currentWave)+"\n"	
	$AllNamesPanel.bbcode_text+= "Current wave:\n"
	
	$AllStatsPanel.bbcode_text+=("%.0f"%EnemyManager.currentWaveSpawnsLeft)+"\n"	
	$AllNamesPanel.bbcode_text+= "Targets left:\n"
	
	$AllStatsPanel.bbcode_text+=("%.1fs"%EnemyManager.currentWaveDuration)+"\n"	
	$AllNamesPanel.bbcode_text+= "Next wave in:\n"
	
	$AllNamesPanel.bbcode_text+="[/color][/right]"
	pass # Replace with function body.
