extends GridContainer

func _init() -> void:
	for bubble_data in MarketVariables.Get_Bubbles_Of_Day():
		var instance = Bubble.new_bubble(bubble_data)
		add_child(instance)
