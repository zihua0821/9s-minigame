extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var stats = $Stats
onready var gravity = -ProjectSettings.get_setting("physics/3d/default_gravity")
var velocity:Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _physics_process(_delta):
	velocity.y += _delta * gravity
	velocity.x = 0
	velocity.z = 0
	var _collide = move_and_collide(velocity)
	if stats.health <= 0:
		queue_free()
	rotate_y(PI/8 * _delta * 2)
	
	
func _on_Area_area_entered(_area):
	stats.health -= 1

var r = 0
var g = 0
var b = 0
var a = 1
func _on_ShootTimer_timeout():
	r = rand_range(0,1)
	g = rand_range(0,1)
	b = rand_range(0,1)
	a = rand_range(0,1)
	Game.shoot_bullet($ShootFrom.global_transform)
#	r += 0.01
#	if r >= 1:
#		r = 1
#		g += 0.01
#		if g >= 1:
#			g = 1
#			b += 0.01
#	if is_equal_approx(r,1) and is_equal_approx(g,1) and is_equal_approx(b,1) :
#		r = 0
#		g = 0
#		b = 0
