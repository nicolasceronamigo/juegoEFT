extends StaticBody2D

class_name Mueble

var vida: float = 100.0

var es_movible: bool = true

func restar_vida(valor: float) -> void:
	if vida - valor <= 0:
		vida = 0
	vida -= valor

func sumar_vida(valor: float) -> void:
	if vida + valor >= 100:
		vida = 100
	vida += valor
