extends Node

signal nuevo_dia(nuevo_dia : int)

var BubbleCoins : float = 0.0

var fame : float = 0

var MaxBubbleLevel : int = 0

var BubbleInventory: Array[BubbleData] = []

var MultiplicadorClicker = 1

var MultiplicadorIdle = 1

var AdicionClicker = 1

var AdicionIdle = 0

var unlocked_emails: Array[int] = []

var unlocked_tabs: Array[int] = [0,2,3]

var ActualWeb

var dia : int = 0

var compro_burbuja_final := false

var final_activo := false

signal ChangedWeb(web: String)

func BuyBubble(bubbleData : BubbleData):
	AddBubble(bubbleData)
	addSubCoins(-bubbleData.buy_price)
	
func SellBubble(bubbleData: BubbleData):
	RemoveBubble(bubbleData)
	addSubCoins(bubbleData.sell_price)

func AddBubble(bubbleData):
	BubbleInventory.append(bubbleData)
	UpdateBubbleLevel(bubbleData.bubbleCalidad.Level)
	UpdateModifier(bubbleData.modifier)

func SetActualWeb(txt):
	ActualWeb = txt
	ChangedWeb.emit(txt)

func AreInventoryFull() -> bool:
	if BubbleInventory.size() == 6:
		return true
	return false
	
func RemoveBubble(bubbleData):
	BubbleInventory.erase(bubbleData)
	RemoveModifier(bubbleData.modifier)

func UpdateBubbleLevel(x : int):
	MaxBubbleLevel = max(x,MaxBubbleLevel)

func UpdateModifier(Modi : Modificador):
	MultiplicadorClicker += Modi.MultiplicadorClick
	MultiplicadorIdle += Modi.MultiplicadorIdle
	AdicionIdle += Modi.AdicionadorIdle
	AdicionClicker += Modi.AdicionadorClick
	
	print(MultiplicadorClicker + MultiplicadorIdle + MultiplicadorIdle + AdicionIdle)

func RemoveModifier(Modi : Modificador):
	MultiplicadorClicker -= Modi.MultiplicadorClick
	MultiplicadorIdle -= Modi.MultiplicadorIdle
	AdicionIdle -= Modi.AdicionadorIdle
	AdicionClicker -= Modi.AdicionadorClick

func addSubCoins(coins):
	BubbleCoins += coins

func siguiente_dia():
	dia += 1
	unlocked_emails.clear()
	nuevo_dia.emit(PlayerVariables.dia)
