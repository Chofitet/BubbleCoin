extends TextureRect

@export var ads : Array[Texture2D] = []

func _process(delta: float) -> void:
	texture = ads[PlayerVariables.dia]
	pass
