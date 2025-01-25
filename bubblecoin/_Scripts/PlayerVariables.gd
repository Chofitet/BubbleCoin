extends Node

var BubbleCoins : float

var BubbleInventory: Array[BubbleData]  = []

func AddBubble(bubbleData):
	BubbleInventory.append(bubbleData)

func RemoveBubble(bubbleData):
	BubbleInventory.erase(bubbleData)
