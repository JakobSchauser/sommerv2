extends Node2D

var colors = [Color(1,0,0), Color(1,1,1)]
var current_color = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# connect to $Are2D and reset timer if area is entered
	$Player/Area2D.connect("body_entered", self, "reset_timer")
	# Connect the COlorChangeTimer to change_color 
	$ColorChangeTimer.connect("timeout", self, "change_color")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = str(floor($CounterTimer.time))


func reset_timer(body):
	$CounterTimer.time = 0

func change_color():
	# total time since the game was started

	# $Player.self_modulate = colors[current_color]

	# $enemyspawner.spawn_color = colors[current_color]
	
	
	current_color = (current_color + 1) % colors.size()

	# VisualServer.set_default_clear_color(colors[current_color])
	for e in get_tree().get_nodes_in_group("Enemy"):
		# e.self_modulate = colors[current_color]
		if e.index == current_color:
			# e.visible = true
			#e.modulate = Color(1,1,1,1)
			e.make_visible()
		else:
			# e.move()
			e.make_invisible()

			# e.modulate = Color(1,1,1,0.005)
