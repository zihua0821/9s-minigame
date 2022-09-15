extends Node

onready var lastMusic = $MusicList/Music1
onready var currentMusic = $MusicList/Music1

# Called when the node enters the scene tree for the first time.
func _ready():
	currentMusic.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_one_pressed():
	currentMusic = $MusicList/Music1_8	
	var pos = lastMusic.get_playback_position()
	lastMusic.stop()
	currentMusic.play(pos)
	lastMusic = currentMusic
	pass # Replace with function body.
