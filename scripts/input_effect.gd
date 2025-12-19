extends Sprite3D

class_name Input_Effect

var scale_velocity : float
var position_velocity : Vector3

var fade_t : float = .3
var time_to_fade : float = 1

func _physics_process(delta: float) -> void:
	position += position_velocity * delta
	scale -= Vector3.ONE * scale_velocity
	
	modulate.a = fade_t
	
	fade_t -= delta
	if fade_t < 0:
		queue_free()
