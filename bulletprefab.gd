extends Area2D

var speed = 500
var direction = Vector2(0, -1)
# Called when the node enters the scene tree for the first time.
func start(pos):
	position = pos
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	queue_free()
