extends Node2D

@export var coins := 0
@export var coins_por_click := 1
@export var coins_por_bubujero := 1
@export var label : Label

func obtener_coins(valor : float):
	coins += valor
	set_label()
	
func gastar_coins(valor : float):
	coins -= valor
	set_label()

func hay_suficientes_bubbles(valor : float) -> bool: 
	return valor >= coins
 
func _on_clicker_click() -> void:
	obtener_coins(coins_por_click)

func _on_burbujero_generar_burbujas() -> void:
	obtener_coins(coins_por_bubujero)

func set_label():
	if label:
		label.text = str(coins)
