class_name Bubble
extends Control

const bubbleScene = preload("res://Scenes/Bubble/bubble.tscn")

@export var bubble_data : BubbleData

static func new_bubble(_bubbleData : BubbleData, in_inventory: bool) -> Bubble:
	var bubble: Bubble = bubbleScene.instantiate()
	bubble.set_bubble_data(_bubbleData)
	bubble.set_in_inventory(in_inventory)
	return bubble

func set_in_inventory(in_inventory: bool) -> void:
	$BuyBtn.visible = not in_inventory
	$SellBtn.visible = in_inventory

func set_bubble_data(bubbleData : BubbleData):
	bubble_data = bubbleData
	set_buy_price(bubbleData.init_buy_price)
	set_sell_price(bubbleData.init_sell_price)
	set_name_description(bubbleData.bubble_name, bubbleData.modifier_description)

func set_buy_price(price):
	$BuyBtn/BuyPrice.text = "Buy price: ฿ %.2f" % price

func set_sell_price(price):
	$SellBtn/SellPrice.text = "Sell price: ฿ %.2f" % price

func set_name_description(_name, description):
	$name.text = _name
	$ModifierDescription.text = description

func buy() -> void:
	PlayerVariables.AddBubble(bubble_data)
	queue_free()

func sell() -> void:
	PlayerVariables.RemoveBubble(bubble_data)
	queue_free()

func apply_modifier(counter):
	counter.multiplier += bubble_data.multiplier
	counter.addition +=  bubble_data.addition
