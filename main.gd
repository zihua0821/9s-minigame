extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player = preload("res://Player.tscn")
onready var BGM = $BackgroungMusic


# Called when the node enters the scene tree for the first time.
func _ready():
	BGM.play()
	var _err = Game.connect("gameover",self,"gameover")


func _physics_process(_delta):
	if $Player:
		var p_tr =  $Player.translation
		p_tr.y = 15
#		p_tr.z += 0
		$Camera.transform.origin = p_tr
	else:
		var player_i = player.instance()
		get_tree().get_root().get_node("World").add_child(player_i)
		player_i.transform = $Position3D.transform
	
func gameover():
	get_tree().paused = true
	$EndWindow.show()

