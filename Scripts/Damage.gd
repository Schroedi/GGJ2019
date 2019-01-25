extends Node

# apply damage to something
static func ApplyDamage(trgt, damage):
	# shield damage only applies to shield
	trgt.shield -= damage["ShieldDmg"]
	trgt.shield = max(0, trgt.shield)
	# apply the normal damage to the shield
	trgt.shield -= damage["HullDmg"]
	if trgt.shield < 0:
		# apply damage that bypasses shield
		trgt.life += trgt.shield
		trgt.shield = 0
