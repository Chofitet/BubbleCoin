extends Node

var BubbleCoins : float

var fame : float = 0

var MaxBubbleLevel : int = 0

var BubbleInventory: Array[BubbleData]  = []

var MultiplicadorClicker = 1

var MultiplicadorIdle = 1

var AdicionClicker = 1

var AdicionIdle = 1

var unlocked_emails: Array[int] = [0]

var unlocked_tabs: Array[int] = [0,2]

func AddBubble(bubbleData):
	BubbleInventory.append(bubbleData)

func RemoveBubble(bubbleData):
	BubbleInventory.erase(bubbleData)

func SetBubbleLevel(x):
	MaxBubbleLevel = max(x,MaxBubbleLevel)

func Modifies(Modi : Modificador):
	MultiplicadorClicker += Modi.MultiplicadorClick
	MultiplicadorIdle += Modi.MultiplicadorIdle
	AdicionIdle += Modi.AdicionadorIdle
	AdicionClicker += Modi.AdicionadorClick
	
	print(MultiplicadorClicker + MultiplicadorIdle + MultiplicadorIdle + AdicionIdle)
