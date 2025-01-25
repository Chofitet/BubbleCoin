extends Node

var BubbleCoins : float

var fame : float = 1

var BubbleInventory: Array[BubbleData]  = []

func AddBubble(bubbleData):
	BubbleInventory.append(bubbleData)

func RemoveBubble(bubbleData):
	BubbleInventory.erase(bubbleData)
