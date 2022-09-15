extends KinematicBody


const MAX_SPEED = 10
const JUMP_SPEED = 8
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
onready var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * ProjectSettings.get_setting("physics/3d/default_gravity_vector")
onready var stats = $Stats
onready var invincibleTimer = $InvincibleTimer
onready var hurtArea = $PlayerHurtArea
var velocity: Vector3
var last_velocity: Vector3

func _unhandled_input(event):	
	if event is InputEventMouseMotion:
		mouse_pos = event.position
		

func _physics_process(delta):

	if last_velocity != velocity:
		$Particles.set_emitting(true) 
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

	
	if dir.length_squared() > 1:
		dir /= dir.length()

	# Apply gravity.
	velocity += delta * gravity

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
	last_velocity = velocity

	# Jumping code. is_on_floor() must come after move_and_slide().
	if is_on_floor() and Input.is_action_pressed("jump"):
		velocity.y = JUMP_SPEED
	if (Input.is_action_pressed("shoot")) and can_shoot:
		Game.player_shoot($ShootFrom.global_transform)
		can_shoot = false
		$ShootTimer.start(0.12)


func _on_ShootTimer_timeout():
	can_shoot = true


func _on_PlayerHurtArea_area_entered(_area):
	injured()


func _on_InvincibleTimer_timeout():
	hurtArea.set_deferred("monitorable", true)


func _on_PlayerHurtArea_body_entered(_body):
	injured()

func injured():
	if invincibleTimer.get_time_left() == 0:
		stats.health -= 1
		hurtArea.set_deferred("monitorable", false)
		invincibleTimer.start(1)
