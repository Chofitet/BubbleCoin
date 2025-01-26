extends Resource
class_name BubbleData

@export var bubble_name : String = "";
@export var sell_price : float = 0.5;
@export var buy_price : float = 1.0;
@export var increment_amount : float = 0.05
@export var night_increment_amount : float = 20

@export var modifier_description : String = "x2 contador"

#Ver si hacer que los bonificadores sean resourses tmb
@export var multiplier : float = 2.0
@export var addition : float = 0

@export var bubbleCalidad : Calidad

func increase_sell_price(fame: float, delta: float):
	#sell_price *= ((100.0 + fame) / 100.0)
	sell_price += (fame + increment_amount) * delta

func night_increase_sell_price():
	sell_price *= night_increment_amount
