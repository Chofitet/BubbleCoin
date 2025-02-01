extends TextureRect

@export var TextureAnimCompra : AnimatedTexture
@export var TextureAnimVenta : AnimatedTexture
@export var TextureAnimMail : AnimatedTexture
@export var TextureAnimBubble : AnimatedTexture
@export var TextureAnimSettings : AnimatedTexture

func _ready() -> void:
	PlayerVariables.ChangedWeb.connect(update_texture)

func update_texture(web : String):
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
		texture = TextureAnimSettings
