extends Node

@export var BubblesDay1 : Array[BubbleData]  = []

@export var CalidadesBubble : Array[Calidad]
@export var ComunCalidad : Calidad

@export var probabilidades_nueva_calidad : Array[float]
@export var PLACEHOLDER_calidad_referencia := 5

func _ready() -> void:
	CompleteWithRandomBubbles()

func CompleteWithRandomBubbles():
	var playerBubbleLevel = PlayerVariables.MaxBubbleLevel
	BubblesDay1.clear()
	for i in range(0,6):
		BubblesDay1.append(BubbleResourceCreate(PLACEHOLDER_calidad_referencia))
		
	MarketVariables.Set_Bubbles_Of_Day(BubblesDay1)

func BubbleResourceCreate(calidad_referencia : int) -> BubbleData:
	var bubble = BubbleData.new()
	
	var calidadData = CalidadesBubble[calcular_calidad(calidad_referencia)].duplicate()
	calidadData.PicRandomBubble()
	
	bubble.bubbleCalidad = calidadData
	
	return bubble

func _process(delta: float) -> void:
	for bubble_data in PlayerVariables.BubbleInventory:
		bubble_data.increase_sell_price(PlayerVariables.fame, delta)

func calcular_calidad(calidad_referencia : int):
	var suma_chances : float
	for chances in probabilidades_nueva_calidad.size():
		suma_chances += probabilidades_nueva_calidad[chances]
	var resultado = randf_range(0, suma_chances)
	var n := 0
	var valor_return = 0
	for chances in probabilidades_nueva_calidad.size():
		if resultado <= probabilidades_nueva_calidad[chances] + n:
			valor_return = calidad_referencia + chances - 2
			return clampi(valor_return, 0, 8)
		else:
			n += probabilidades_nueva_calidad[chances]
	return clampi(valor_return, 0, 8)
