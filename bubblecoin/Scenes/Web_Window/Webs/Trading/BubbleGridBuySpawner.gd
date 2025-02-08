extends GridContainer

var closing_shop := false

func _ready() -> void:
	var i = 0
	for bubble_data in MarketVariables.Get_Bubbles_Of_Day():
		var instance = Bubble.new_bubble(bubble_data,false)
		get_child(i).add_child(instance)
		instance.DisableButtons.connect(DisableBubbleBuy)
		instance.tree_exited.connect(sort_shop)
		if PlayerVariables.AreInventoryFull():
			instance.DisableEnableBubble(true)
		i += 1

func DisableBubbleBuy():
	for control_child in get_children():
		for bubble_child in control_child.get_children():
			if bubble_child is Bubble:
				bubble_child.DisableEnableBubble(true)

func _exit_tree() -> void:
	closing_shop = true

func sort_shop():
	if closing_shop:
		return
	print("sorting shop!")
	var found_non_empty_child = false
	for i in range(get_child_count()-1, -1, -1):
		var child = get_child(i)
		if child.get_child_count() > 0:
			found_non_empty_child = true
		if child.get_child_count() == 0 and found_non_empty_child:
			child.move_to_front()
