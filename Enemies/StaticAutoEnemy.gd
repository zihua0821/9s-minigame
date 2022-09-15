extends KinematicBody

onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * ProjectSettings.get_setting("physics/3d/default_gravity_vector")
var velocity: Vector3
onready var stats = $Stats
onready var seekArea = $SeekArea
var speed = 100
var canShoot = true
# Called when the node enters the scene tree for the first time.
func _ready():
	Game.enemy_ready()
	
func _physics_process(_delta):
	if(!is_on_floor()):
		velocity += _delta * gravity
	if seekArea.can_see_player():
		var result = seekArea.player.transform.origin
		var pos = transform.origin
		pos.y = 0
		result.y = 0
		var obj_pos = (result - pos).normalized()
		var b_z = -obj_pos
		var b_x = b_z
		b_x.x = b_z.z
		b_x.z = -b_z.x
		transform.basis.z = b_z
		transform.basis.x = b_x
		velocity.x = obj_pos.x * _delta * speed
		velocity.z = obj_pos.z * _delta * speed
		velocity = move_and_slide(velocity, Vector3.UP)
		
		if canShoot:
			Game.shoot_bullet($ShootFrom.global_transform)
			canShoot = false
			$ShootTimer.start(0.1)
	if stats.health <= 0:
		Game.enemy_dead()
		queue_free()


func _on_Area_area_entered(_area):
	stats.health -= 1

func _on_ShootTimer_timeout():
	canShoot = true


