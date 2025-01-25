extends Control

@export var bubble_name : String = "";
@export var sell_price : float = 1.0;
@export var buy_price : float = 1.0;
@export var in_inventory : bool = false;

@export var modifier_description : String = "x2 contador"
@export var multiplier : float = 2.0
@export var addition : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button.text = bubble_name
	set_buy_price(buy_price)
	set_sell_price(sell_price)
	#$SellPrice.text = str(sell_price).pad_decimals(2)
	#$BuyPrice.text = str(buy_price).pad_decimals(2)
	$ModifierDescription.text = modifier_description
	
	$SellPrice.visible = not in_inventory
	$BuyPrice.visible = in_inventory
	
	pass # Replace with function body.

func set_buy_price(price):
	buy_price = price
	$BuyPrice.text = "Buy price: ฿ %.2f" % buy_price


func set_sell_price(price):
	sell_price = price
	$SellPrice.text = "Sell price: ฿ %.2f" % sell_price

func buy() -> void:
	in_inventory = true
	$SellPrice.visible = not in_inventory
	$BuyPrice.visible = in_inventory
	

func apply_modifier(counter):
	counter.multiplier += multiplier
	counter.addition += addition
