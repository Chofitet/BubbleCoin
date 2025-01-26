extends GridContainer


func _ready() -> void:
	var i = 0
	for bubble_data in PlayerVariables.BubbleInventory:
		var instance = Bubble.new_bubble(bubble_data, true)
		get_child(i).add_child(instance)
		i += 1
