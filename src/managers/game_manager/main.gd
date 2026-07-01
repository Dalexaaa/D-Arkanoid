extends Node2D
class_name GameManager

# ---------------------------------------------------------
# GameManager: Controlador de estado de alto nivel.
# Cumple con Single Responsibility Principle (SRP): 
# Solo orquesta el flujo general, no calcula físicas.
# ---------------------------------------------------------

func _ready() -> void:
	print("[GameManager] Entorno inicializado correctamente.")
	print("[GameManager] Renderizador: Compatibility (OpenGL) activo.")
	print("[GameManager] Resolución móvil configurada.")
