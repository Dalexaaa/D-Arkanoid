extends CharacterBody2D
class_name Paddle

# ---------------------------------------------------------
# SRP: Este nodo se encarga exclusivamente de su traslación
# horizontal basándose en eventos táctiles crudos.
# ---------------------------------------------------------

var _screen_width: float
var _half_width: float

func _ready() -> void:
	# Obtenemos el ancho de la pantalla dinámicamente
	_screen_width = get_viewport_rect().size.x
	
	# Calculamos la mitad del ancho del colisionador para los límites
	var shape = $CollisionShape2D.shape as RectangleShape2D
	_half_width = shape.size.x / 2.0

func _input(event: InputEvent) -> void:
	# Interceptamos arrastre o toque inicial en la pantalla
	if event is InputEventScreenDrag or (event is InputEventScreenTouch and event.pressed):
		var target_x = event.position.x
		
		# Clamp limita un valor entre un mínimo y un máximo.
		# Así evitamos que la mitad de la paleta salga de los bordes.
		global_position.x = clamp(target_x, _half_width, _screen_width - _half_width)
