extends Spatial


func _physics_process(delta):
	pass


func _on_Timer_timeout():
	Game.shoot_bullet($ShootFrom.global_transform)
