extends CharacterBody2D
class_name Ball

# ---------------------------------------------------------
# SRP y Dependency Inversion: Maneja solo su física vectorial.
# Emite 'ball_lost' si sale por el límite inferior.
# ---------------------------------------------------------

signal ball_lost

var speed: float = 600.0
var _screen_height: float

func _ready() -> void:
	_screen_height = get_viewport_rect().size.y
	
	# Randomizamos para que no siempre salga en la misma dirección
	randomize()
	var random_x = randf_range(-0.8, 0.8)
	var initial_direction = Vector2(random_x, -1).normalized()
	
	velocity = initial_direction * speed

func _physics_process(delta: float) -> void:
	# move_and_collide devuelve los datos de la colisión si ocurre
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		# Fórmula de reflexión física usando la normal de la superficie
		velocity = velocity.bounce(collision.get_normal())
		
	# Verificar si cayó por debajo de la pantalla (Game Over / Pierde Vida)
	if global_position.y > _screen_height + 50:
		ball_lost.emit()
		print("[Ball] Pelota perdida. Emitiendo señal ball_lost.")
		queue_free() # Destruye el nodo temporalmente para evitar errores
		set_physics_process(false)
