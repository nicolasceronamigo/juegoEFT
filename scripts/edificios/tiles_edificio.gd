extends TileMapLayer

@onready var dims_edificio: Vector2i = get_parent().dims_edificio
@onready var dims_celda_pieza: Vector2i = get_parent().dims_celda_pieza

@onready var arreglo_muro: Array[Vector2i] = []


func _on_edificio_edificio_creado(arreglo_muro, arreglo_piso):
	pass # Replace with function body.
