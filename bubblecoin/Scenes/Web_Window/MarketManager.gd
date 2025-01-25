extends Node

@export var BubblesDay1 : Array[BubbleData]  = []

@export var ComunCalidad : Calidad

func _ready() -> void:
	CompleteWithRandomBubbles()

func CompleteWithRandomBubbles():
	var playerBubbleLevel = PlayerVariables.MaxBubbleLevel
	BubblesDay1.clear()
	for i in range(0,6):
		BubblesDay1.append(BubbleResourceCreate())
	MarketVariables.Set_Bubbles_Of_Day(BubblesDay1)

func BubbleResourceCreate() -> BubbleData:
	var bubble = BubbleData.new()
	
	var calidadData = ComunCalidad.duplicate()
	calidadData.PicRandomBubble()
	
	bubble.bubbleCalidad = calidadData
	
	return bubble


func _process(delta: float) -> void:
	for bubble_data in PlayerVariables.BubbleInventory:
		bubble_data.increase_sell_price(PlayerVariables.fame, delta)
