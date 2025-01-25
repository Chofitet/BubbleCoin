extends Node

var BubbleInMarket: Array[BubbleData]  = []

func Set_Bubbles_Of_Day(bubblesOfDay):
	BubbleInMarket = bubblesOfDay

func Get_Bubbles_Of_Day() -> Array[BubbleData]:
	return BubbleInMarket

func Remove_Bubble(bubbleToRemove):
	for b in BubbleInMarket:
		if b == bubbleToRemove:
			BubbleInMarket.erase(bubbleToRemove)
