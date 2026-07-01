extends Node2D
class_name GameManager

# ---------------------------------------------------------
# GameManager: Controlador de estado de alto nivel.
# Ahora se encarga de instanciar el nivel dinámicamente.
# ---------------------------------------------------------

# Precargamos la escena del ladrillo en memoria
var brick_scene: PackedScene = preload("res://src/core/entities/base_brick.tscn")

# Configuración de la matriz
var rows: int = 6
var columns: int = 8
var brick_width: float = 60.0
var brick_height: float = 20.0
var padding: float = 10.0 # Espacio entre bloques
var start_y: float = 120.0 # Distancia desde el techo

func _ready() -> void:
	print("[GameManager] Entorno inicializado correctamente.")
	_generate_level()

func _generate_level() -> void:
	var screen_width = get_viewport_rect().size.x
	var total_grid_width = (columns * brick_width) + ((columns - 1) * padding)
	
	# Calculamos el punto de inicio X para que la matriz quede centrada
	var start_x = (screen_width - total_grid_width) / 2.0 + (brick_width / 2.0)
	
	for row in range(rows):
		for col in range(columns):
			var brick = brick_scene.instantiate() as BaseBrick
			
			var pos_x = start_x + (col * (brick_width + padding))
			var pos_y = start_y + (row * (brick_height + padding))
			
			brick.global_position = Vector2(pos_x, pos_y)
			add_child(brick)
