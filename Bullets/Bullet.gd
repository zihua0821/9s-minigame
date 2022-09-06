extends KinematicBody

export var wait_time = 5
export var speed = 300
var direction:Vector3


# Called when the node enters the scene tree for the first time.
func _ready():
	add_collision_exception_with(self)
	$Timer.wait_time = wait_time

func _physics_process(delta):
	var _direction = move_and_slide(direction * delta * speed,Vector3.UP)


func _on_BulletHitArea_body_entered(_body):
	queue_free()


func _on_Timer_timeout():
	queue_free()




func _on_HurtArea_area_entered(area):
	if area.name == "PlayerBulletArea":
		queue_free()
