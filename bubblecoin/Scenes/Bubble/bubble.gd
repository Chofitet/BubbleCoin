class_name Bubble
extends MarginContainer

const bubbleScene = preload("res://Scenes/Bubble/bubble.tscn")

@export var bubble_data : BubbleData

signal DisableButtons

static func new_bubble(_bubbleData : BubbleData, in_inventory: bool) -> Bubble:
	var bubble: Bubble = bubbleScene.instantiate()
	bubble.set_bubble_data(_bubbleData)
	bubble.set_in_inventory(in_inventory)
	
	return bubble

func set_in_inventory(in_inventory: bool) -> void:
	$HBoxContainer/MarginContainer/VBoxContainer/Control/BuyBtn.visible = not in_inventory
	$HBoxContainer/MarginContainer/VBoxContainer/Control/SellBtn.visible = in_inventory

func set_bubble_data(bubbleData : BubbleData) -> void:
	bubble_data = bubbleData
	set_buy_price(bubbleData.bubbleCalidad.price)
	set_sell_price(bubbleData.bubbleCalidad.price)
	set_name_description(bubbleData.bubbleCalidad.name, bubbleData.bubbleCalidad.modificador.ModifyDescription)
	Set_Estetica(bubbleData.bubbleCalidad)

func set_buy_price(price) -> void:
	bubble_data.buy_price = price
	$HBoxContainer/MarginContainer/VBoxContainer/Control/BuyBtn/BuyPrice.text = "%.2f" % bubble_data.buy_price

func set_sell_price(price) -> void:
	bubble_data.sell_price = price
	update_sell_price()
	
func _process(delta: float) -> void:
	update_sell_price()
	var coins = PlayerVariables.BubbleCoins
	if coins >= bubble_data.buy_price:
		$HBoxContainer/MarginContainer/VBoxContainer/Control/BuyBtn.disabled = false
	else:
		$HBoxContainer/MarginContainer/VBoxContainer/Control/BuyBtn.disabled = true

func update_sell_price() -> void:
	$HBoxContainer/MarginContainer/VBoxContainer/Control/SellBtn/SellPrice.text = "%.2f" % bubble_data.sell_price

func set_name_description(_name : String, description):
	bubble_data.bubble_name = _name
	bubble_data.modifier_description = description
	$HBoxContainer/MarginContainer/VBoxContainer/name.text = "\n".join(_name.split(" "))
	$HBoxContainer/MarginContainer/VBoxContainer/ModifierDescription.text = description

func Set_Estetica(BubbleEstetica):
	$HBoxContainer/Panel/HBoxContainer/VBoxContainer/BubbleTexture/TextureRect.texture = BubbleEstetica.BurbujasCuerpo
	print(BubbleEstetica.BurbujasCuerpo)
	$HBoxContainer/Panel/HBoxContainer/VBoxContainer/BubbleTexture/Cosmetics/Lente.texture = BubbleEstetica.lente
	$HBoxContainer/Panel/HBoxContainer/VBoxContainer/BubbleTexture/Cosmetics/Gorro.texture = BubbleEstetica.gorro
	$HBoxContainer/Panel/HBoxContainer/VBoxContainer/BubbleTexture/Cosmetics/Barba.texture = BubbleEstetica.barba

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
	$Disable.visible = x
