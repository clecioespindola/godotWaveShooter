extends Control

var tamanho_vidas = 20

func on_mudar_vidas_jogador(vidas_jogador) -> void:
	$vidas.rect_size.x = vidas_jogador * tamanho_vidas
