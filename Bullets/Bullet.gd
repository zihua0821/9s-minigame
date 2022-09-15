extends Spatial


export var speed = 10
var direction = Vector3.ZERO
var velocity:Vector3

func _physics_process(delta):
	if direction != Vector3.ZERO:
		velocity = direction * delta * speed
		move(velocity)

func move(v:Vector3):
	transform.origin += v

func _on_Area_body_entered(_body):
	queue_free()


func _on_HurtArea_area_entered(_area):
	queue_free()
