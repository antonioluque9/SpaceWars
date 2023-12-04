extends CanvasLayer

@export var mob1 : PackedScene
@export var mob2 : PackedScene
var score = 0
var score_int = ""
var life = 5
signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	$game_over.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score_int = str(score)
	$points.text = score_int


func _on_player_damage():
	if life == 5:
		life -= 1
		$life/life5.modulate = Color(0.388, 0.388, 0.388, 1)
	elif life == 4:
		life -= 1
		$life/life4.modulate = Color(0.388, 0.388, 0.388, 1)
	elif life == 3:
		life -= 1
		$life/life3.modulate = Color(0.388, 0.388, 0.388, 1)
	elif life == 2:
		life -= 1
		$life/life2.modulate = Color(0.388, 0.388, 0.388, 1)
	

func _on_player_death():
	$life.hide()
	$game_over.show()
	game_over.emit()
