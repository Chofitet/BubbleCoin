extends GridContainer

var bubbles =[]

func _init() -> void:
	for bubble_data in MarketVariables.Get_Bubbles_Of_Day():
		var instance = Bubble.new_bubble(bubble_data,false)
		bubbles.append(instance)
		add_child(instance)
		instance.DisableButtons.connect(DisableBubbleBuy)
		if PlayerVariables.AreInventoryFull():
			instance.DisableEnableBubble(true)

func DisableBubbleBuy():
		for b in bubbles:
			if b == null : continue
			b.DisableEnableBubble(true)
