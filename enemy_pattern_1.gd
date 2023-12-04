extends Node2D

signal leave()
@export var enemy_path : PackedScene
var enemies = 0
var enemies_progress = 944

# Called when the node enters the scene tree for the first time.
func _ready():
	$spawn_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func create_enemy():
	var str_enemy = str(enemies)
	if enemies == 0:
		var new_enemy = enemy_path.instantiate()
		get_node("route").add_child(new_enemy)
		new_enemy.set_name("enemy_route"+str_enemy)
		new_enemy.enemy_movement = enemies_progress 
		new_enemy.type("mob1")
		enemies += 1
	elif enemies > 0 and enemies <= 4:
		var new_enemy = enemy_path.instantiate()
		get_node("route").add_child(new_enemy)
		new_enemy.set_name("enemy_route"+str_enemy)
		new_enemy.enemy_movement = enemies_progress - 96
		new_enemy.type("mob1")
		enemies_progress -= 96
		enemies += 1
	elif enemies == 5:
		var new_enemy = enemy_path.instantiate()
		get_node("route").add_child(new_enemy)
		new_enemy.set_name("enemy_route"+str_enemy)
		new_enemy.enemy_movement = enemies_progress - 64
		new_enemy.type("mob2")
		enemies_progress -= 64
		enemies += 1
	elif enemies > 5 and enemies <= 9:
		var new_enemy = enemy_path.instantiate()
		get_node("route").add_child(new_enemy)
		new_enemy.set_name("enemy_route"+str_enemy)
		new_enemy.enemy_movement = enemies_progress - 96
		new_enemy.type("mob2")
		enemies_progress -= 96
		enemies += 1
	else: 
		$spawn_timer.queue_free()
		$leave_timer.start()

func _on_spawn_timer_timeout():
	create_enemy()
	
func _on_leave_timer_timeout():
	var paths = get_node("route").get_children()
	for i in paths:
		i.exit = true
