extends Node2D

var loadUnit = preload("res://Scenes/Unit.tscn")
var loadBase = preload("res://Scenes/Base.tscn")
var base = null
var unit = null
var unit_arr : Array = []
var itr = 0
onready var nav_2d : Navigation2D = get_child(1)

#test for git

func testForGit():
	print("confusion")

func _ready():
	createNewBase(loadBase, 317, 735)

func _process(delta):
	if Input.is_action_just_pressed("mouse_click"):
		createNewUnit(loadUnit)
		var new_path : = nav_2d.get_simple_path(unit,position, base.position)
		unit.path = new_path

func createNewUnit(lU):
	unit = lU.instance()
	itr = itr + 1
	unit.position = get_global_mouse_position()
	print("clicked at " + str(unit.position))
	
	unit.set_name("Spawned_Unit_" + str(itr))
#	print(unit.name)
	unit_arr.push_back(unit.name)
#	print(unit_arr)
	add_child(unit)

func createNewBase(lB, basePositionX, basePositionY):
	base = lB.instance()
	var basePosVec := Vector2(basePositionX, basePositionY)
	base.position = (basePosVec)
	print("base successfully instanced at" + str(base.position))
	add_child(base)
	

func getTree():
	var instancedUnitName = "Spawned_Unit_" + str(itr) 
	var out = get_tree().get_root().find_node(instancedUnitName, true, false)
	#print(out)
	
func getUnit():
	if unit_arr.size() > 0:
		print(unit_arr[0])
	else: print("unit not found")

