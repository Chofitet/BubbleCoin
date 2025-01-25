extends GridContainer


func _init() -> void:
	
	for bubble_data in PlayerVariables.BubbleInventory:
		var instance = Bubble.new_bubble(bubble_data)
		add_child(instance)
	
