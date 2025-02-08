extends Resource
class_name BubbleData

var bubble_name : String
var buy_price : float
var sell_price : float
var modifier : Modificador
var cuerpo : Texture
var lente : Texture
var barba : Texture
var gorro : Texture
var increment_amount : float = 0.05
var night_increment_amount : float = 20
var bubbleCalidad : Calidad

func _init(_bubbleCalidad: Calidad) -> void:
	bubbleCalidad = _bubbleCalidad
	bubble_name = bubbleCalidad.generate_name()
	buy_price = bubbleCalidad.generate_price()
	sell_price = buy_price * 0.5
	modifier = bubbleCalidad.generate_modifier()
	cuerpo = bubbleCalidad.generate_cuerpo()
	gorro = bubbleCalidad.generate_gorro()
	lente = bubbleCalidad.generate_lente()
	barba = bubbleCalidad.generate_barba()

func increase_sell_price(fame: float, delta: float):
	#sell_price *= ((100.0 + fame) / 100.0)
	sell_price += (fame + increment_amount) * delta

func night_increase_sell_price():
	sell_price *= night_increment_amount
