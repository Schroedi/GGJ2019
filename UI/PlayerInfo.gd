extends Control


func _process(delta):
	$Gold.text = "%.2f" % GameState.Level.playerGold
	$Life.text = str(GameState.Level.playerLifes)