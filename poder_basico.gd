extends Sprite

export(String) var modificador_variavel_jogador
export(float) var valor_variavel_jogador

export(float) var tempo_recarga_poder = 2

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("jogador"):
		area.get_parent().set(modificador_variavel_jogador, valor_variavel_jogador)
		area.get_parent().get_node("tempo_recarga_cooldown").wait_time = tempo_recarga_poder
		area.get_parent().get_node("tempo_recarga_cooldown").start()
		area.get_parent().reset_poder.append(name)
		queue_free()
		area.get_parent().modulate = Color.green
