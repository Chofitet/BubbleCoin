extends Control

@export var btnClick : Texture
@export var btnIdle : Texture

func obtener_coins(valor : float):
	PlayerVariables.BubbleCoins += valor
	
func gastar_coins(valor : float):
	PlayerVariables.BubbleCoins -= valor

func hay_suficientes_bubbles(valor : float) -> bool: 
	return valor >= PlayerVariables.BubbleCoins

func click_down() -> void:
	var coins_por_click = PlayerVariables.AdicionClicker * PlayerVariables.MultiplicadorClicker
	obtener_coins(coins_por_click)
	$TextureRect.texture = btnClick

func click_up() -> void:
	$TextureRect.texture = btnIdle

func burbujero_timeout() -> void:
	var coins_por_bubujero = PlayerVariables.AdicionIdle * PlayerVariables.MultiplicadorIdle
	obtener_coins(coins_por_bubujero)
