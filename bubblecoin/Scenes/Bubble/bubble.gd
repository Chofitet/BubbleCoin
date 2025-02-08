class_name Bubble
extends Control

const bubbleScene = preload("res://Scenes/Bubble/bubble.tscn")

@export var bubble_data : BubbleData

const modifier_icon_idle = preload("uid://b44tlbxvufmxk")
const modifier_icon_click = preload("uid://d1cc73dviqote")

signal DisableButtons

static func new_bubble(_bubbleData : BubbleData, in_inventory: bool) -> Bubble:
	var bubble: Bubble = bubbleScene.instantiate()
	bubble.set_bubble_data(_bubbleData)
	bubble.set_in_inventory(in_inventory)
	return bubble

func set_in_inventory(in_inventory: bool) -> void:
	%BuyButton.visible = not in_inventory
	%SellButton.visible = in_inventory

func set_bubble_data(bubbleData : BubbleData) -> void:
	bubble_data = bubbleData
	set_buy_price(bubbleData.buy_price)
	set_sell_price(bubbleData.sell_price)
	set_bubble_name(bubbleData.bubble_name)
	set_modifier(bubbleData.modifier)
	Set_Estetica(bubbleData)

static func format_price(price: float) -> String:
	return "%.2f" % price

func set_buy_price(price : float) -> void:
	bubble_data.buy_price = price
	%BuyButton/Label.text = format_price(bubble_data.buy_price)

func set_sell_price(price : float) -> void:
	bubble_data.sell_price = price
	update_sell_price()
	
func _process(_delta: float) -> void:
	update_sell_price()
	var coins = PlayerVariables.BubbleCoins
	if coins >= bubble_data.buy_price:
		%BuyButton.disabled = false
	else:
		%BuyButton.disabled = true

func update_sell_price() -> void:
	%SellButton/Label.text = format_price(bubble_data.sell_price)

func set_bubble_name(bubble_name : String) -> void:
	var name_parts = bubble_data.bubble_name.split("\n")
	%Name.text = "[p align=left]%s[/p]\n[p align=center]%s[/p]\n[p align=right]%s[/p]" % [name_parts[0], name_parts[1], name_parts[2]]

func set_modifier(modifier: Modificador) -> void:
	if (modifier.ModifierType.contains("Idle")):
		%ModifierType.texture = modifier_icon_idle
	else:
		%ModifierType.texture = modifier_icon_click
	%ModifierDescription.text = str(max(modifier.AdicionadorClick, modifier.AdicionadorIdle, modifier.MultiplicadorClick, modifier.MultiplicadorIdle))

func Set_Estetica(BubbleEstetica : BubbleData):
	%Burbuja.texture = BubbleEstetica.cuerpo
	%Lente.texture = BubbleEstetica.lente
	%Gorro.texture = BubbleEstetica.gorro
	%Barba.texture = BubbleEstetica.barba

func buy() -> void:
	PlayerVariables.BuyBubble(bubble_data)
	MarketVariables.RemoveBubble(bubble_data)
	if PlayerVariables.AreInventoryFull(): DisableButtons.emit()
	#await get_tree().create_timer(0.1).timeout
	queue_free()

func sell() -> void:
	PlayerVariables.SellBubble(bubble_data)
	queue_free()

func DisableEnableBubble(x):
	%Disable.visible = x
