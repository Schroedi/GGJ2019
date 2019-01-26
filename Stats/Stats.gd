extends Node

var CurrentStats = {}

var AlltStats = [
preload("res://Stats/Available/StatDamage.gd"), 
preload("res://Stats/Available/StatSpeed.gd")]

func GetAllStats():
	return AlltStats

func _ready():
	CurrentStats["speed"] = 2