class_name Bubble
extends Control

const bubbleScene = preload("res://Scenes/Bubble/bubble.tscn")

@export var bubble_data : BubbleData

var in_inventory = false
var buy_price
var sell_price

static func new_bubble(_bubbleData : BubbleData) -> Bubble:
	var bubble: Bubble = bubbleScene.instantiate()
	bubble.bubble_data = _bubbleData
	bubble.set_buy_price(_bubbleData.init_buy_price)
	bubble.set_sell_price(_bubbleData.init_sell_price)
	#$SellPrice.text = str(sell_price).pad_decimals(2)
	#$BuyPrice.text = str(buy_price).pad_decimals(2)
	bubble.set_name_description(_bubbleData.bubble_name,_bubbleData.modifier_description) 
	return bubble

func set_buy_price(price):
	buy_price = price
	$BuyBtn/BuyPrice.text = "Buy price: ฿ %.2f" % buy_price

func set_name_description(_name, description):
	$name.text = _name
	$ModifierDescription.text = description

func set_sell_price(price):
	sell_price = price
	$SellBtn/SellPrice.text = "Sell price: ฿ %.2f" % sell_price

func buy() -> void:
	in_inventory = true
	$SellBtn/SellPrice.visible = not in_inventory
	$BuyBtn/BuyPrice.visible = in_inventory
	PlayerVariables.AddBubble(bubble_data)
	queue_free()
	

func sell() -> void:
	PlayerVariables.RemoveBubble(bubble_data)
	queue_free()

func apply_modifier(counter):
	counter.multiplier += bubble_data.multiplier
	counter.addition +=  bubble_data.addition

func set_bubble_data(bubbleData : BubbleData):
	set_buy_price(bubbleData.init_buy_price)
	set_sell_price(bubbleData.init_sell_price)
	$name.text = bubbleData.bubble_name
	$ModifierDescription.text = bubbleData.modifier_description
