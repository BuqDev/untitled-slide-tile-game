extends Node

var start_mouse_position = Vector2.ZERO

var is_dragging = false
## drag value that is snapped to 4 directions
var four_way_drag = Vector2.ZERO
## the drag value that isn't snapped to 4 directions
var float_drag = Vector2.ZERO

signal drag_released

@export var action_taker : Node
@export var cam_arm : Node3D

func _physics_process(_delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	
	if Input.is_action_just_pressed("lmb"):
		start_mouse_position = mouse_position
	
	float_drag = (mouse_position - start_mouse_position).normalized()
	
	four_way_drag.x = round(abs(float_drag.x)) * sign(float_drag.x)
	if four_way_drag.x == 0:
		four_way_drag.y = round(abs(float_drag.y)) * sign(float_drag.y)
	else:
		four_way_drag.y = 0
	
	if Input.is_action_just_released("lmb"):
		drag_released.emit()
		
		action_taker.drag_block(start_mouse_position, four_way_drag)
