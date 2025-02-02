extends Node

@export var BubblesDay1 : Array[BubbleData]  = []

@export var CalidadesBubble : Array[Calidad]
@export var ComunCalidad : Calidad

@export var probabilidades_nueva_calidad : Array[float]

func _ready() -> void:
	PlayerVariables.nuevo_dia.connect(AumentoDeNuevoDia)
	CompleteWithRandomBubbles()

func AumentoDeNuevoDia():
	for bubble_data in PlayerVariables.BubbleInventory:
		bubble_data.night_increase_sell_price()
	pass

func CompleteWithRandomBubbles():
	var playerBubbleLevel = PlayerVariables.MaxBubbleLevel
	BubblesDay1.clear()
	for i in range(0,6):
		BubblesDay1.append(BubbleResourceCreate(PlayerVariables.MaxBubbleLevel))
		
	MarketVariables.Set_Bubbles_Of_Day(BubblesDay1)

func BubbleResourceCreate(calidad_referencia : int) -> BubbleData:
	var calidadData = CalidadesBubble[calcular_calidad(calidad_referencia)]
	var bubble = BubbleData.new(calidadData)
	return bubble

func _process(delta: float) -> void:
	for bubble_data in PlayerVariables.BubbleInventory:
		bubble_data.increase_sell_price(PlayerVariables.fame, delta)

func calcular_calidad(calidad_referencia : int):
	print(str(calidad_referencia) + "refes")
	var suma_chances : float = 0.0
	for chances in probabilidades_nueva_calidad.size():
		suma_chances += probabilidades_nueva_calidad[chances]
	var resultado = randf_range(0, suma_chances)
	var n := 0
	var valor_return = 0
	for chances in probabilidades_nueva_calidad.size():
		if resultado <= probabilidades_nueva_calidad[chances] + n:
			valor_return = calidad_referencia + chances - 2
			print(str(valor_return))
			return clampi(valor_return, 0, 8)
		else:
			n += probabilidades_nueva_calidad[chances]
	return clampi(valor_return, 0, 8)
