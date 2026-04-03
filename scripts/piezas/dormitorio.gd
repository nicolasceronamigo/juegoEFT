extends Pieza

class_name Dormitorio

func _ready():
	dicc_muebles = {
		4: 1,
		5: 1,
		6: 1,
		7: 1,
		8: 2
		}
	asignar_mueble_matriz()
	crear_pieza()
	pieza_creada.emit(arreglo_muros_vector2i, arreglo_pisos_vector2i)
