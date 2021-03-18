extends Node

var criacao_no_pai = null

var jogador = null

var pontos = 0

var textura_dano = null

var recorde = 0

var camera = null

func instance_node(node, location, parent):
	var node_instance = node.instance()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
	
func salvar():
	var dic_salvar = {
		"recorde": recorde
	}
	return dic_salvar
	
func salvar_jogo():
	var jogo_salvo = File.new()
	jogo_salvo.open_encrypted_with_pass("user://jogosalvo.save", File.WRITE, "cript")
	jogo_salvo.store_line(to_json(salvar()))
	jogo_salvo.close()	
	
	
func carregar_jogo():
	var jogo_salvo = File.new()
	if not jogo_salvo.file_exists("user://jogosalvo.save"):
		print("Erro ao carregar o arquivo")
		return
		
	jogo_salvo.open_encrypted_with_pass("user://jogosalvo.save", File.READ, "cript")
	var linha_atual = parse_json(jogo_salvo.get_line())
	recorde = linha_atual["recorde"]
	jogo_salvo.close()
