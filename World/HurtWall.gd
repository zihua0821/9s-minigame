extends StaticBody


onready var stats = $Stats

func _physics_process(_delta):
	if stats.health <= 0:
		queue_free()


func _on_Area_area_entered(_area):
	stats.health -= 1
