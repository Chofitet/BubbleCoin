extends Node

@export var BubblesDay1 : Array[BubbleData]  = []

func _ready() -> void:
	MarketVariables.Set_Bubbles_Of_Day(BubblesDay1)
