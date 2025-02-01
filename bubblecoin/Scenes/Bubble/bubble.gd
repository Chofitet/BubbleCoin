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
	set_buy_price(bubbleData.bubbleCalidad.price)
	set_sell_price(bubbleData.bubbleCalidad.price)
	set_name_description(bubbleData.bubbleCalidad.name, bubbleData.bubbleCalidad.modificador.ModifyDescription)
	Set_Estetica(bubbleData.bubbleCalidad)

static func format_price(price: float) -> String:
	return "%.2f" % price

func set_buy_price(price) -> void:
	bubble_data.buy_price = price
	%BuyButton/Label.text = format_price(bubble_data.buy_price)

func set_sell_price(price) -> void:
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

func set_name_description(_name : String, description):
	bubble_data.bubble_name = _name
	bubble_data.modifier_description = description
	# this will break with titles that have a space in between
	var name_parts = _name.split(" ")
	print(name_parts)
	%Name.text = "[p align=left]%s[/p]\n[p align=center]%s[/p]\n[p align=right]%s[/p]" % [name_parts[0], name_parts[1], name_parts[2]]
	print(%Name.text)
	var modificador = bubble_data.bubbleCalidad.modificador
	if (modificador.ModifierType.contains("Idle")):
		%ModifierType.texture = modifier_icon_idle
	else:
		%ModifierType.texture = modifier_icon_click
	%ModifierDescription.text = str(max(modificador.AdicionadorClick, modificador.AdicionadorIdle, modificador.MultiplicadorClick, modificador.MultiplicadorIdle))

func Set_Estetica(BubbleEstetica):
	%Burbuja.texture = BubbleEstetica.BurbujasCuerpo
	%Lente.texture = BubbleEstetica.lente
	%Gorro.texture = BubbleEstetica.gorro
	%Barba.texture = BubbleEstetica.barba

func buy() -> void:
	PlayerVariables.AddBubble(bubble_data)
	PlayerVariables.SetBubbleLevel(bubble_data.bubbleCalidad.Level)
	MarketVariables.Remove_Bubble(bubble_data)
	PlayerVariables.Modifies(bubble_data.bubbleCalidad.modificador)
	PlayerVariables.addSubCoins(-bubble_data.buy_price)
	if PlayerVariables.AreInventoryFull(): DisableButtons.emit()
	await get_tree().create_timer(0.1).timeout
	queue_free()

func sell() -> void:
	PlayerVariables.RemoveBubble(bubble_data)
	PlayerVariables.RemoveModifies(bubble_data.bubbleCalidad.modificador)
	PlayerVariables.addSubCoins(bubble_data.sell_price)
	queue_free()

func apply_modifier(counter):
	counter.multiplier += bubble_data.multiplier
	counter.addition +=  bubble_data.addition

func DisableEnableBubble(x):
	%Disable.visible = x
