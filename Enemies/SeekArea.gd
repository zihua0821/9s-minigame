extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player = null

func can_see_player():
	return player != null

# Called when the node enters the scene tree for the first time.

func _on_SeekArea_body_entered(body):
	player = body


func _on_SeekArea_body_exited(_body):
	player = null
