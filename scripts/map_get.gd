extends Node3D

class_name Map_Get

@export var game_world : Node3D
@export var block_holder : Node3D

func _ready() -> void:
	for leko in block_holder.get_children():
		leko.map_get = self

func mget(coords : Vector2i) -> Leko_Tawa:
	var leko : Leko_Tawa = null
	
	var space = get_world_3d().direct_space_state
	var from : Vector3 = (Vector3(coords.x, 0, coords.y) + Vector3(1, 0, 1) / 2.0) * game_world.scale
	var to   : Vector3 = from + Vector3.DOWN * 10.0
	var query = PhysicsRayQueryParameters3D.create(from, to)
	var result = space.intersect_ray(query)
	
	if result:
		leko = result.collider
	
	return leko
