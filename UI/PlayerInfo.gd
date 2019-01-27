extends Panel


func _process(delta):
	$Gold.text = str(GameState.Level.playerGold)
	$Life.text = str(GameState.Level.playerLifes)