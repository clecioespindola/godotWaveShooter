extends Camera2D

var intensidade_tremor_camera = 0

var iniciar_tremor_camera = false

func _process(delta: float) -> void:
	zoom = lerp(zoom, Vector2(1,1), 0.3)
	
	if iniciar_tremor_camera == true:
		global_position += Vector2(rand_range(-intensidade_tremor_camera, intensidade_tremor_camera),
		rand_range(-intensidade_tremor_camera, intensidade_tremor_camera)) * delta

func tremer_tela(intensidade, tempo):
	zoom = Vector2(1,1) - Vector2(intensidade * 0.002, intensidade * 0.002)
	intensidade_tremor_camera = intensidade
	$timer_camera.wait_time = tempo
	$timer_camera.start()
	iniciar_tremor_camera = true
	
func _ready() -> void:
	Global.camera = self
	
func _exit_tree() -> void:
	Global.camera = null

func _on_timer_camera_timeout() -> void:
	iniciar_tremor_camera = false
