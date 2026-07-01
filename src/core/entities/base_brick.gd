extends StaticBody2D
class_name BaseBrick

# ---------------------------------------------------------
# OCP: Clase base para bloques. Define el contrato (hit).
# Bloques especiales heredarán de aquí y sobrescribirán hit().
# ---------------------------------------------------------

signal brick_destroyed

func hit() -> void:
	brick_destroyed.emit()
	print("[BaseBrick] Ladrillo destruido.")
	queue_free() # Destruye el nodo de forma segura
