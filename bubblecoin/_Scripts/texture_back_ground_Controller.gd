extends TextureRect

@export var TextureAnimCompra : AnimatedTexture
@export var TextureAnimVenta : AnimatedTexture
@export var TextureAnimMail : AnimatedTexture

func _process(delta: float) -> void:
	var web = PlayerVariables.ActualWeb
	if web == "compra":
		texture = TextureAnimCompra
	elif  web == "venta":
		texture = TextureAnimVenta
	elif web == "trade":
		texture = TextureAnimVenta
	elif web == "mail":
		texture = TextureAnimMail
