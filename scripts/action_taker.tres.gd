extends Node3D

#https://kidscancode.org/godot_recipes/4.x/3d/shooting_raycasts/

@export var input_effect_packed : PackedScene

@export var camera : Camera3D

@export var drag_ie_texture : Texture2D

@export var map_get : Map_Get

const MAX_SLIDE_TILES : int = 16

func drag_block(at : Vector2, dir : Vector2):
	var from = camera.project_ray_origin(at)
	var to = from + camera.project_ray_normal(at) * 100
	var space = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from, to)
	var result = space.intersect_ray(query)
	
	var leko : Leko_Tawa
	if result:
		print(result.collider.name)
		# ----------- spawning input effect
		var input_effect : Input_Effect = input_effect_packed.instantiate()
		input_effect.texture = drag_ie_texture
		input_effect.position_velocity = Vector3(dir.x, 0, dir.y) * 3.0
		input_effect.position = result.position
		input_effect.position.y += 2
		get_parent().add_child(input_effect)
		input_effect.rotation.z = (dir * Vector2(1, -1)).angle()
		
		leko = result.collider
	
	# tweening leko to move
	if leko and leko.properties.has("moveable"):
		var hit : bool = false
		var i   : int  = 1
		while not hit and i < MAX_SLIDE_TILES:
			var l : Leko_Tawa = map_get.mget(Vector2(leko.position.x + dir.x * i, leko.position.z + dir.y * i))
			
			if l: hit = true
			
			i += 1
		
		if i == MAX_SLIDE_TILES:
			leko.queue_free()
		else:
			var tween = get_tree().create_tween()
			tween.tween_property(leko, "position", leko.position + Vector3(dir.x, 0, dir.y) * (i - 2), .05 * (i - 2.0))
	
	print(dir)
