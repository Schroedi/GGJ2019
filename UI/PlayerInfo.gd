extends Panel

onready var GameLevel = get_node("/root/GameLevel")

func _process(delta):
	$Gold.text = str(GameLevel.playerGold)
	$Life.text = str(GameLevel.playerLifes)