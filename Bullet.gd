extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction:Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
#	direction = direction.move_toward(direction * 20,delta * 100)
	move_and_slide(direction * delta * 300,Vector3.UP)


func set_bullet_from(bullet_from:String):
	match bullet_from:
		"player":
			$BulletHitArea.set_collision_mask_bit(4,true)
		"enemy":
			$BulletHitArea.set_collision_mask_bit(5,true)

func set_color(color:Color):
	var material = SpatialMaterial.new()
	material.albedo_color = color
	$MeshInstance.set_surface_material(0,material)
	
func _on_Timer_timeout():
	queue_free()


func _on_HitArea_area_entered(area):
	queue_free()
