extends Node

class_name Diccionarios

const dicc_path_muebles: Dictionary = {
	2: {"nombre": "puerta", "path_sprite": "res://assets/sprites/sprite_puerta.png", "path_escena": "res://escenas/objetos/inmueble.tscn"},
	3: {"nombre": "ventana", "path_sprite": "res://assets/sprites/sprite_ventana.png", "path_escena": "res://escenas/objetos/inmueble.tscn"},
	4: {"nombre": "cama", "path_sprite": "res://assets/sprites/sprite_cama.png", "path_escena": "res://escenas/objetos/mueble.tscn"},
	5: {"nombre": "escritorio", "path_sprite": "res://assets/sprites/sprite_escritorio.png", "path_escena": "res://escenas/objetos/mueble_inventario.tscn"},
	6: {"nombre": "silla", "path_sprite": "res://assets/sprites/sprite_silla.png", "path_escena": "res://escenas/objetos/mueble.tscn"},
	7: {"nombre": "armario", "path_sprite": "res://assets/sprites/sprite_armario.png", "path_escena": "res://escenas/objetos/mueble_inventario.tscn"},
	8: {"nombre": "caja", "path_sprite": "res://assets/sprites/sprite_caja.png", "path_escena": "res://escenas/objetos/mueble_inventario.tscn"},
	9: {"nombre": "taza_baño", "path_sprite": "res://assets/sprites/sprite_taza_baño.png", "path_escena": "res://escenas/objetos/mueble_agua.tscn"},
	10: {"nombre": "lavamanos", "path_sprite": "res://assets/sprites/lavamanos.png", "path_escena": "res://escenas/objetos/mueble_agua.tscn"},
	11: {"nombre": "ducha", "path_sprite": "res://assets/sprites/ducha.png", "path_escena": "res://escenas/objetos/mueble_agua.tscn"}
}

const dicc_path_piezas: Dictionary = {
	0: {"nombre": "", "path_escena": ""},
	1: {"nombre": "living", "path_escena": ""},
	2: {"nombre": "comedor", "path_escena": ""},
	3: {"nombre": "dormitorio", "path_escena": "res://escenas/piezas/dormitorio.tscn"},
	4: {"nombre": "baño", "path_escena": "res://escenas/piezas/baño.tscn"},
	5: {"nombre": "cocina", "path_escena": ""},
	6: {"nombre": "bodega", "path_escena": ""},
	7: {"nombre": "oficina", "path_escena": ""}
}
