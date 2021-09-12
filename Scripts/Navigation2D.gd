extends Navigation2D

export var speed = 100

var gameObj = load("res://Scenes/Game.tscn").instance()


onready var line2d = get_node("Unit/Line2D")
onready var base = get_node("Base")

var baseValid = is_instance_valid(base)
var path = PoolVector2Array()


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			path = self.get_simple_path(to_local(unit.global_position), to_local(base.global_position), false)
			line2d.points = path
			if baseValid == true:
				 print("pogger")

func _process(delta):
	if unit != null:
		print("unit found")
	if path.size() > 0:
		var distance = unit.position.distance_to(path[0])
		if distance > 5:
			unit.position = unit.position.linear_interpolate(path[0], (speed * delta) / distance)
		else:
			path.remove(0)
			
#func getTree():
#	var instancedUnitName = "Spawned_Unit_" + str(itr) 
#	var out = get_tree().get_root().find_node(instancedUnitName, true, false)
#	print(out)
