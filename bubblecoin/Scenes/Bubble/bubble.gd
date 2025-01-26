class_name Bubble
extends Control

const bubbleScene = preload("res://Scenes/Bubble/bubble.tscn")

@export var bubble_data : BubbleData

@onready var buy_button = $HBoxContainer/MarginContainer/Control/BuyBtn
@onready var sell_button = $HBoxContainer/MarginContainer/Control/SellBtn

static func new_bubble(_bubbleData : BubbleData, in_inventory: bool) -> Bubble:
	var bubble: Bubble = bubbleScene.instantiate()
	bubble.set_bubble_data(_bubbleData)
	bubble.set_in_inventory(in_inventory)
	
	return bubble

func set_in_inventory(in_inventory: bool) -> void:
	$HBoxContainer/MarginContainer/Control/BuyBtn.visible = not in_inventory
	$HBoxContainer/MarginContainer/Control/SellBtn.visible = in_inventory

func set_bubble_data(bubbleData : BubbleData) -> void:
	bubble_data = bubbleData
	set_buy_price(bubbleData.bubbleCalidad.price)
	set_sell_price(bubbleData.bubbleCalidad.price)
	set_name_description(bubbleData.bubbleCalidad.name, bubbleData.bubbleCalidad.modificador.ModifyDescription)
	Set_Estetica(bubbleData.bubbleCalidad)

func set_buy_price(price) -> void:
	bubble_data.buy_price = price
	$HBoxContainer/MarginContainer/Control/BuyBtn/BuyPrice.text = "Buy price: ฿ %.2f" % bubble_data.buy_price

func set_sell_price(price) -> void:
	bubble_data.sell_price = price
	update_sell_price()
	
func _process(delta: float) -> void:
	update_sell_price()

func update_sell_price() -> void:
	$HBoxContainer/MarginContainer/Control/SellBtn/SellPrice.text = "Sell price: ฿ %.2f" % bubble_data.sell_price

func set_name_description(_name : String, description):
	bubble_data.bubble_name = _name
	bubble_data.modifier_description = description
	$HBoxContainer/MarginContainer/name.text = "%d" % _name.length()
	$HBoxContainer/MarginContainer/ModifierDescription.text = description

func Set_Estetica(BubbleEstetica):
	$HBoxContainer/Panel/TextureRect.texture = BubbleEstetica.BurbujasCuerpo
	$HBoxContainer/Panel/Lente.texture = BubbleEstetica.lente
	$HBoxContainer/Panel/Gorro.texture = BubbleEstetica.gorro
	$HBoxContainer/Panel/Barba.texture = BubbleEstetica.barba

func buy() -> void:
	PlayerVariables.AddBubble(bubble_data)
	PlayerVariables.SetBubbleLevel(bubble_data.bubbleCalidad.Level)
	MarketVariables.Remove_Bubble(bubble_data)
	PlayerVariables.Modifies(bubble_data.bubbleCalidad.modificador)
	queue_free()

func sell() -> void:
	PlayerVariables.RemoveBubble(bubble_data)
	PlayerVariables.RemoveModifies(bubble_data.bubbleCalidad.modificador)
	queue_free()

func apply_modifier(counter):
	counter.multiplier += bubble_data.multiplier
	counter.addition +=  bubble_data.addition
