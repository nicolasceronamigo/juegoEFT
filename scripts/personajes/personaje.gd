extends CharacterBody2D

@export var rapidez := 300

var objetos_en_alcance: Array[Node2D] = []

var objeto_en_manos: Node2D = null

@onready var posicion_manos: Marker2D = $PosicionManos

func _ready():
	position = Vector2(128, 128)

func _physics_process(delta):
	obtener_input()
	move_and_slide()
	tomar_objeto()
	colocar_objeto()

func obtener_input():
	var direccion_input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direccion_input * rapidez
	if direccion_input != Vector2.ZERO:
		rotation = velocity.angle()

func tomar_objeto() -> void:
	'''Agrega objetos en manos'''
	if len(objetos_en_alcance) > 0 and objeto_en_manos == null:
		if Input.is_action_just_pressed("left_mouse_click"):
			for objeto in objetos_en_alcance:
				if objeto.es_movible:
					objeto_en_manos = objeto
					objeto_en_manos.reparent(posicion_manos)
					objeto_en_manos.position = posicion_manos.position

func colocar_objeto() -> void:
	'''Quita objetos en manos'''
	if objeto_en_manos != null:
		if Input.is_action_just_pressed("right_mouse_click"):
			var nodo_padre = get_parent()
			objeto_en_manos.reparent(nodo_padre)
			objeto_en_manos.rotation = 0
			objeto_en_manos = null

func _on_alcance_body_entered(body: Node2D) -> void:
	'''Agrega objetos en alcance'''
	#if body is Mueble or body is MuebleInventario:
	objetos_en_alcance.append(body)

func _on_alcance_body_exited(body: Node2D) -> void:
	'''Quita objetos en alcance'''
	#if body is Mueble or body is MuebleInventario:
	objetos_en_alcance.erase(body)
