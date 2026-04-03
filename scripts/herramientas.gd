extends Node

class_name Herramientas

func _ready():
#	print(crear_arreglo_multiplos(2, 10))
#	print(crear_celdas(2, 10))
	pass

#-----------------------------------------------------------------------------------------------------------------------

func crear_arreglo_ceros(largo: int) -> Array[int]:
	var arreglo: Array[int] = []
	for n in range(largo):
		arreglo.append(0)
	return arreglo

#-----------------------------------------------------------------------------------------------------------------------

func crear_matriz_ceros(num_filas: int, num_columnas: int) -> Array[Array]:
	var matriz: Array[Array] = []
	var fila: Array[int] = crear_arreglo_ceros(num_columnas)
	for i in range(num_filas):
		matriz.append(fila)
	return matriz

#-----------------------------------------------------------------------------------------------------------------------

func trasponer_matriz(matriz: Array[Array]) -> Array[Array]:
	var matriz_traspuesta: Array[Array] = []
	for columna in matriz[0]:
		matriz_traspuesta.append([])
	for i_fila in range(len(matriz)):
		for j_columna in range(len(matriz[0])):
			matriz_traspuesta[j_columna].append(matriz[i_fila][j_columna])
	return matriz_traspuesta

#-----------------------------------------------------------------------------------------------------------------------

func rotar_matriz_un_cuarto(matriz: Array[Array]) -> Array[Array]:
	var matriz_rotada: Array[Array] = []
	for columna in matriz[0]:
		matriz_rotada.append([])
	for i_fila in range(len(matriz)):
		for j_columna in range(len(matriz[0])):
			matriz_rotada[len(matriz[0]) - 1 - j_columna].append(matriz[i_fila][j_columna])
	return matriz_rotada

#-----------------------------------------------------------------------------------------------------------------------

func crear_arreglo_multiplos(numero: int, limite: int) -> Array[int]:
	'''
	crea un arreglo de multiplos positivos y negativos de numero
	entre 0 y limite
	'''
	var arreglo_multiplos: Array[int] = []
	var cant_multiplos: int = limite / numero
	for n_esimo_multiplo in range(cant_multiplos):
		arreglo_multiplos.append(n_esimo_multiplo * numero)
	return arreglo_multiplos

#-----------------------------------------------------------------------------------------------------------------------

func crear_celdas(tamaño_celda: int, tamaño_region: int) -> Array:
	'''
	crea celdas en una region con esquina superior izquierda en el origen de coordenadas
	cada celda es cuadrada y de lado tamaño_celda
	la region donde se definen las celdas es cuadrada y de lado tamaño_region
	la cantidad de celdas creadas dependeran del tamaño del mapa (tamaño_region)
	la cantidad de celdas es igual a (tamaño_region / tamaño_celda) ** 2
	cada celda está representada por las coordenadas de sus esquinas superior izquierda e inferior derecha
	'''
	var celdas_edificios: Array[Array] = []
	var lista_coordenadas: Array[int] = crear_arreglo_multiplos(tamaño_celda, tamaño_region)
	for x in lista_coordenadas:
		for y in lista_coordenadas:
			var esq_sup_izq: Vector2i = Vector2i(x, y)
			var esq_inf_der: Vector2i = Vector2i(x + tamaño_celda, y + tamaño_celda)
			celdas_edificios.append([esq_sup_izq, esq_inf_der])
	return celdas_edificios

#-----------------------------------------------------------------------------------------------------------------------

func suma_arreglo(arreglo_arreglos: Array[Array]) -> Array[int]:
	'''
	devuelve la suma de los arreglos dentro de arreglo_arreglos
	la suma se realiza entre los elementos de cada arreglo del mismo índice
	'''
	var suma_arreglos: Array[int] = [0, 0]
	for arreglo in arreglo_arreglos:
		suma_arreglos[0] += arreglo[0]
		suma_arreglos[1] += arreglo[1] 
	return suma_arreglos

#-----------------------------------------------------------------------------------------------------------------------

#extends TileMapLayer

#func dibujar_base(ancho_ciudad, largo_ciudad):
#	for x in range(-ancho_ciudad / 2, ancho_ciudad / 2):
#		for y in range(-largo_ciudad / 2, largo_ciudad / 2):
#			self.set_cell(Vector2i(x ,y), 0, Vector2i(1 ,1))
#			pass

#-----------------------------------------------------------------------------------------------------------------------

func posiciones_indices_azar(cant: int, rango_i: Array[int], rango_j: Array[int]) -> Array[Dictionary]:
	randomize()
	var posiciones_indices: Array[Dictionary] = []
	var indices: Dictionary = {}
	while len(posiciones_indices) < cant:
		var rand_i = randi_range(rango_i[0], rango_i[1])
		var rand_j = randi_range(rango_j[0], rango_j[1])
		indices = {"i": rand_i, "j": rand_j}
		if indices not in posiciones_indices:
			posiciones_indices.append(indices)
	return posiciones_indices

#-----------------------------------------------------------------------------------------------------------------------

func modificar_matriz(matriz: Array[Array], posiciones_indices: Array[Dictionary]) -> void:
	for dict_indices in posiciones_indices:
		var i: int = dict_indices["i"]
		var j: int = dict_indices["j"]
		matriz[i][j] = 0
	return

#-----------------------------------------------------------------------------------------------------------------------

func elem_arr_azar(arreglo: Array) -> Array:
	var indice = randi_range(0, len(arreglo) - 1)
	return arreglo.pop_at(indice)

#-----------------------------------------------------------------------------------------------------------------------
