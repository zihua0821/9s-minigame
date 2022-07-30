extends Node

var bullet = preload("res://Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func shoot_bullet(transform,bullet_from:String,color = Color(0,0,255)):
	var bullet_i = bullet.instance()
	var bullet_transform = transform
	bullet_i.set_color(color)
	bullet_i.set_bullet_from(bullet_from)
	bullet_i.transform = bullet_transform
	bullet_i.direction = -transform.basis.z
	get_tree().get_root().add_child(bullet_i)
