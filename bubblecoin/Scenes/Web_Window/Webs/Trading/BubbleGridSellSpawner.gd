extends GridContainer

var closing_inventory = false

func _ready() -> void:
	var i = 0
	for bubble_data in PlayerVariables.BubbleInventory:
		var instance := Bubble.new_bubble(bubble_data, true)
		instance.tree_exited.connect(sort_inventory)
		get_child(i).add_child(instance)
		i += 1

func _exit_tree() -> void:
	closing_inventory = true

func sort_inventory():
	if closing_inventory:
		return
	print("sorting inventory!")
	var found_non_empty_child = false
	for i in range(get_child_count()-1, -1, -1):
		var child = get_child(i)
		if child.get_child_count() > 0:
			found_non_empty_child = true
		if child.get_child_count() == 0 and found_non_empty_child:
			child.move_to_front()
