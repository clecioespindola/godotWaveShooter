extends Sprite

var mov = Vector2(1,0)
var velocidade = 250
var dir_unica = true

var dano

func _process(delta: float) -> void:
	if dir_unica:
		look_at(get_global_mouse_position())
		dir_unica = false
	global_position += mov.rotated(rotation) * velocidade * delta

func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()
