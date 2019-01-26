extends Node2D

var rng = RandomNumberGenerator.new()

func WeightedRng(weights)->int:
	var weightSum = 0
	for w in weights:
		weightSum += w
	var rndWeight = rng.randi_range(0, weightSum-1)
	
	var i:int = 0
	for w in weights:
		if rndWeight < w:
			break
		rndWeight -= w
		i += 1
	
	return i
