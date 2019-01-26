static func lerp_angle(a, b, t):
    if abs(a-b) >= PI:
        if a > b:
            a = normalize_angle(a) - 2.0 * PI
        else:
            b = normalize_angle(b) - 2.0 * PI
    return lerp(a, b, t)


static func normalize_angle(x):
    return fposmod(x + PI, 2.0*PI) - PI


static func load_scene(t):
    var scene = load(t["filename"]).instance()
    for i in t.keys():
        if i == "filename":
            continue
        scene.set(i, t[i])
    return scene
	


static func fireProjectile(var src, var target,var dmg,var bounceLeft,var splash, var bullet,var level):
	var bull = bullet.instance()
	bull.global_position = src.get_ref().global_position
	bull.damage = dmg
	bull.Target = target
	bull.Source = src
	bull.targetBounce = bounceLeft
	bull.splash = splash
	level.add_child(bull)