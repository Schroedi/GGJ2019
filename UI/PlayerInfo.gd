extends Control


func _process(delta):
	$Gold.text = " %.2f" % GameState.Level.playerGold
	$Life.text = " "+str(GameState.Level.playerLifes)
	$Wave.text = "%.0f" % EnemyManager.currentWave
	$Next.text = "%.0fs" % EnemyManager.currentWaveDuration