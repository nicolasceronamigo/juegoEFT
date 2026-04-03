extends Pieza

class_name Baño



func _ready():
	dicc_muebles = {
		8: 1, 
		9: 1,
		10: 1,
		11: 1
		}
	matriz_pieza = [
		[1, 1, 1, 1, 1],
		[1, 0, 0, 0, 1],
		[3, 0, 0, 0, 2],
		[1, 0, 0, 0, 1],
		[1, 1, 1, 1, 1]
		]
	asignar_mueble_matriz()
	crear_pieza()
	pieza_creada.emit(arreglo_muros_vector2i, arreglo_pisos_vector2i)
