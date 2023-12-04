extends PathFollow2D

@export var mob1 : PackedScene
@export var mob2 : PackedScene
@export var velocity = 200
@export var enemy_movement = 0
@export var exit = false
var can_move = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_move == true:
		if exit == true:
			self.progress += velocity * delta
		elif progress < enemy_movement:
			progress += velocity * delta
	
func type(mobType):
	if mobType == "mob1":
		var new_mob = mob1.instantiate()
		add_child(new_mob)
		get_child(0).stop.connect(_on_stop)
	elif mobType == "mob2":
		var new_mob = mob2.instantiate()
		add_child(new_mob)
		get_child(0).stop.connect(_on_stop)
	
func _on_stop():
	can_move = false
