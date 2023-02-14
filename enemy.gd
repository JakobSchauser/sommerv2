extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 120
export var dir = -1

var index = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	# connect to Timer and kill
	$Timer.connect("timeout", self, "queue_free")
	
	modulate = Color(1,1,1,0)

func _physics_process(delta):
	var vel = Vector2(0,0)
	if(dir == 0):
		vel.x = speed
	elif(dir == 1):
		vel.y = speed
	elif(dir == 2):
		vel.x = -speed
	elif(dir == 3):
		vel.y = -speed

	
	move_and_slide(vel)
	
	# check if outside screen
	var screen = get_viewport_rect().size
	#if(position.x < 0 or position.x > screen.x or position.y < 0 or position.y > screen.y):
	#	queue_free()
	#	print("destroyed")

	# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func move():
	speed = bounding_rect().x * 2
	var vel = Vector2(0,0)
	if(dir == 0):
		vel.x = speed
	elif(dir == 1):
		vel.y = speed
	elif(dir == 2):
		vel.x = -speed
	elif(dir == 3):
		vel.y = -speed
		
	# move by tween to position + vel
	var tween = $Tween
	
	tween.interpolate_property(self, "position", position, position + vel, 0.1)
	# also tween modulate 
	tween.start()

func make_visible():
	var tween = $Tween

	tween.interpolate_property(self, "modulate", Color(1,1,1,0), Color(1,1,1,1), 0.01)
	tween.start()

func make_invisible():
	var tween = $Tween

	tween.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), 0.01)
	tween.start()
		
func bounding_rect():
	return $CollisionShape2D.shape.extents
