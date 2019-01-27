extends Node

onready var Level = get_node("/root/GameLevel") 

# How many Items does the player have
var ItemCount = 0
var MaxItemCount = 20
var DPS =0
var DPSmax =0
var DamageLastSecond =0
var DamageSeconds =0

var ItemTexTiers = [load("res://Assets/icons/tier0.png"), 
	load("res://Assets/icons/tier1.png"),
	load("res://Assets/icons/tier2.png"),
	load("res://Assets/icons/tier3.png"),
	load("res://Assets/icons/tier4.png"),
	load("res://Assets/icons/tier5.png")]

var InfoTexTiers = [load("res://Assets/infobox/itier0.png"),
					load("res://Assets/infobox/itier1.png"),
					load("res://Assets/infobox/itier2.png"),
					load("res://Assets/infobox/itier3.png"),
					load("res://Assets/infobox/itier4.png"),
					load("res://Assets/infobox/itier5.png")]

# infobox
var InfoboxIcons = [
load("res://Assets/infobox/previews/angel.png"),
load("res://Assets/infobox/previews/gummibaer.png"),
load("res://Assets/infobox/previews/gun.png"),
load("res://Assets/infobox/previews/hase.png"),
load("res://Assets/infobox/previews/hut.png"),
load("res://Assets/infobox/previews/kaese.png"),
load("res://Assets/infobox/previews/kaktus.png"),
load("res://Assets/infobox/previews/krawatte.png"),
load("res://Assets/infobox/previews/mic.png"),
load("res://Assets/infobox/previews/radar.png"),
load("res://Assets/infobox/previews/rocket.png"),
load("res://Assets/infobox/previews/schirm.png"),
load("res://Assets/infobox/previews/schuh2.png"),
load("res://Assets/infobox/previews/schuh.png"),
load("res://Assets/infobox/previews/sword.png"),
load("res://Assets/infobox/previews/trower.png"),
load("res://Assets/infobox/previews/wecker.png"),
load("res://Assets/infobox/previews/zzz.png")]
#icon
var Icons = [load("res://Assets/icons/weapon items/angel.png"),
load("res://Assets/icons/weapon items/gummibaer.png"),
load("res://Assets/icons/weapon items/gun.png"),
load("res://Assets/icons/weapon items/hase.png"),
load("res://Assets/icons/weapon items/hut.png"),
load("res://Assets/icons/weapon items/kaese.png"),
load("res://Assets/icons/weapon items/kaktus.png"),
load("res://Assets/icons/weapon items/krawatte.png"),
load("res://Assets/icons/weapon items/mic.png"),
load("res://Assets/icons/weapon items/radar.png"),
load("res://Assets/icons/weapon items/rocket.png"),
load("res://Assets/icons/weapon items/schirm.png"),
load("res://Assets/icons/weapon items/schuh2.png"),
load("res://Assets/icons/weapon items/schuh.png"),
load("res://Assets/icons/weapon items/sword.png"),
load("res://Assets/icons/weapon items/trower.png"),
load("res://Assets/icons/weapon items/wecker.png"),
load("res://Assets/icons/weapon items/zzz.png")]

var scrap = [load("res://Assets/Scrap/scrap1.png"), load("res://Assets/Scrap/scrap2.png"), load("res://Assets/Scrap/scrap3.png"), load("res://Assets/Scrap/scrap4.png"), load("res://Assets/Scrap/scrap5.png"), load("res://Assets/Scrap/scrap6.png"), load("res://Assets/Scrap/scrap7.png"), load("res://Assets/Scrap/scrap8.png"), load("res://Assets/Scrap/scrap9.png")]
