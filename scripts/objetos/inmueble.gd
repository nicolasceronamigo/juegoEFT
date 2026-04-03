extends StaticBody2D

class_name Inmueble

var vida: float = 100.0

func restar_vida(valor: float) -> void:
	if vida - valor <= 0:
		vida = 0
	vida -= valor

func sumar_vida(valor: float) -> void:
	if vida + valor >= 100:
		vida = 100
	vida += valor


func _on_area_2d_body_entered(body):
	collision_layer = 0
	get_child(0).visible = false
	pass


func _on_area_2d_body_exited(body):
	collision_layer = 2
	get_child(0).visible = true
	pass
