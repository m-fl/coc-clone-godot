extends Camera2D

export var zoomSpeed = 40.0
export var zoomFactor = 1.0

export var zoomMin = 0.75
export var zoomMax = 3.0


func _process(delta):
	zoom.x = lerp(zoom.x, zoom.x * zoomFactor, zoomSpeed * delta)
	zoom.y = lerp(zoom.y, zoom.y * zoomFactor, zoomSpeed * delta)
	
	zoom.x = clamp(zoom.x, zoomMin, zoomMax)
	zoom.y = clamp(zoom.y, zoomMin, zoomMax)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
#	if abs(zoompos.x - get_global_mouse_position().x) > zoommargin:
#	zoomFactor = 1.0
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				zoomFactor -= 0.01
			if event.button_index == BUTTON_WHEEL_DOWN:
				zoomFactor += 0.01
	
