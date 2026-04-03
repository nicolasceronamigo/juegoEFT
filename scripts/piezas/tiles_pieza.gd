extends TileMapLayer


func _on_pieza_pieza_creada(arreglo_muro, arreglo_piso):
	set_cells_terrain_connect(arreglo_piso, 0, 1)
	set_cells_terrain_connect(arreglo_muro, 0, 0)
