@tool
extends StaticBody3D

class_name Leko

@export var pushable : bool:
	set(value):
		pushable = value
		set_leko_color()
@export var weight : int = 1

var tiles : Array[Vector2i]

func set_leko_color() -> void:
	var mat : StandardMaterial3D = StandardMaterial3D.new()
	mat.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED
	if pushable:
		mat.albedo_color = Color(randf(), randf(), randf())
	else:
		mat.albedo_color = Color(.25,.25,.25)
	
	for child in get_children():
		if not child is MeshInstance3D: continue
		(child as MeshInstance3D).set_surface_override_material(0, mat)

func _ready() -> void:
	if not Engine.is_editor_hint():
		for child in get_children():
			var collider : CollisionShape3D = CollisionShape3D.new()
			collider.shape = BoxShape3D.new()
			add_child(collider)
			collider.position = child.position

func get_tiles_in_dir(dir : Vector2i) -> Array[Vector2i]:
	var tiles_in_dir : Array[Vector2i]
	
	for pos in tiles:
		if not tiles.has(pos + dir):
			tiles_in_dir.append(pos + dir)
	
	return tiles_in_dir
