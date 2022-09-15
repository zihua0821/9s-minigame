extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var stats = $Stats
onready var gravity = -ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity:Vector3
var canShoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	Game.enemy_ready()
	Game.set_sheild($sheild)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(_delta):
	velocity.y += _delta * gravity
	velocity.x = 0
	velocity.z = 0
	var _collide = move_and_collide(velocity)
	if stats.health <= 0:
		Game.enemy_dead()
		queue_free()
	rotate_y(PI/8 * _delta * 2)
	if canShoot:
		Game.shoot_from_to($ShootFrom.global_transform.origin,-global_transform.basis.z)
		Game.shoot_from_to($ShootFrom2.global_transform.origin,global_transform.basis.z)
		Game.shoot_from_to($ShootFrom3.global_transform.origin,-global_transform.basis.x)
		Game.shoot_from_to($ShootFrom4.global_transform.origin,global_transform.basis.x)
		canShoot = false
		$ShootTimer.start(0.1)
		
	
func _on_Area_area_entered(_area):
	if !$sheild:
		stats.health -= 1

func _on_ShootTimer_timeout():
	canShoot = true

