extends KinematicBody


const MAX_SPEED = 3
const JUMP_SPEED = 5
const ACCELERATION = 2
const DECELERATION = 4
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_shoot = true
var _ray_from:= Vector3()
var _ray_to:= Vector3()
var _ray_length := 100.0
var obj_pos:Vector3
var mouse_pos:Vector2
onready var gravity = -ProjectSettings.get_setting("physics/3d/default_gravity")
onready var stats = $Stats
var velocity: Vector3
# Called when the node enters the scene tree for the first time.
func _ready():
#	rotate_y(PI/2)
#	transform.basis = transform.basis.rotated(Vector3(1, 0, 0), PI)
#	transform.basis = Basis(Vector3(0, 1, 0), 1) * transform.basis


	
	pass # Replace with function body.
var rot_x = 0
var rot_y = 0
func _unhandled_input(event):	
	if event is InputEventMouseMotion:
		mouse_pos = event.position
		

func _physics_process(delta):
	if stats.health <= 0:
		queue_free()
	elif stats.health == 4:
		$Body/RightBackrPos/MeshInstance.hide()
	elif stats.health == 3:
		$Body/LeftBackrPos/MeshInstance.hide()
	elif stats.health == 2:
		$Body/RightPos/MeshInstance.hide()
	elif stats.health == 1:
		$Body/LeftPos/MeshInstance.hide()
		
	var camera = get_viewport().get_camera()
	_ray_from =  camera.project_ray_origin(mouse_pos)
	_ray_to = _ray_from + camera.project_ray_normal(mouse_pos) * _ray_length
	var space_state = get_world().direct_space_state
	if space_state == null:
		push_error("space state become null!")
		
	var result = space_state.intersect_ray(_ray_from, _ray_to)
	if result:
		var pos = transform.origin
		pos.y = 0
		result.position.y = 0
		obj_pos = (result.position - pos).normalized()
		var b_z = -obj_pos
		var b_x = b_z
		b_x.x = b_z.z
		b_x.z = -b_z.x
		transform.basis.z = b_z
		transform.basis.x = b_x
	
	var dir = Vector3()
	dir.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	dir.z = Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
#	var cam_basis = camera.global_transform.basis
##	print(cam_basis)
#
#	var basis = cam_basis.rotated(cam_basis.x, -cam_basis.get_euler().x)
#	dir = basis.xform(dir)
	
	if dir.length_squared() > 1:
		dir /= dir.length()

	# Apply gravity.
	velocity.y += delta * gravity

	# Using only the horizontal velocity, interpolate towards the input.
	var hvel = velocity
	hvel.y = 0

	var target = dir * MAX_SPEED
	var acceleration = ACCELERATION
	if dir.dot(hvel) > 0:
		acceleration = ACCELERATION
	else:
		acceleration = DECELERATION

	hvel = hvel.linear_interpolate(target, acceleration * delta)


	# Assign hvel's values back to velocity, and then move.
	velocity.x = hvel.x
	velocity.z = hvel.z
	velocity = move_and_slide(velocity, Vector3.UP)

	# Jumping code. is_on_floor() must come after move_and_slide().
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = JUMP_SPEED
	if Input.is_action_just_pressed("shoot") and can_shoot:
		Game.shoot_bullet(transform,"player")
		can_shoot = false		
	elif Input.is_action_pressed("shoot") and can_shoot:
		Game.shoot_bullet(transform,"player")
		can_shoot = false
	
	
	



func _on_ShootTimer_timeout():
	can_shoot = true


func _on_PlayerHurtArea_area_entered(area):
	stats.health -= 1
