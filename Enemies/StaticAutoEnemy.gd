extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var stats = $Stats
onready var seekArea = $SeekArea

var canShoot = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _physics_process(_delta):
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
		
		if canShoot:
			Game.shoot_bullet($ShootFrom.global_transform)
			canShoot = false

	if stats.health <= 0:
		queue_free()


func _on_Area_area_entered(_area):
	stats.health -= 1

func _on_ShootTimer_timeout():
	canShoot = true


