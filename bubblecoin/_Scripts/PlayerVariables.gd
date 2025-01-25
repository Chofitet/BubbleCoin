extends Node

var BubbleCoins : float

var fame : float = 0

var MaxBubbleLevel : int

var BubbleInventory: Array[BubbleData]  = []

const unlocked_emails: Array[int] = [0]

var unlocked_tabs: Array[int] = [0]

func AddBubble(bubbleData):
	BubbleInventory.append(bubbleData)

func RemoveBubble(bubbleData):
	BubbleInventory.erase(bubbleData)

func SetBubbleLevel(x):
	MaxBubbleLevel = x
