extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player = preload("res://Player.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if $Player:
		var p_tr =  $Player.translation
		p_tr.y = 10
		p_tr.z += 10
		$Camera.translation = p_tr
	else:
		var player_i = player.instance()
		get_tree().get_root().get_node("World").add_child(player_i)
		player_i.transform = $Position3D.transform
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


