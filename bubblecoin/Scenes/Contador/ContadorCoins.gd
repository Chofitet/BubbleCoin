extends Control

@export var label : Label
@export var btnClick : Texture
@export var btnIdle : Texture

func _ready() -> void:
	$TextureRect/Clicker.pressed.connect(_on_clicker_click)

func _process(delta: float) -> void:
	set_label()

func obtener_coins(valor : float):
	PlayerVariables.BubbleCoins += valor
	set_label()
	
func gastar_coins(valor : float):
	PlayerVariables.BubbleCoins -= valor
	set_label()

func hay_suficientes_bubbles(valor : float) -> bool: 
	return valor >= PlayerVariables.BubbleCoins
 
func _on_clicker_click() -> void:
	print("click")
	var coins_por_click = PlayerVariables.AdicionClicker * PlayerVariables.MultiplicadorClicker
	obtener_coins(coins_por_click)
	$TextureRect.texture = btnClick
	await get_tree().create_timer(0.2).timeout
	$TextureRect.texture = btnIdle

func _on_burbujero_generar_burbujas() -> void:
	var coins_por_bubujero = PlayerVariables.AdicionIdle * PlayerVariables.MultiplicadorIdle
	obtener_coins(coins_por_bubujero)

func set_label():
	if label:
		label.text = "%.2f" % PlayerVariables.BubbleCoins
