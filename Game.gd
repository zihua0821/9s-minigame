extends Node

var playerBullet = preload("res://Bullets/PlayerBullet.tscn")
var enemyBullet0 = preload("res://Bullets/EnemyBullet0.tscn")
var enemyBullet1 = preload("res://Bullets/EnemyBullet1.tscn")
var enemyCount = 0
var sheild
signal gameover


func player_shoot(transform):
	var bullet_i = playerBullet.instance()
	bullet_i.transform = transform
	bullet_i.direction = -transform.basis.z
	get_parent().add_child(bullet_i)

func shoot_bullet(transform):
	var bullet_i = get_rand_instance()
	bullet_i.transform = transform
	bullet_i.direction = -transform.basis.z
	get_parent().add_child(bullet_i)

func shoot_from_to(from:Vector3,to:Vector3):
	var bullet_i = get_rand_instance()
	bullet_i.transform.origin = from
	bullet_i.direction = to
	get_parent().add_child(bullet_i)

func get_rand_instance():
	var bullet_i
	if rand_range(0,1) > 0.5:
		bullet_i = enemyBullet0.instance()
	else:
		bullet_i = enemyBullet1.instance()
	return bullet_i

func enemy_ready():
	enemyCount += 1

func enemy_dead():
	enemyCount -= 1
	if enemyCount == 1:
		destroy_sheild()
	if enemyCount == 0:
		end_game()

func destroy_sheild():
	sheild.queue_free()
	
func set_sheild(node):
	sheild = node

func end_game():
	emit_signal("gameover")

