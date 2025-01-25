extends Node

@export var BubblesDay1 : Array[BubbleData]  = []

func _ready() -> void:
	MarketVariables.Set_Bubbles_Of_Day(BubblesDay1)


func _process(delta: float) -> void:
	for bubble_data in PlayerVariables.BubbleInventory:
		bubble_data.increase_sell_price(PlayerVariables.fame, delta)
