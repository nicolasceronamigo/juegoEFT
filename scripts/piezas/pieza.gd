extends Node2D

class_name Pieza

signal pieza_creada(arreglo_muro, arreglo_piso)

var herramientas: Herramientas = Herramientas.new()
var diccionarios: Diccionarios = Diccionarios.new()

var arreglo_muros_vector2i: Array[Vector2i] = []
var arreglo_pisos_vector2i: Array[Vector2i] = []

var dicc_muebles: Dictionary = {}

var matriz_pieza: Array[Array] = [
	[1, 1, 1, 1, 1, 1, 1],
	[1, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 1],
	[3, 0, 0, 0, 0, 0, 2],
	[1, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1],
	]


func _ready():
	crear_pieza()
	pieza_creada.emit(arreglo_muros_vector2i, arreglo_pisos_vector2i)

func cantidad_muebles() -> int:
	var cant: int = 0
	for cantidad in dicc_muebles.values():
		cant += cantidad
	return cant

func asignar_mueble_matriz():
	var cant_muebles: int = cantidad_muebles()
	var arreglo_indices: Array[Dictionary] = herramientas.posiciones_indices_azar(cant_muebles, [1, len(matriz_pieza) - 2], [1, len(matriz_pieza[0]) - 2])
	var indice_arreglo_indices = 0
	for key in dicc_muebles.keys():
		for num in range(dicc_muebles[key]):
			var i: int = arreglo_indices[indice_arreglo_indices]["i"]
			var j: int = arreglo_indices[indice_arreglo_indices]["j"]
			matriz_pieza[i][j] = key
			indice_arreglo_indices += 1

func colocar_objeto(pos_x: int, pos_y: int, path_sprite: String, path_escena: String):
	var mueble = load(path_escena).instantiate()
	var textura = load(path_sprite)
	mueble.get_child(0).texture = textura
	mueble.position = Vector2(pos_x + 32, pos_y + 32)
	add_child(mueble)

func crear_pieza(orientacion: int = 0) -> void:
	for r in range(orientacion % 4):
		matriz_pieza = herramientas.rotar_matriz_un_cuarto(matriz_pieza)
	for i in range(len(matriz_pieza)):
		for j in range(len(matriz_pieza[0])):
			var id: int = matriz_pieza[i][j]
			if id == 1:
				arreglo_muros_vector2i.append(Vector2i(j, i)) #muro
			else:
				arreglo_pisos_vector2i.append(Vector2i(j, i)) #piso
				if id != 0:
					colocar_objeto(j * 64, i * 64, diccionarios.dicc_path_muebles[id]["path_sprite"], diccionarios.dicc_path_muebles[id]["path_escena"])
