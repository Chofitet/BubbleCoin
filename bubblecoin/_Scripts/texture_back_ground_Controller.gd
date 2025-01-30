extends TextureRect

@export var TextureAnimCompra : AnimatedTexture
@export var TextureAnimVenta : AnimatedTexture
@export var TextureAnimMail : AnimatedTexture
@export var TextureAnimBubble : AnimatedTexture
@export var TextureSettingsBubble : AnimatedTexture

func _process(delta: float) -> void:
	var web = PlayerVariables.ActualWeb
	if web == "compra":
		texture = TextureAnimCompra
	elif web == "venta":
		texture = TextureAnimVenta
	elif web == "trade":
		texture = TextureAnimVenta
	elif web == "bubble":
		texture = TextureAnimBubble
	elif web == "mail":
		texture = TextureAnimMail
	elif web == "settings":
		texture = TextureSettingsBubble
