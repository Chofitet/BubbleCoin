extends GridContainer

var bubbles =[]

func _ready() -> void:
	for bubble_data in MarketVariables.Get_Bubbles_Of_Day():
		var instance = Bubble.new_bubble(bubble_data,false)
		bubbles.append(instance)
		get_child(bubbles.size()-1).add_child(instance)
		instance.DisableButtons.connect(DisableBubbleBuy)
		if PlayerVariables.AreInventoryFull():
			instance.DisableEnableBubble(true)

func DisableBubbleBuy():
		for b in bubbles:
			if b == null : continue
			b.DisableEnableBubble(true)
