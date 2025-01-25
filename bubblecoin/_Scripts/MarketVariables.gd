extends Node

var BubbleInMarket: Array[BubbleData]  = []

func Set_Bubbles_Of_Day(bubblesOfDay):
	BubbleInMarket = bubblesOfDay

func Get_Bubbles_Of_Day() -> Array[BubbleData]:
	return BubbleInMarket
