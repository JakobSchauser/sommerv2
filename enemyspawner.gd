extends Node


export (PackedScene) var enemy

var N_emies = 10

var spawn_color = null

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	# make_wave()
	# connect to $timer
	$timer.connect("timeout", self, "make_wave")

func make_wave():
	#if spawn_color == null:
	#	return
	var dir = randi()%4
	var index = randi()%2

	for i in range(N_emies):
		var enemy_instance = enemy.instance()
		enemy_instance.dir = dir
		enemy_instance.index = index
		# enemy_instance.speed += i * 5
		# dir = 0 -> left
		# dir = 1 -> up
		# dir = 2 -> right
		# dir = 3 -> down
		var x = randi()%int(get_viewport().size.x)
		var y = randi()%int(get_viewport().size.y)
		if (dir == 0):
			enemy_instance.position = Vector2(0, y)
		elif (dir == 1):
			enemy_instance.position = Vector2(x, 0)
		elif (dir == 2):
			enemy_instance.position = Vector2((get_viewport().size.x), y)
		elif (dir == 3):
			enemy_instance.position = Vector2(x, (get_viewport().size.y)-1)
		
		var grid_size = enemy_instance.bounding_rect() * 2
		
		# snap enemy to grid 
		
		enemy_instance.position = enemy_instance.position.snapped(grid_size)
	# 	enemy_instance.modulate = spawn_color
		add_child(enemy_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
