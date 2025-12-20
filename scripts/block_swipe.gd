extends Node3D

class_name Block_Swipe

@export var camera : Camera3D

var start_mouse_position : Vector2
var leko_selecting : Leko

func _physics_process(_delta: float) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	
	if Input.is_action_just_pressed("lmb"):
		start_mouse_position = mouse_position
		
		var from = camera.project_ray_origin(mouse_position)
		var to = from + camera.project_ray_normal(mouse_position) * 100
		var space = get_world_3d().direct_space_state
		var query = PhysicsRayQueryParameters3D.create(from, to)
		var result = space.intersect_ray(query)
		
		print(result)
		if result and result.collider is Leko:
			leko_selecting = result.collider
	
	if Input.is_action_just_released("lmb"):
		var dir : Vector2 = mouse_position - start_mouse_position
		
		if abs(dir.x) > abs(dir.y):
			dir.x = 1 * sign(dir.x)
			dir.y = 0
		else:
			dir.x = 0
			dir.y = 1 * sign(dir.y)
		
		print(dir)
		
		if leko_selecting:
			print("dragging block")
			drag_block(dir)
		else:
			print("no block found")

func drag_block(dir : Vector2i):
	pass
