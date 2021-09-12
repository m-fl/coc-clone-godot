extends KinematicBody2D

export(int) var SPEED: int = 40
var velocity: Vector2 = Vector2.ZERO

var path: Array = []	# Contains destination positions
var levelNavigation : Navigation2D = null
var unit = null
var base = null
onready var line2d = $Line2D


func _ready():
	unit = get_parent().unit
	base = get_parent().base
	levelNavigation = get_parent().get_child(1)
#	if levelNavigation != null:
#		levelNavigation.loadMePog()


func _physics_process(delta):
	if unit and levelNavigation:
		generate_path()
		navigate()
	move()


func navigate():	# Define the next position to go to
	if path.size() > 0:
		velocity = global_position.direction_to(path[1]) * SPEED
		# If reached the destination, remove this point from path array
		if global_position == path[0]:
			path.pop_front()

func generate_path():	# It's obvious
	if levelNavigation != null and unit != null:
		print("generating path")
		path = levelNavigation.get_simple_path(global_position, base.global_position, false)
		line2d.points = path

func move():
	velocity = move_and_slide(velocity)
