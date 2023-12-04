extends Area2D

@export var armor = 2
@export var shoot : PackedScene
signal stop

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if armor > 0:
		$Sprite2D.modulate = Color(1,0,0)
		$damage.start()
		armor -= 2
	else:
		self.collision_layer = 10
		var HUD = get_tree().get_root().get_node("Main").get_node("HUD")
		HUD.score += 10
		stop.emit()
		$Sprite2D.play("destroy")
		$destroy.start()


func _on_damage_timeout():
	$Sprite2D.modulate = Color(1,1,1)

func _on_destroy_timeout():
	queue_free()
	
func should_shoot():
	return randf() < 0.3

func _on_shoot_timer_timeout():
	if should_shoot():
		var newshoot = shoot.instantiate()
		newshoot.position = get_parent().position
		get_tree().root.add_child(newshoot)
	$shoot_timer.wait_time = randf_range(2.0, 5.0)
	$shoot_timer.start()
