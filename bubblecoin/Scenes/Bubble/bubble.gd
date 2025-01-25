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

func set_bubble_data(bubbleData : BubbleData) -> void:
	bubble_data = bubbleData
	set_buy_price(bubbleData.buy_price)
	set_sell_price(bubbleData.sell_price)
	set_name_description(bubbleData.bubble_name, bubbleData.modifier_description)

func set_buy_price(price) -> void:
	bubble_data.buy_price = price
	$BuyBtn/BuyPrice.text = "Buy price: ฿ %.2f" % bubble_data.buy_price

func set_sell_price(price) -> void:
	bubble_data.sell_price = price
	update_sell_price()
	
func _process(delta: float) -> void:
	update_sell_price()

func update_sell_price() -> void:
	$SellBtn/SellPrice.text = "Sell price: ฿ %.2f" % bubble_data.sell_price

func set_name_description(_name, description):
	bubble_data.bubble_name = _name
	bubble_data.modifier_description = description
	$name.text = bubble_data.bubble_name
	$ModifierDescription.text = bubble_data.modifier_description

func buy() -> void:
	PlayerVariables.AddBubble(bubble_data)
	MarketVariables.Remove_Bubble(bubble_data)
	queue_free()

func sell() -> void:
	PlayerVariables.RemoveBubble(bubble_data)
	queue_free()

func apply_modifier(counter):
	counter.multiplier += bubble_data.multiplier
	counter.addition +=  bubble_data.addition
