extends Node

var playerBullet = preload("res://Bullets/PlayerBullet.tscn")
var enemyBullet0 = preload("res://Bullets/EnemyBullet0.tscn")
var enemyBullet1 = preload("res://Bullets/EnemyBullet1.tscn")

func player_shoot(transform):
	var bullet_i = playerBullet.instance()
	var bullet_transform = transform
#	bullet_transform.origin.y = 0.4
	bullet_i.transform = bullet_transform
	bullet_i.direction = -transform.basis.z
	get_tree().get_root().get_node("World").add_child(bullet_i)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func shoot_bullet(transform):
	var bullet_i
	if rand_range(0,1) > 0.5:
		bullet_i = enemyBullet0.instance()
	else:
		bullet_i = enemyBullet1.instance()
	
	var bullet_transform = transform
	bullet_i.transform = bullet_transform
	bullet_i.direction = -transform.basis.z
	get_tree().get_root().get_node("World").add_child(bullet_i)
