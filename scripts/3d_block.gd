extends StaticBody3D

class_name Leko_Tawa

var sliding_dir : Vector3
const MAX_SLIDE_TILES : int = 16

var map_get : Map_Get

@export var properties : Dictionary

func slide_block(dir : Vector2): pass
	#sliding_dir = Vector3(dir.x, 0, dir.y)
	#
	#var hit : bool = false
	#var i   : int  = 1
	#while not hit and i < MAX_SLIDE_TILES:
		#var leko : Leko_Tawa = map_get.mget(Vector2(position.x + sliding_dir.x * i, position.z + sliding_dir.z * i))
		#
		#if leko:
			#hit = true
		#
		#i += 1
	#
	#var tween = get_tree().create_tween()
	#tween.tween_property(self, "position", position + sliding_dir * (i - 2), .05 * (i - 2.0))
