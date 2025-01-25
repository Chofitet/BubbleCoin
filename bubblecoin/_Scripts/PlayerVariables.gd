extends Node

var BubbleCoins : float

var fame : float = 1

var BubbleInventory: Array[BubbleData]  = []

var unlocked_emails: Array[int] = [0]

func AddBubble(bubbleData):
	BubbleInventory.append(bubbleData)

func RemoveBubble(bubbleData):
	BubbleInventory.erase(bubbleData)
