extends Node2D

class_name Edificio

signal edificio_creado(arreglo_muro, arreglo_piso)

var herramientas: Herramientas = Herramientas.new()
var diccionarios: Diccionarios = Diccionarios.new()

var dicc_piezas: Dictionary = {
	3: 4,
	4: 5
}

var matriz_edificio: Array[Array] = [
	[0, 0, 0],
	[0, 0, 0],
	[0, 0, 0]
	]

var dims_celda_pieza: Vector2i = Vector2i(64 * 8, 64 * 8)

var dims_edificio: Vector2i = Vector2i(len(matriz_edificio[0]) * dims_celda_pieza.x - 64, len(matriz_edificio) * dims_celda_pieza.y - 64)

func _ready():
	asignar_pieza_matriz()
	crear_edificio()
	edificio_creado.emit()

func cantidad_piezas() -> int:
	var cant_total: int = 0
	for cant in dicc_piezas.values():
		cant_total += cant
	return cant_total

func asignar_pieza_matriz():
	var cant_piezas: int = cantidad_piezas()
	var arreglo_indices: Array[Dictionary] = herramientas.posiciones_indices_azar(cant_piezas, [0, len(matriz_edificio) - 1], [0, len(matriz_edificio[0]) - 1])
	var indice_arreglo_indices = 0
	for key in dicc_piezas.keys():
		for num in range(dicc_piezas[key]):
			var i: int = arreglo_indices[indice_arreglo_indices]["i"]
			var j: int = arreglo_indices[indice_arreglo_indices]["j"]
			matriz_edificio[i][j] = key
			indice_arreglo_indices += 1

func colocar_pieza(pos_x: int, pos_y: int, path_escena: String, orientacion: int = 0):
	var pieza = load(path_escena).instantiate()
	for i in range(orientacion):
		pieza.matriz_pieza = herramientas.rotar_matriz_un_cuarto(pieza.matriz_pieza)
	pieza.position = Vector2i(pos_x * dims_celda_pieza.x, pos_y * dims_celda_pieza.y)
	add_child(pieza)

func crear_edificio(orientacion: int = 0) -> void:
	for r in range(orientacion % 4):
		matriz_edificio = herramientas.rotar_matriz_un_cuarto(matriz_edificio)
	for i in range(len(matriz_edificio)):
		for j in range(len(matriz_edificio[0])):
			var id: int = matriz_edificio[i][j]
			colocar_pieza(j, i, diccionarios.dicc_path_piezas[id]["path_escena"])
